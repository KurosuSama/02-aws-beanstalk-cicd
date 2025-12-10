# AWS Beanstalk App Stack
Cloud-native application deployed automatically via CI/CD Git Actions on AWS Elastic Beanstalk using PaaS model

## 🛠️ Technologies Used

### Cloud Services Stack (AWS)

This is the core set of services required to run the application in the cloud:

* **Web Server / Reverse Proxy:** EC2 + AWS Load Balancer (ELB)
* **Application Server:** AWS Elastic Beanstalk (Tomcat Platform)
* **Database:** Amazon RDS (MySQL)
* **Message Broker:** Amazon MQ (RabbitMQ)
* **Cache:** Amazon ElastiCache (Memcached)
* **Monitoring**: Amazon CloudWatch

### Development & Deployment

These tools are used to build, manage, and deploy the stack:

* **Build Tool:** Maven
* **CI/CD Pipeline:** GitHub Actions
* **Artifact Storage:** Amazon S3
* **Environment Management:** AWS Elastic Beanstalk

## 💡 Motivation

After deploying the project on a remote server and administering it, several problems arose with management, scaling, updating and security. The main one in my opinion is human factor, all actions required actions from the "human" side. I wasn't satisfied with this, so I decided to try to deploy the stack using the AWS PAAS architecture + automate the application delivery and infrastructure provisioning by implementing the CI/CD process

For the project, I took Beanstalk running on the Tomcat, which I was familiar, and at that time, a completely new GitHub Actions. The main task is to implement a solution that would eliminate the shortcomings that existed before

## ⚙️ Key Improvements

### Previously (The Old Way)

The previous deployment strategy relied heavily on manual configuration and direct server access. While functional for a small scale, this approach introduced critical security risks, lacked centralized observability, and required significant operational effort for maintenance.

This approach had several significant drawbacks:

* **Security Risks:** Sensitive configuration data was hardcoded directly into the source code. Additionally, maintenance required direct SSH access to production servers, making it difficult to control or audit who accessed the system.
* **Inefficient Deployment:** Updates were manual and decentralized. To deploy a new version, we had to manually pull code changes on every single server individually, which often led to delays and version inconsistencies across the infrastructure.
* **Lack of Observability:** The system lacked a centralized dashboard or monitoring solution. We had no real-time visibility into server health, making it impossible to diagnose issues without manually inspecting each instance.
* **No Auto-Healing:** There was no fault tolerance mechanism. If an application instance crashed, it required manual intervention to restart, leading to unavoidable downtime.
* **Operational Overhead:** Scaling the infrastructure or managing multiple servers required repetitive manual actions, significantly increasing the risk of human error.

### Current Solution (New Architecture)

To address these challenges, we migrated the application to **AWS Elastic Beanstalk**, utilizing a fully automated CI/CD pipeline via **GitHub Actions**. This transition to a Platform-as-a-Service (PaaS) model eliminated manual server management and ensured a robust, production-ready environment.

Key benefits of the new architecture:

* **Enhanced Security:** Credentials and sensitive data are removed from the source code. They are now securely managed via GitHub Secrets and injected as environment variables during runtime, following security best practices.
* **Automated CI/CD Pipeline:** The deployment process is fully automated. Any code push triggers a GitHub Action that builds the artifact (Maven), uploads it to S3, and updates the Beanstalk environment without human intervention.
* **Management:** Configuration changes, environment variables, and platform updates are handled directly through the AWS Console. This abstracts away the underlying infrastructure complexity, allowing for easy adjustments without direct server access.
* **Centralized Observability**: System monitoring is centralized through Amazon CloudWatch integration. This aggregates logs, metrics, and health status into a single interface, giving us real-time insight into infrastructure health without manual checks.
* **High Availability & Auto-Healing:** The infrastructure is now self-healing. AWS Elastic Beanstalk automatically monitors instance health; if a server fails, it is automatically replaced, minimizing downtime.
* **Scalability:** We utilize a Load Balancer and Auto Scaling Groups. The system can automatically add or remove instances based on traffic load, ensuring performance efficiency without manual scaling.
