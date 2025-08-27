<p align="center">
  <img src="screenshots/logo-habitbi.png" alt="HabitBi Logo" width="150" />
</p>

<h1 align="center">HabitBi</h1>




**HabitBi** is a simple yet effective **habit tracking** app that helps you keep track of how many days you've consistently followed your habits and win awards🏆. Designed with focus and usability in mind, it’s built as a **Single Page Application (SPA)** and fully supports **Progressive Web App (PWA)** features, so you can install and use it like a native app.

🚀 **Live Demo**: [HabitBi on Render](https://habitbi.onrender.com)

---

## ✨ Features

- 📆 Track daily progress on your habits
- 🔐 User authentication with Devise
- ⚡ SPA experience with Hotwire & Turbo
- 📱 Installable as a PWA (Progressive Web App)
- 🎨 Beautiful, responsive design with TailwindCSS
- 🧠 Built with StimulusJS for snappy interactivity

---

## 🛠️ Tech Stack

- **Ruby** 3.4.4
- **Rails** 8.0.2
- **Postgresql** for database
- **TailwindCSS**
- **StimulusJS**
- **Hotwire (Turbo + Stimulus)**
- **Devise** for authentication
- **Hosted on Render**

---

## 📷 Screenshots

### 🏠 Home
![Home Screenshot](https://i.imgur.com/d8m10nM.png)

---

### 📝 Sign Up
![Signup Screenshot](https://i.imgur.com/upKtMwP.png)

---

### 📭 No Habits Page
![No Habits Screenshot](https://i.imgur.com/Dgjz7Un.png)

---

### 📋 Habits Page
![Habits Screenshot](https://i.imgur.com/xnSPL1B.png)

---

## 🚀 Getting Started

To run HabitBi locally:

```bash
# Clone the repository
git clone https://github.com/bottles10/habitbi.git
cd habitbi

# Install dependencies
bundle install
yarn install

# Set up the database
rails db:setup

# Start the development server
bin/dev
