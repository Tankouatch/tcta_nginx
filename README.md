How does the Code works:
The code as a whole has seven files:
1. cert.tf for certification 
2. data.tf
3. Keypair.tf
4. lb_sg.tf
5. main.tf
6. provider.tf
7. variables.tf
   
This project use to create a t4g.nano EC2 instance behind a load balancer that serves the Nginx "Welcome to Nginx" default webpage and optionally uses an ACM certificate for HTTPS, you can follow these steps using Terraform. it sets up an Application Load Balancer (ALB) to route traffic to the instance.
The "s3" state backend stores and manage the state files terraform uses to keep track of the infrastructure it manages, and also allow collaboration amoungs team members.
The Dynamodb_table used for state locking and prevent conccurrent modifications. 
The AWs provider.tf specifies the region where the resources will be created.
EC2 instance resource is defined. It specifies the Amazon Machine Image (AMI) ID and the instance type (t4g.nano). Tags are applied to the instance for identification purposes.
A security group that allows traffic on ports.
An Application Load Balancer (ALB) resource is created. The security group defined earlier is associated with the load balancer.
A target group for the ALB is created, It specifies that the target group listens on port 80 (HTTP) and forwards traffic to instances. The vpc_id is taken from the created EC2 instance's security group.
A listener for the application Load Balacer is set up to listen an port 80 and redirected. A respond with a fixed message of "Welcome to Nginx" when accessed.
