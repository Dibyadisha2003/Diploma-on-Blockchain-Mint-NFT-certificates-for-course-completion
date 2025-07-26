# Diploma NFT Certificate Smart Contract

## Project Title
**Blockchain-Based Diploma Certification System** - NFT Certificates for Course Completion

## Project Description
This Clarity smart contract implements a decentralized diploma certification system that mints Non-Fungible Tokens (NFTs) as digital certificates for course completion. The system allows educational institutions to issue tamper-proof, verifiable digital diplomas and certificates on the Stacks blockchain. Each certificate is unique, contains comprehensive metadata about the course and student, and can be verified by anyone on the blockchain.

### Key Features:
- **NFT-based Certificates**: Each diploma is minted as a unique NFT
- **Immutable Records**: Certificate data is permanently stored on the blockchain
- **Institutional Control**: Only authorized institutions can mint certificates
- **Easy Verification**: Anyone can verify certificate authenticity
- **Student Portfolio**: Students can view all their earned certificates
- **Comprehensive Metadata**: Includes course name, completion date, instructor, and grade

## Project Vision
Our vision is to revolutionize the educational credentialing system by creating a decentralized, transparent, and globally accessible platform for diploma verification. We aim to eliminate fraudulent certificates, reduce verification costs, and provide students with portable digital credentials that they truly own and control.

### Core Objectives:
- **Trust & Transparency**: Establish a trustworthy system for academic credentials
- **Global Accessibility**: Enable worldwide verification of educational achievements
- **Student Empowerment**: Give students ownership of their academic credentials
- **Institution Efficiency**: Streamline the certificate issuance and verification process
- **Fraud Prevention**: Create tamper-proof certificates that cannot be forged

## Future Scope

### Phase 1 Enhancements:
- **Multi-Institution Support**: Allow multiple educational institutions to use the contract
- **Credential Templates**: Predefined templates for different types of certificates
- **Batch Minting**: Issue multiple certificates in a single transaction
- **Certificate Revocation**: Ability to revoke certificates if needed

### Phase 2 Developments:
- **Integration APIs**: RESTful APIs for easy integration with existing LMS systems
- **Mobile Application**: Student and employer mobile apps for certificate management
- **Advanced Metadata**: Support for images, logos, and rich certificate designs
- **Skill Verification**: Integration with skill assessment platforms

### Phase 3 Expansion:
- **Micro-Credentials**: Support for smaller achievements and skill-based certificates
- **Cross-Chain Compatibility**: Bridge to other blockchains for wider adoption
- **AI-Powered Verification**: Automated verification systems for employers
- **Marketplace Integration**: Professional networking platform integration

### Long-term Vision:
- **Global Education Network**: Connect institutions worldwide in a unified credentialing system
- **Career Path Tracking**: Enable comprehensive career development tracking
- **Employer Dashboard**: Streamlined hiring processes with instant credential verification
- **Government Integration**: Official recognition by educational authorities

## Contract Functions

### Main Functions:

#### 1. `mint-certificate`
```clarity
(mint-certificate (student principal) (course-name (string-ascii 100)) (instructor (string-ascii 50)) (grade (string-ascii 10)))
```
- **Purpose**: Mints a new NFT certificate for a student upon course completion
- **Access**: Only contract owner (educational institution)
- **Parameters**:
  - `student`: The recipient's wallet address
  - `course-name`: Name of the completed course
  - `instructor`: Name of the course instructor
  - `grade`: Final grade achieved
- **Returns**: Certificate ID if successful

#### 2. `get-certificate-details`
```clarity
(get-certificate-details (certificate-id uint))
```
- **Purpose**: Retrieves comprehensive details of a specific certificate
- **Access**: Public (read-only)
- **Parameters**:
  - `certificate-id`: Unique identifier of the certificate
- **Returns**: Complete certificate metadata including student, course details, and current owner

### Helper Functions:
- `get-student-certificates`: View all certificates earned by a student
- `get-next-certificate-id`: Get the next available certificate ID
- `certificate-exists`: Check if a certificate ID exists

## Contract Address
**Testnet Address**: `[ST1S2QEVRX95BT8VG90HEJDYM4RXZKFB6AHZ3SH8E.diploma]`
<img width="1890" height="868" alt="Screenshot 2025-07-26 130622" src="https://github.com/user-attachments/assets/0d49f0ed-8cd9-4dd3-8ca7-ecd71593a882" />


### Deployment Instructions:
1. Clone the repository
2. Install Clarinet CLI tool
3. Run `clarinet deploy` for testnet deployment
4. Verify contract on Stacks Explorer

### Usage Example:
```clarity
;; Mint a certificate
(contract-call? .diploma-certificate mint-certificate 
  'SP1234... 
  "Advanced Blockchain Development" 
  "Dr. Smith" 
  "A+")

;; Verify certificate
(contract-call? .diploma-certificate get-certificate-details u1)
```

## Technical Requirements
- **Blockchain**: Stacks Blockchain
- **Language**: Clarity Smart Contract Language
- **Standards**: SIP-009 (NFT Standard)
- **Tools**: Clarinet, Stacks CLI

## Security Features
- Access control for certificate minting
- Immutable certificate records
- Ownership verification
- Tamper-proof metadata storage

---

*This project represents the future of academic credentialing, combining blockchain technology with educational excellence to create a trustworthy, efficient, and student-centric certification system.*
