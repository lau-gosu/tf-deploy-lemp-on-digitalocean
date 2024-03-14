README:
# Install Terraform
# Create your DO Token
# Add your public SSH KEY to DO
# update variables.tf & provider.tf(ssh_key_name)
export DO_PAT="YOUR DO TOKEN"
terraform init
terraform plan -var do_token=$DO_PAT
terraform apply -var do_token=$DO_PAT

#ssh to your droplet
# copy your site to /var/www/$domain_name
# secure mysql by running: mysql_secure_installation
# create your mysql database and access credentials
# enable SSL with Letsencrypt:
certbot --nginx -d $domain_name -d www.$domain_name

