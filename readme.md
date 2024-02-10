Objectives
Check for Root Privileges: The script should first check if it's being
run with root privileges, as some tasks will require this. If not run as
root, the script should display an error message and exit.
1.
Update System Packages: The script should update all system
packages to their latest versions.
2.
Install a Web Server: Allow the user to choose between installing
Apache or Nginx. You can use a simple menu with options and read
user input for the selection.
3.
Configure Hostname and Localhost: Prompt the user to enter a
hostname for the server. Update the /etc/hosts file to include this
hostname mapped to 127.0.0.1.
4.
Create a Sample Web Page: After the web server installation,
automatically create a simple "Hello, World" HTML page. This page
should be placed in the appropriate directory to be served by the
web server.
5.
Start and Enable Web Server Service: Ensure that the chosen web
server is started and set to run on boot.
6.
Firewall Configuration: Modify the firewall settings to allow traffic
on the standard HTTP port (port 80). This step might depend on the
firewall system your server is using (like ufw or firewalld).
7.
Report Completion: Display a message indicating completion and
where to find the web page (e.g., server IP or hostname).
8.
Error Handling: Throughout the script, include error handling that
checks the success of each operation. If any operation fails, the
script should display an appropriate message and gracefully exit
without proceeding further.
9.
Logging: Optionally, implement logging of all actions taken by the
script. This is a crucial practice for debugging and auditing.
