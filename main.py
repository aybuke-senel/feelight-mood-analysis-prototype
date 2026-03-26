import sys
import psycopg2
import os
from dotenv import load_dotenv

from PyQt5.QtWidgets import (
    QApplication,
    QMainWindow,
    QPushButton,
    QRadioButton,
    QLabel,
    QToolButton,
    QMenu
)
from PyQt5.uic import loadUi

import random
import pygame

# -------- LOAD ENV --------
load_dotenv()

# -------- DB CONNECTION FUNCTION --------
def get_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )


# GLOBAL MOOD HISTORY
mood_history = []


class FirstScreen(QMainWindow):
    def __init__(self):
        super().__init__()
        loadUi("first_screen.ui", self)

        self.dark_mode = False

        self.okButton = self.findChild(QPushButton, "okButton")

        self.radioHappy = self.findChild(QRadioButton, "radioHappy")
        self.radioSad = self.findChild(QRadioButton, "radioSad")
        self.radioAngry = self.findChild(QRadioButton, "radioAngry")
        self.radioCalm = self.findChild(QRadioButton, "radioCalm")
        self.radioAnxious = self.findChild(QRadioButton, "radioAnxious")

        self.settingsButton = self.findChild(QToolButton, "settingsButton")

        if self.okButton:
            self.okButton.clicked.connect(self.go_to_second)

        if self.settingsButton:
            self.create_menu()

    def create_menu(self):
        self.menu = QMenu(self)

        self.menu.addAction("Mood Patterns", self.show_moods)
        self.menu.addAction("Dark Mode", self.toggle_dark_mode)
        self.menu.addAction("Exit", self.exit_app)

        self.settingsButton.clicked.connect(self.open_menu)

    def open_menu(self):
        pos = self.settingsButton.mapToGlobal(
            self.settingsButton.rect().center()
        )
        self.menu.move(pos)
        self.menu.show()

    def show_moods(self):
        try:
            import matplotlib.pyplot as plt

            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute("""
                SELECT mood, COUNT(*)
                FROM moods
                GROUP BY mood
            """)

            result = cursor.fetchall()

            cursor.close()
            conn.close()

            moods = [row[0] for row in result]
            counts = [row[1] for row in result]

            plt.figure(num="Feelight Mood Patterns")

            color_map = {
                "Happy": "#ff95ca",
                "Sad": "#8daaff",
                "Angry": "#ff5c39",
                "Calm": "#ffa064",
                "Anxious": "#a66aff"
            }

            colors = [color_map.get(mood, "#cccccc") for mood in moods]

            plt.bar(moods, counts, color=colors)
            plt.title("Your Mood Patterns")
            plt.xlabel("Mood")
            plt.ylabel("Count")

            plt.show()

        except Exception as e:
            print("Error:", e)

    def exit_app(self):
        sys.exit()

    def toggle_dark_mode(self):
        if not self.dark_mode:
            self.setStyleSheet("background-color: #121212; color: white;")
            self.dark_mode = True
        else:
            self.setStyleSheet("")
            self.dark_mode = False

    def go_to_second(self):
        mood = self.get_selected_mood()

        if mood is None:
            print("Mood seçilmedi")
            return

        self.second = SecondScreen(mood)
        self.second.show()
        self.close()

    def get_selected_mood(self):
        if self.radioHappy and self.radioHappy.isChecked():
            return "Happy"
        elif self.radioSad and self.radioSad.isChecked():
            return "Sad"
        elif self.radioAngry and self.radioAngry.isChecked():
            return "Angry"
        elif self.radioCalm and self.radioCalm.isChecked():
            return "Calm"
        elif self.radioAnxious and self.radioAnxious.isChecked():
            return "Anxious"
        return None


class SecondScreen(QMainWindow):
    def __init__(self, mood):
        super().__init__()
        loadUi("second_screen.ui", self)

        self.mood = mood
        self.dark_mode = False
        self.is_paused = False

        self.labelDetectedMood = self.findChild(QLabel, "labelDetectedMood")
        self.labelMotivation = self.findChild(QLabel, "labelMotivation")
        self.labelMusic = self.findChild(QLabel, "labelMusic")

        self.backButton = self.findChild(QPushButton, "backButton")
        self.saveButton = self.findChild(QPushButton, "saveButton")
        self.settingsButton = self.findChild(QToolButton, "settingsButton")

        self.pauseButton = self.findChild(QPushButton, "pauseButton")

        if self.labelDetectedMood:
            self.labelDetectedMood.setText(f"Detected Mood: {self.mood}")

        self.set_mood_content()
        self.set_background()

        if self.backButton:
            self.backButton.clicked.connect(self.go_back)

        if self.saveButton:
            self.saveButton.clicked.connect(self.save_mood)

        if self.settingsButton:
            self.create_menu()

        if self.pauseButton:
            self.pauseButton.setText("Pause")
            self.pauseButton.clicked.connect(self.toggle_music)

    def toggle_music(self):
        try:
            if self.is_paused:
                pygame.mixer.music.unpause()
                self.is_paused = False
                self.pauseButton.setText("Pause")
            else:
                pygame.mixer.music.pause()
                self.is_paused = True
                self.pauseButton.setText("Resume")
        except Exception as e:
            print("Music control error:", e)

    def create_menu(self):
        self.menu = QMenu(self)

        self.menu.addAction("Mood Patterns", self.show_moods)
        self.menu.addAction("Dark Mode", self.toggle_dark_mode)
        self.menu.addAction("Exit", self.exit_app)

        self.settingsButton.clicked.connect(self.open_menu)

    def open_menu(self):
        self.menu.exec_(
            self.settingsButton.mapToGlobal(
                self.settingsButton.rect().bottomLeft()
            )
        )

    def show_moods(self):
        try:
            import matplotlib.pyplot as plt

            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute("""
                SELECT mood, COUNT(*)
                FROM moods
                GROUP BY mood
            """)

            result = cursor.fetchall()

            cursor.close()
            conn.close()

            moods = [row[0] for row in result]
            counts = [row[1] for row in result]

            plt.figure(num="Feelight Mood Patterns")

            color_map = {
                "Happy": "#ff95ca",
                "Sad": "#8daaff",
                "Angry": "#ff5c39",
                "Calm": "#ffa064",
                "Anxious": "#a66aff"
            }

            colors = [color_map.get(mood, "#cccccc") for mood in moods]

            plt.bar(moods, counts, color=colors)
            plt.title("Your Mood Patterns")
            plt.xlabel("Mood")
            plt.ylabel("Count")

            plt.show()

        except Exception as e:
            print("Error:", e)

    def exit_app(self):
        sys.exit()

    def toggle_dark_mode(self):
        if not self.dark_mode:
            self.setStyleSheet("background-color: #121212; color: white;")
            self.dark_mode = True
        else:
            self.set_background()
            self.dark_mode = False

    def save_mood(self):
        try:
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "INSERT INTO moods (mood) VALUES (%s)",
                (self.mood,)
            )

            conn.commit()

            cursor.close()
            conn.close()

            print("Mood saved:", self.mood)

        except Exception as e:
            print("Error:", e)

    def set_mood_content(self):
        try:
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "SELECT text FROM quotes WHERE mood = %s",
                (self.mood,)
            )

            results = cursor.fetchall()

            if results:
                random_quote = random.choice(results)[0]
                self.labelMotivation.setText(random_quote)

            cursor.close()
            conn.close()

        except Exception as e:
            print("Error:", e)

        try:
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "SELECT title, file_path FROM music WHERE mood = %s",
                (self.mood,)
            )

            results = cursor.fetchall()

            if results:
                random_music = random.choice(results)

                title = random_music[0]
                path = random_music[1]

                self.labelMusic.setText(title)

                pygame.mixer.init()
                pygame.mixer.music.load(path)
                pygame.mixer.music.play()

            cursor.close()
            conn.close()

        except Exception as e:
            print("Music Error:", e)

    def set_background(self):
        if self.mood == "Happy":
            self.setStyleSheet("background-color: #F8C8DC;")
        elif self.mood == "Sad":
            self.setStyleSheet("background-color: #A7C7E7; color: white;")
        elif self.mood == "Angry":
            self.setStyleSheet("background-color: #C0392B; color: white;")
        elif self.mood == "Calm":
            self.setStyleSheet("background-color: #FFD6A5;")
        elif self.mood == "Anxious":
            self.setStyleSheet("background-color: #D7BDE2;")

    def go_back(self):
        self.first = FirstScreen()
        self.first.show()
        self.close()


# -------- APP --------
app = QApplication(sys.argv)

window = FirstScreen()
window.show()

sys.exit(app.exec_())