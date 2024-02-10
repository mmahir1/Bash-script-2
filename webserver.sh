#!/bin/bash

# Redirect all output to a log file
exec &>> logfile.log

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with root privileges. Please use sudo or run as root."
    exit 1
fi

# Update system packages
echo "Updating system packages..."
apt update && apt upgrade -y

# Install a web server (Apache or Nginx)
echo "Select a web server to install:"
echo "1. Apache"
echo "2. Nginx"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Installing Apache..."
        apt install apache2 -y
        ;;
    2)
        echo "Installing Nginx..."
        apt install nginx -y
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Prompt user for hostname
read -p "Enter the hostname for the server: " hostname

# Configure hostname and localhost
echo "Configuring hostname and localhost..."
echo "127.0.0.1    $hostname" >> /etc/hosts
hostnamectl set-hostname $hostname

# Create a sample web page
echo "Creating sample web page..."
echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html

# Start and enable web server service
echo "Starting and enabling web server service..."
systemctl start apache2 || systemctl start nginx
systemctl enable apache2 || systemctl enable nginx

# Firewall configuration
echo "Configuring firewall to allow HTTP traffic..."
ufw allow 80/tcp

# Report completion
echo "Web server environment setup completed."
echo "You can access the sample web page at: http://$hostname"

