# Feelight – Emotion-Aware Mood Tracking Desktop App

Feelight is an **emotion-aware desktop application** that converts human emotions into a real-time, **multi-sensory experience** using **color, music, and data**.

It bridges emotional awareness with interactive technology, helping users understand and engage with their feelings in a more immersive way.

---

## Preview

### Mood Selection  
![Mood Selection](images/feelight_main_screen.png)

### Mood Result  
![Mood Result](images/feelight_second_screen.png)

### Mood Analytics  
![Mood Analytics](images/feelight_mood_patterns.png)

---

## Features

- Emotion selection system  
- Dynamic color-based UI  
- Motivational quotes (database-driven)  
- Mood-based music playback (pause/resume)  
- Mood saving to PostgreSQL database  
- Mood analytics visualization (Matplotlib)  
- Dark mode toggle  
- Settings menu  

---

## Tech Stack

- Python  
- SQL (database design & queries)  
- PostgreSQL  
- PyQt5 (UI framework)  
- Qt Designer (.ui files)  
- Matplotlib (data visualization)  
- Pygame (audio engine)  
- python-dotenv (environment management)  

---

## How to Run

### 1. Install dependencies

Install required packages using the [requirements.txt](./requirements.txt) or via terminal:

```bash
pip install -r requirements.txt
```
---

### 2. Setup database

Install PostgreSQL and create the database:

```sql
CREATE DATABASE feelight;
```

---

### 3. Initialize database

Use the [initialization script](./init.sql)

---

### 4. Setup environment

Create a [.env file](./.env.example) 

---

### 5. Run the application

Run the app using the [main script](./main.py) or via terminal:

```bash
python main.py
```

---

## Important Notes

- `.env` file is required but not included  
- UI files must be in the same directory as `main.py`  
- Database must be initialized before running the app  

---

## Project Structure

- [Main Application](./main.py) 
- [Database Setup](./init.sql) 
- [Dependencies](./requirements.txt)  
- [Environment template](./.env.example)  
- [Mood selection screen](/ui_files/first_screen.ui)
- [Result screen](/ui_files/second_screen.ui)
- [Screenshots](./images/)
- [Diagrams](./diagrams/) 

---

## Architecture

- **Frontend:** PyQt5 (.ui files)  
- **Backend:** PostgreSQL  
- **Logic Layer:** Python  
- **Visualization:** Matplotlib  
- **Audio Engine:** Pygame  

---

## Highlights

- Clean separation of UI and logic  
- Fully database-driven system  
- Multi-sensory UX (color + sound + text)  
- Real-time emotional feedback loop  


