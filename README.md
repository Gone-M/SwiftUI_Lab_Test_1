# 📌 Lab_Civan_Metin - Prime Number Checker

## 📝 Description
This SwiftUI application is designed to test the user's ability to determine whether a randomly generated number is prime or not. Users can interact with the app by selecting "Prime" or "Not Prime," and immediate feedback is provided based on their selection. 

## ✨ Features
- 🔢 **Random number generation** to keep the game engaging.
- 🎯 **User selection** between "Prime" and "Not Prime" buttons.
- ✅ ❌ **Instant feedback** (Green tick for correct, Red cross for incorrect choices).
- 📊 **Score tracking** for correct and incorrect answers.
- ⏳ **Automatic timer** that updates the number every 5 seconds.
- ⚠️ **Penalty for inactivity**: If no choice is made within 5 seconds, it is automatically marked as incorrect.
- 📢 **Result Summary Alert** after every 10 attempts displaying correct and incorrect responses.
- 🔊 **Sound effects** for correct and incorrect answers.


## 🛠 Technologies Used
- 🚀 **SwiftUI** - Modern UI framework for iOS development.
- ⚡ **State Management** - Using `@State` properties for dynamic UI updates.
- ⏲ **Timers** - To track response time and automatically update the screen.
- 🔔 **Alerts** - Providing user feedback after every 10 attempts.
- 🔊 **AVFoundation** - Adding sound effects for user interaction.
- 💾 **UserDefaults** - Saving high scores and tracking progress.

## 🚀 How to Run the Project
1. Clone the repository:
   ```sh
   git clone https://github.com/Gone-M/SwiftUI_Lab_Test_1.git
   ```
2. Open the project in **Xcode**.
3. Select an **iOS Simulator** or connect a **physical device**.
4. Click the **Run** button to launch the app.

## 🎮 How to Play
1. A random number appears on the screen.
2. Tap **Prime** if you believe the number is prime.
3. Tap **Not Prime** if you believe the number is not prime.
4. If correct, ✅ appears; if incorrect, ❌ appears.
5. If no choice is made within **5 seconds**, the answer is automatically marked as incorrect.
6. After **10 attempts**, an alert appears summarizing your score.
7. The game automatically resets after the alert or can be restarted manually.
8. Earn high scores and track them in the **Leaderboard**.
9. Choose between **Easy, Medium, and Hard difficulty levels**.
10. Complete **Daily Challenges** to earn rewards!

## 🔥 Future Enhancements
- 🎨 **More UI animations** for smoother transitions.
- 🎵 **Additional sound effects and background music**.
- 🌍 **Online leaderboard to compare scores globally**.
- 🔄 **Multiplayer mode for competing with friends**.

