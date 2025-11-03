[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=fff)](#)

Hello\! This is a simple **Tic-Tac-Toe (X and O)** game built with Flutter. Here is information needed to help guide you in running the app on your device.

# ❌ O App (Tic-Tac-Toe)

A simple, dark-themed Tic-Tac-Toe game built using Flutter.

## ✨ Features

* **Classic Gameplay:** Play the standard 3x3 Tic-Tac-Toe game.
* **Win Detection:** Automatically checks for a win (horizontal, vertical, and diagonal) or a draw.
* **Dark Theme:** A simple, visually appealing dark background.
* **Reset Button:** Easily start a new game at any time.

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have **Flutter** installed on your system.
* [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

To check if Flutter is correctly installed, open your terminal or command prompt and run:

```bash
flutter doctor
````

### Installation

1.  **Clone the repository (or copy the code):**
    If the code is in a repository, clone it:

    ```bash
    git clone [repository-url]
    cd [project-folder]
    ```

    If you only have the provided code, save it as a file named `main.dart` inside the `lib` folder of a new Flutter project.

    You can create a new Flutter project by running:

    ```bash
    flutter create x_and_o_app
    cd x_and_o_app
    ```

    Then, replace the contents of `lib/main.dart` with the code provided.

2.  **Get Packages:**
    In the project directory, run:

    ```bash
    flutter pub get
    ```

3.  **Run the App:**
    Connect a physical device or start an emulator/simulator. Then, run the app from your terminal:

    ```bash
    flutter run
    ```

    Alternatively, you can run it from your IDE (VS Code or Android Studio) by clicking the **Run** button.

## 🎮 How to Play

1.  The game starts with **Player X** (Red) making the first move.
2.  Tap on any empty square to place your symbol.
3.  The turn then alternates to **Player O** (Blue).
4.  The first player to get three of their symbols in a row (horizontally, vertically, or diagonally) wins the game.
5.  If all squares are filled and no player has won, the game is a **Draw\!**.
6.  Use the **Reset Game** button at the bottom to start a new round.

## ⚙️ Technical Details (For Developers)

The game state is managed in the `_MyHomePageState` class:

  * `var table = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]];`: The core 2D list representing the game board.
      * `-1`: Empty cell
      * `1`: Player X
      * `0`: Player O
  * `int flag`: Used to track the current player's turn (`0` for X, `1` for O).
  * `int loop`: Controls the game loop (`1` for active, `0` for game over/draw).
  * `match(int f, int row, int col)`: Function to check for win conditions after a move.
  * `fill()`: Function to check for a draw condition.
  * `_incrementCounter(int row, int col, int input_flag)`: The main logic for handling a tap on the grid.

<!-- end list -->

<img width="225" height="500" alt="Image" src="https://github.com/user-attachments/assets/d7db9ab3-2d85-4420-bb5c-e2d03b68bb2b" />
<img width="225" height="500" alt="2" src="https://github.com/user-attachments/assets/1cb5a2aa-60f5-47f8-96f3-d59c694dbf7e" />
<img width="225" height="500" alt="3" src="https://github.com/user-attachments/assets/ac93956e-a97f-4ca4-b16e-ae60806de6e6" />


