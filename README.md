
# Task 3 – Provision EC2 and Deploy Strapi in EC2 using Terraform

## Introduction

In this project, I provisioned an AWS EC2 instance using Terraform and deployed a Strapi application on it.
The goal of this task was to automate infrastructure creation, manage SSH access using Terraform, and run a Strapi application on the EC2 instance.

This project helped me understand Terraform basics, module usage, SSH key management, and application deployment on AWS.

---

## What I Implemented

* Created an EC2 instance using Terraform
* Used Terraform module structure for EC2 creation
* Generated and managed SSH key pair using Terraform
* Connected to EC2 using SSH
* Installed Node.js on the EC2 instance
* Installed and ran Strapi application in VM
* Pushed code to GitHub and created a Pull Request

---

## Project Structure

```
task3/
├── provider.tf
├── keypair.tf
└── modules/
    └── ec2/
        ├── main.tf
        └── variables.tf
```

---

## Terraform Provider Configuration

I configured the AWS provider with a specific region so Terraform can communicate with AWS and create resources.

---

## SSH Key Pair Creation using Terraform

Instead of creating the key pair manually in the AWS Console, I used Terraform to manage it.

* Terraform generates an RSA private key
* The public key is uploaded to AWS as a key pair
* The private key is saved locally as a `.pem` file
* This key is later used to SSH into the EC2 instance

This approach avoids manual steps and keeps everything automated.

---

## Terraform Module Usage

I used a Terraform module for EC2 creation to keep the code organized and reusable.

* The root configuration handles provider and key creation
* The EC2 module is responsible only for creating the EC2 instance
* The key name is passed as an input to the module using `variables.tf`

This separation made the code easier to understand and manage.

---

## EC2 Instance Creation

Inside the EC2 module, I defined the EC2 instance with:

* AMI ID
* Instance type
* SSH key name
* User data to install Node.js and npm

After running `terraform apply`, the EC2 instance was created successfully.

---

## SSH into EC2 Instance

After the EC2 instance was created, I connected to it using SSH.

Since the instance uses Amazon Linux, I logged in using the `ec2-user` username and the Terraform-generated `.pem` file.

---

## Strapi Installation and Execution

On the EC2 instance, I:

* Installed Node.js and npm
* Installed Yarn
* Created a new Strapi application using `npx create-strapi-app`
* Started Strapi using `npx strapi develop`

After opening port 1337 in the EC2 security group, I was able to access the Strapi admin panel using the EC2 public IP.

---

## Issues Faced and How I Fixed Them

* **Terraform keyname input error**: Fixed by correctly passing the key name as variable to the module
* **Userdata error** I faced an issue where the user data script did not install Node.js because Ubuntu-specific commands(apt) were used on an Amazon Linux instance. I resolved this by identifying the correct OS and installing the required packages(dnf) manually after SSH access.
* **Strapi installation taking long time**: This was due to limited EC2 resources; waiting resolved it
* **Strapi application doesnt start**: I resolved the Strapi startup issue by using npx create-strapi-app strapi-app --quickstart, which automatically completed the setup and started the application.

These issues helped me better understand Terraform dependencies, SSH authentication, and application deployment.

---

## Git and Pull Request

After completing the setup, I pushed the Terraform code to GitHub and created a Pull Request for submission.

---

## Conclusion

This project helped me gain hands-on experience with Terraform, AWS EC2, SSH key management, and deploying a real-world application like Strapi.
It improved my understanding of Infrastructure as Code and basic DevOps workflows.

---

