https://roadmap.sh/projects/dockerized-service-deployment

# node-docker-app


📄 README — Dockerized Node.js App with CI/CD on AWS EC2
🚀 Project Overview

This project demonstrates how to:

Build a Node.js application
Dockerize the application
Deploy it to an AWS EC2 instance
Automate deployment using GitHub Actions
Manage secrets securely
🧩 Architecture
Developer → GitHub → GitHub Actions → Docker Hub → EC2 → Live App
⚙️ Prerequisites

Make sure you have:

Node.js installed
Docker installed
Git installed
AWS account (Amazon Web Services)
GitHub account (GitHub)
Docker Hub account (Docker)
🧱 Step 1 — Create Node.js App
Initialize project
mkdir node-docker-app
cd node-docker-app
npm init -y
npm install express dotenv basic-auth
Create index.js
const express = require("express");
const dotenv = require("dotenv");
const basicAuth = require("basic-auth");

dotenv.config();

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.send("Hello, world!");
});

const auth = (req, res, next) => {
  const user = basicAuth(req);

  if (
    !user ||
    user.name !== process.env.USERNAME ||
    user.pass !== process.env.PASSWORD
  ) {
    res.set("WWW-Authenticate", "Basic realm=Authorization Required");
    return res.status(401).send("Unauthorized");
  }

  next();
};

app.get("/secret", auth, (req, res) => {
  res.send(process.env.SECRET_MESSAGE);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
Create .env
SECRET_MESSAGE=This is a secret!
USERNAME=admin
PASSWORD=1234
Create .gitignore
node_modules
.env
🐳 Step 2 — Dockerize Application
Create Dockerfile
FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
Create .dockerignore
node_modules
.env
.git
Build Docker image
docker build -t node-app .
Run container locally
docker run -p 3000:3000 --env-file .env node-app
Test
http://localhost:3000
http://localhost:3000/secret
☁️ Step 3 — Setup AWS EC2
Launch EC2 Instance
OS: Ubuntu 22.04
Instance: t2.micro
Open ports:
22 (SSH)
3000 (App)
Connect via SSH
chmod 400 key.pem
ssh -i key.pem ubuntu@YOUR_PUBLIC_IP
Install Docker
sudo apt update
sudo apt install docker.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker ubuntu

Reconnect:

exit
ssh -i key.pem ubuntu@YOUR_PUBLIC_IP
🔐 Step 4 — Setup GitHub Secrets

Go to GitHub → Repo → Settings → Secrets

Add:

DOCKER_USERNAME
DOCKER_PASSWORD
EC2_HOST
EC2_USER (ubuntu)
EC2_KEY (paste .pem content)
ENV_FILE

Example ENV_FILE:

SECRET_MESSAGE=Production Secret
USERNAME=admin
PASSWORD=1234
⚙️ Step 5 — GitHub Actions CI/CD
Create workflow file
.github/workflows/deploy.yml
Add workflow
name: Deploy Node App

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Login to Docker Hub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build Docker Image
        run: docker build -t ${{ secrets.DOCKER_USERNAME }}/node-app .

      - name: Push Docker Image
        run: docker push ${{ secrets.DOCKER_USERNAME }}/node-app

      - name: Deploy to EC2
        uses: appleboy/ssh-action@v1.0.0
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ${{ secrets.EC2_USER }}
          key: ${{ secrets.EC2_KEY }}
          script: |
            docker pull ${{ secrets.DOCKER_USERNAME }}/node-app

            docker stop node-app || true
            docker rm node-app || true

            echo "${{ secrets.ENV_FILE }}" > .env

            docker run -d \
              -p 3000:3000 \
              --env-file .env \
              --name node-app \
              ${{ secrets.DOCKER_USERNAME }}/node-app
🚀 Step 6 — Deploy
git add .
git commit -m "Add CI/CD pipeline"
git push origin main
Monitor Deployment

Go to GitHub → Actions tab

🌍 Step 7 — Access Application
http://YOUR_PUBLIC_IP:3000
✅ Features
Node.js API
Docker containerization
AWS EC2 deployment
CI/CD automation
Secure secrets handling
🧠 Learning Outcomes
Docker fundamentals
CI/CD pipelines
Cloud deployment
Secure configuration management
<img width="697" height="213" alt="image" src="https://github.com/user-attachments/assets/1c977b6c-5bcb-46a0-99df-274893551312" />

👨‍💻 Author

Kalyan
