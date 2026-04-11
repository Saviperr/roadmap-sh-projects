https://roadmap.sh/projects/static-site-server

# 🚀 Static Website Deployment using Nginx and Rsync

## 📌 Project Overview

This project demonstrates how to deploy a static website to a remote Linux server using Nginx and rsync. It covers basic DevOps concepts such as server setup, SSH access, web server configuration, and file synchronization.

---

## 🧰 Tools & Technologies Used

* Linux (Ubuntu Server)
* NGINX
* SSH
* rsync
* HTML, CSS

---

## ⚙️ Steps Performed

### 1. Server Setup

* Created a remote Linux server using a cloud provider
* Used Ubuntu 22.04 as the operating system

---

### 2. SSH Connection

Connected to the server using SSH:

```bash
ssh -i my-key.pem ubuntu@65.0.120.4
```

---

### 3. Installed Nginx

Updated packages and installed Nginx:

```bash
sudo apt update
sudo apt install nginx -y
```

Started and enabled Nginx:
```bash
sudo systemctl start nginx
sudo systemctl enable nginx

### 4. Configured Web Server

```bash
cd /var/www/html
sudo rm index.nginx-debian.html
sudo nano index.html
```

---

### 5. Created Static Website

A simple website was created using HTML and CSS files locally.

---

### 6. Deployed Using Rsync

Used rsync to sync local files with the server:

```bash
rsync -avz -e "ssh -i my-key.pem" . ubuntu@65.0.120.4:/var/www/html/
```

---

### 7. Deployment Script

Created a script `deploy.sh` to automate deployment:

```bash
#!/bin/bash

SERVER_IP="65.0.120.4"
KEY="my-key.pem"
REMOTE_DIR="/var/www/html"

echo "Deploying website..."

rsync -avz -e "ssh -i $KEY" . ubuntu@$SERVER_IP:$REMOTE_DIR

echo "Deployment completed!"
```

---

### 8. Accessing the Website

The website is accessible at:

```
http://65.0.120.4
```

---

---

## 📄 License

This project is for educational purposes.
## 🎯 Learning Outcomes


## 🚀 Conclusion

This project provided hands-on experience in deploying a static website using real-world tools. It helped in understanding the fundamentals of web hosting and deployment automation.

---

* Learned how to set up a Linux server
* Understood SSH authentication using key pairs
* Gained basic understanding of deployment workflows
* Installed and configured Nginx web server
* Deployed static websites manually
* Used rsync for efficient file synchronization

* Default web directory used: `/var/www/html`
* Removed default file and added custom website:
```

---

