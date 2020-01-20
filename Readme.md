we will install wget and unzip packages if they’re not already installed:

$ sudo yum install wget unzip
Now we are ready to download Terraform zip file for Linux from the official website. At the time of writing this article, the current version of Terraform was 0.11.13.

$ wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
Next, we will unpack the archive to /usr/local/bin/

$ sudo unzip ./terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/
All done. The only thing that is left now, is to check if terraform is successfully installed, with the following command:

$ terraform -v



Please run "terraform init" for initializing a terraform.
After that executing run " terraform apply"
