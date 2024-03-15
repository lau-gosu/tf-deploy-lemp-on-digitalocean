
##### 1. In DO GUI:
 - Create your DO Token
 - Add your public SSH KEY 
 - Create a Reserved IP and make sure your domain-name points to it(A record)

##### 2. On Your Laptop:
###### 2.1 Install Terraform
###### 2.2 Update terraform.tfvars then run:
 - export DO_PAT="YOUR DO TOKEN"
 - terraform init
 - terraform plan -var do_token=$DO_PAT
 - terraform apply -var do_token=$DO_PAT

##### 3. Connect(ssh) to your droplet then::
- copy your site to /var/www/$domain_name
- enable SSL with Letsencrypt(change email address and my_domain_name):
   + certbot --nginx -d ${my_domain_name} -d ${my_domain_name} -n -m laurentiu.gosu@gmail.com --agree-tos
- secure mysql by running: mysql_secure_installation
- create your mysql database and access credentials

