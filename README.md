\# Enterprise DEV Platform



\## Project Overview



This project demonstrates an enterprise-style AWS development environment using Infrastructure as Code, version control, automation, and AWS services.



\## Architecture



The project uses:



\- AWS CloudFormation

\- Amazon EC2

\- Amazon S3

\- AWS IAM

\- AWS Systems Manager

\- Apache HTTP Server

\- Git

\- CI/CD



\## Project Structure



enterprise-dev-platform/

├── Apache/

│   └── httpd.conf

├── Application/

│   └── index.html

├── Infrastructure/

│   └── dev-environment.yaml

├── Scripts/

│   └── bootstrap.sh

└── README.md



\## Deployment Workflow



Developer

&#x20;   ↓

Git Repository

&#x20;   ↓

CI/CD

&#x20;   ↓

Amazon S3 Release

&#x20;   ↓

CloudFormation

&#x20;   ↓

EC2

&#x20;   ↓

Apache



\## Objective



The objective is to create reproducible DEV/TEST environments that can be created and removed when needed, reducing infrastructure costs while maintaining configuration and application versions.



\## Security



EC2 instances are managed through AWS Systems Manager instead of direct SSH access.



IAM roles provide temporary AWS credentials to EC2.



AWS credentials and private keys must never be stored in this repository.

