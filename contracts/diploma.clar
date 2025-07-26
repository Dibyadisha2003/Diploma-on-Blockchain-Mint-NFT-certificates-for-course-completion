;; Diploma NFT Certificate Contract
;; A smart contract for minting NFT certificates for course completion

;; Define the NFT
(define-non-fungible-token diploma-certificate uint)

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-minted (err u102))
(define-constant err-invalid-student (err u103))

;; Data variables
(define-data-var next-certificate-id uint u1)

;; Certificate metadata structure
(define-map certificate-metadata
  uint
  {
    student: principal,
    course-name: (string-ascii 100),
    completion-date: uint,
    instructor: (string-ascii 50),
    grade: (string-ascii 10)
  }
)

;; Track certificates by student
(define-map student-certificates principal (list 50 uint))

;; Function 1: Mint NFT certificate for course completion
(define-public (mint-certificate 
  (student principal) 
  (course-name (string-ascii 100)) 
  (instructor (string-ascii 50)) 
  (grade (string-ascii 10)))
  (let ((certificate-id (var-get next-certificate-id)))
    (begin
      ;; Only contract owner (institution) can mint certificates
      (asserts! (is-eq tx-sender contract-owner) err-owner-only)
      
      ;; Mint the NFT to the student
      (try! (nft-mint? diploma-certificate certificate-id student))
      
      ;; Store certificate metadata
      (map-set certificate-metadata certificate-id
        {
          student: student,
          course-name: course-name,
          completion-date: stacks-block-height,
          instructor: instructor,
          grade: grade
        }
      )
      
      ;; Update student's certificate list
      (let ((current-certificates (default-to (list) (map-get? student-certificates student))))
        (map-set student-certificates student (unwrap-panic (as-max-len? (append current-certificates certificate-id) u50)))
      )
      
      ;; Increment certificate ID for next minting
      (var-set next-certificate-id (+ certificate-id u1))
      
      ;; Return the certificate ID
      (ok certificate-id)
    )
  )
)

;; Function 2: Get certificate details and verify authenticity
(define-read-only (get-certificate-details (certificate-id uint))
  (let ((metadata (map-get? certificate-metadata certificate-id)))
    (match metadata
      certificate-data 
      (ok {
        certificate-id: certificate-id,
        student: (get student certificate-data),
        course-name: (get course-name certificate-data),
        completion-date: (get completion-date certificate-data),
        instructor: (get instructor certificate-data),
        grade: (get grade certificate-data),
        owner: (unwrap-panic (nft-get-owner? diploma-certificate certificate-id))
      })
      err-not-found
    )
  )
)

;; Additional helper functions

;; Get all certificates for a student
(define-read-only (get-student-certificates (student principal))
  (ok (default-to (list) (map-get? student-certificates student)))
)

;; Get next certificate ID
(define-read-only (get-next-certificate-id)
  (ok (var-get next-certificate-id))
)

;; Check if certificate exists
(define-read-only (certificate-exists (certificate-id uint))
  (is-some (map-get? certificate-metadata certificate-id))
)