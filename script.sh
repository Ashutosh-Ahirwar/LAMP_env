#!/bin/bash
# Update the system
sudo apt update -y
sudo apt upgrade -y

# Install Apache
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Install MySQL
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql


# Install PHP and Required Modules
sudo apt install php libapache2-mod-php php-mysql -y

# Configure Apache to Serve PHP Files
sudo echo "<?php phpinfo(); ?>" > /var/www/html/index.php

# Create a Sample PHP Application
cat <<EOF > /var/www/html/sample.php
<?php
echo "Hello, World! This is a LAMP Stack Demo!";
?>
EOF

# Set Permissions
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html


# Restart Apache to Apply Changes
sudo systemctl restart apache2

