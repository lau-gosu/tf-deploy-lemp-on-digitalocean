
##### 1. In DO GUI:
 - Create your DO Token
 - Add your public SSH KEY 
 - Create a Reserved IP and make sure your domain-name points to it(A record)

##### 2. On your Laptop:
###### 2.1. Install Terraform, clone this repo and cd into it.
###### 2.2. Update terraform.tfvars then run:
 - export DO_PAT="YOUR DO TOKEN"
 - terraform init
 - terraform plan -var do_token=$DO_PAT
 - terraform apply -var do_token=$DO_PAT

##### 3. Connect(ssh) to your droplet then::
- copy your site to /var/www/$domain_name
- enable SSL with Letsencrypt(change email address and my_domain_name):
   + certbot --nginx -d ${my_domain_name} -d ${my_domain_name} -n -m abc@cde.fgh --agree-tos
- secure mysql by running: mysql_secure_installation
- create your mysql database and access credentials


##### Sources:
- https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-22-04
- https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-22-04

