# 🚀 Kasmweb Chrome Browser on Render

This project hosts a lightweight **Chrome** web browser inside a **Docker container** using the `kasmweb/chrome:1.16.0` image, deployed on [Render](https://render.com). Access a fully functional Chrome browser via your browser using **noVNC**.

---

## 📦 Features

- Lightweight Chrome environment (no full desktop overhead)
- Secure, password-protected VNC access
- Easy to deploy on Render
- Exposes Chrome through noVNC (browser-based VNC)

---

## 🛠 How it Works

The container uses the official [Kasm Technologies](https://www.kasmweb.com/) `kasmweb/chrome:1.16.0` image, exposing a VNC session via websockify and noVNC on port `6901`.

---

## 📋 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/kasm-chrome-render.git
cd kasm-chrome-render
```

---

### 2. Dockerfile

This project includes a simple `Dockerfile`:

```Dockerfile
FROM kasmweb/chrome:1.16.0

ENV VNC_PW=password

EXPOSE 6901

CMD ["/dockerstartup/vnc_startup.sh"]
```

---

### 3. Deploy to Render

#### Manual Deployment

- Go to [Render.com](https://render.com/).
- Create a **New Web Service** → **Deploy from Repository**.
- Set environment:
  - Environment: **Docker**
  - Port: **6901**
  - Start Command: `/dockerstartup/vnc_startup.sh`
  - Add environment variable:  
    - `VNC_PW = password`
- Click **Deploy**.

#### Blueprint Deployment (Optional)

You can also use the `render.yaml` file for one-click setup.

```yaml
services:
  - type: web
    name: kasm-chrome
    env: docker
    plan: free
    dockerfilePath: ./Dockerfile
    envVars:
      - key: VNC_PW
        value: password
    ports:
      - 6901
```

---

## 🔒 Default Credentials

- **Password**: `password`
- (You can change it by modifying the `VNC_PW` environment variable.)

---

## 🌐 Access

Once deployed, open:

```plaintext
https://your-app-name.onrender.com
```

You'll get a noVNC session directly in your browser!

---

## ⚠️ Important Notes

- **Free Render plans** may sleep after inactivity and take a few seconds to wake up.
- **Security**: For production use, change the default VNC password immediately.
- **Performance**: The experience may vary depending on server region and browser resources.

---

## 📄 License

This project uses the [Kasmweb](https://www.kasmweb.com/) images under their respective licenses.  
This repository is for educational and personal deployment purposes.

---

# 🚀 Happy Browsing!