https://roadmap.sh/projects/log-archive-tool

# 📦 Log Archive Tool (DevOps Beginner Project)

## 📌 Overview

This project is a simple CLI tool built using Bash that archives logs from a given directory by compressing them into `.tar.gz` format. It also maintains a log of all archive operations.

---

## 🚀 Features

* Accepts log directory as input
* Compresses logs into `.tar.gz`
* Stores archives in a separate directory
* Adds timestamp to each archive
* Logs archive history

---

## ⚙️ Usage

```bash
./log-archive.sh <log-directory>
```

### Example:

```bash
./log-archive.sh /var/log
```

---

## 🛠️ How It Works

1. Takes directory input
2. Validates directory existence
3. Generates timestamp
4. Compresses logs
5. Stores archive in `archives/`
6. Logs the operation in `archive.log`

---

## 📁 Project Structure

```
.
├── log-archive.sh
├── archives/
├── archive.log
├── README.md
```

---

## 🔧 Setup

### 1. Clone repository

```bash
git clone <your-repo-url>
cd <repo-name>
```


### 2. Make script executable

```bash
---

### 3. Run the script

## 📊 Example Output

```
Archive created: archives/logs_archive_20260410_153000.tar.gz

## 💡 Key Learnings

* Bash scripting
* Automation of system tasks
* Working with tar and compression
* Logging operations
* CLI tool development

---

## 🚀 Future Improvements

* Archive only `.log` files
* Auto-delete old archives
* Schedule using cron jobs
* Add error handling and alerts

---

## 🙌 Author

Beginner DevOps Learner 🚀
```

---
```

---

```bash
./log-archive.sh /var/log
chmod +x log-archive.sh
```


