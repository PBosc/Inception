# Inception

**Inception** is a system administration and virtualization project from **School 42**, which consists of setting up a secure, functional, and modular **Docker-based infrastructure** that hosts several services using **Docker Compose**.

---

## 📦 Project Overview

The goal of this project is to:

- Set up and configure a **WordPress website** with an **Nginx** web server.
- Use a **MariaDB** database to store website content.
- Run all services inside Docker containers, orchestrated with **Docker Compose**.
- Apply secure configurations and good DevOps practices.

---

## 🏗️ Architecture

- **Docker** is used to containerize each service.
- **Docker Compose** handles multi-container orchestration.
- **Volumes** are used for persistent data storage.
- **Nginx** serves as the reverse proxy and handles HTTPS.
- **Certbot (or OpenSSL)** is used for SSL certificate generation.
- Custom Dockerfiles are written for each service.

---

## 🧱 Services

- **Nginx** – web server with SSL
- **WordPress** – blog/CMS platform
- **MariaDB** – relational database
