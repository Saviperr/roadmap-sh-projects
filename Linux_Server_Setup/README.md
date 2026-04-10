# 🚀 Linux Server Setup & SSH Access (DevOps Beginner Project)

## 📌 Overview

This project demonstrates how to:

* Set up a remote Linux server
* Configure SSH access using multiple SSH keys
* Use SSH config for simplified access
* Secure the server using Fail2Ban

---

## 🛠️ Tech Stack

* Linux (Ubuntu)
* SSH
* Bash
* Fail2Ban

---

## ⚙️ Setup Instructions

### 1. Generate SSH Keys

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/devops_key1
ssh-keygen -t rsa -b 4096 -f ~/.ssh/devops_key2
```

---

### 2. Add Keys to Server

```bash
nano ~/.ssh/authorized_keys
```

Paste both public keys.

---

### 3. Set Permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

### 4. Connect Using SSH Keys

```bash
ssh -i ~/.ssh/devops_key1 ubuntu@<server-ip>
ssh -i ~/.ssh/devops_key2 ubuntu@<server-ip>
```

---

### 5. Configure SSH Alias

Edit config:

```bash
nano ~/.ssh/config
```

Add:

```bash
Host myserver-key1
    HostName <server-ip>
    User ubuntu
    IdentityFile ~/.ssh/devops_key1

Host myserver-key2
    HostName <server-ip>
    User ubuntu
    IdentityFile ~/.ssh/devops_key2
```
Now connect easily:

```bash
ssh myserver-key1
ssh myserver-key2

## 🔐 Security (Fail2Ban)

Install:

```bash
sudo apt install fail2ban -y
```

Start service:

```bash
sudo systemctl start fail2ban
```

Check status:

```bash
sudo fail2ban-client status
```

---

## 📊 Key Learnings

* SSH key-based authentication
* Managing remote servers
* File permissions and security
* Preventing brute-force attacks
* Using SSH config for productivity

---

## 📁 Project Structure

```
.
├── README.md
```

---

## 💡 Future Improvements

* Disable password authentication
* Setup firewall (UFW)
* Create non-root user
* Automate setup using scripts

---

## 🙌 Author

Beginner DevOps Learner 🚀
```

---

