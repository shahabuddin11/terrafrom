#Install AWS-Cli into the machine
```commandline
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
```
# Configure the AWS credentials
```
aws configure
```
Passes the Access key Secret set your profile

#Install Terraform
Download Package according to the OS this is for Linux based.
```commandline
wget https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip
echo $PATH
mv ~/Downloads/terraform /usr/local/bin/
```
#verify the installation
```commandline
terraform -help
```
#Terraform command to create infra into the AWS
```commandline
terraform init -backend-config=config #intilizing the backend configuration
#if you don't want to intilize your backend you just run the command
terraform init
aws s3 ls s3://terrafromstate11  #list content from s3
terraform workspace list  #list workspaces
terraform workspace new $workspcename ( for example dev)
```
#Again Run s3 command it will create a folder into the s3 bucket
```cammandline
aws s3 ls s3://terrafromstate11/env:/dev/
```
there is fill which contains the state of the terraform
file name= terraform.tfstate

# Again Run the terraform command to provision the infra
```commandline
terraform validate  #It validate your terraform script 
terraform plan -out=final.plan
terraform apply #provision the infra

```

# Some Important Notes
So for ssh into the ec2 instance you need to copy the private key
form the terraform.tfstate store this key into the 
separate workspace and provide a proper permission to the
key  then do ssh into the ec2 machine

# OR

You can pass the existing key into the string but make sure
you that key.
Some code i have commented into the ec2.tf you need to un-
comment that code according to the need.

#Clean Up 
```commandline
terraform destroy
```
#GithubLink

# Notes
I have configure this in such way the .tfstate is stored into the s3 bucket. for that i am using config file to initlize the backend.

# Resources

1 VPC, 1 Public Subnet, Internet gateway, Security Group, Route table, 1 EC2 instance , ssh-key this resource will be created when you run this template.



