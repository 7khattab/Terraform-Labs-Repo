# 🚀 Terraform Labs for DevOps

![Terraform](https://img.shields.io/badge/Terraform-Hands--On-blueviolet?logo=terraform)
![Status](https://img.shields.io/badge/Status-Completed-green)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## 🧠 What I Learned

As part of my DevOps training, I explored Terraform to learn how to provision, manage, and destroy infrastructure as code (IaC) on AWS.

Through these hands-on labs, I practiced:

- Writing reusable and modular Terraform code  
- Creating and managing AWS resources (EC2, VPC, S3, IAM, etc.)  
- Working with provisioners, modules, variables, and Terraform CLI  
- Managing infrastructure state and using advanced features like workspaces  
- Implementing real-world DevOps tasks with automation  

This repository contains my step-by-step labs and code examples demonstrating my Terraform knowledge in real use cases.

---

## 📂 Repository Structure

Each lab is organized into folders:


---

## 📚 Lab Index with Descriptions

| Lab | Description |
|-----|-------------|
| **lab1** | ✅ Create a new VPC and a public subnet, launch an EC2 instance (t2.micro) tagged `dolfined_instance` with public IP inside the subnet using an IAM user. |
| **lab2** | ✅ Create an IAM user, a NAT Gateway with an Elastic IP, and display EIP, ARN, and NAT ID. Finally, destroy all resources using `terraform destroy`. |
| **lab3** | ✅ Create a private S3 bucket tagged `terraform_bucket`, a security group with inbound rule for `192.168.120.0/24`, restrict Terraform version to `~> 1.5.x`, update tag, selectively refresh/destroy resources. |
| **lab4** | ✅ Provision Apache on EC2 using **remote provisioner**, store private IP locally using **local provisioner**, and destroy all without prompt. |
| **lab5** | ✅ Use an IAM user with admin access to create two EC2 instances in `us-east-1` and `us-west-1`, import manually created resources into Terraform, maintain desired state, list resources using CLI, and handle configuration drift. |
| **lab6** | ✅ Create multiple EC2 instances dynamically using variables, `count`, `count.index`, and string interpolation for unique names. |
| **lab7** | ✅ Build and explain **local modules** in Terraform for reusability and organization. |
| **lab8** | ✅ Use **Terraform Workspaces** (`dev`, `staging`, `prod`) to dynamically change EC2 instance type (`t2.micro`, `t2.medium`, `t2.large`) based on the active workspace. |

---

## 🛠️ How to Use

1. Clone the repo:
```bash
git clone https://github.com/7khattab/terraform-labs.git
cd terraform-labs




