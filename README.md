# 🌍📱 Ceticy - Cross-Platform Application (iOS | Android | Web)

Welcome to **Ceticy**, a mobile and web application developed with **Flutter**, supporting **iOS, Android, and Web**.  
The application is automatically deployed using **GitHub Actions**.

## 🚀 **Features**
✅ Available on **iOS, Android, and Web**  
✅ Smooth and modern user interface  

---

### ⚙️ **CI/CD - GitHub Actions**
| Actions  | Build & Release |
|-----------|----------------|
| [![Flutter CI](https://github.com/VanhoveHugo/flutter-ceticy/actions/workflows/flutter.yml/badge.svg)](https://github.com/VanhoveHugo/flutter-ceticy/actions/workflows/flutter.yml)   | Deployment on VPS |
| [![iOS Release Build](https://github.com/VanhoveHugo/flutter-ceticy/actions/workflows/ios.yml/badge.svg)](https://github.com/VanhoveHugo/flutter-ceticy/actions/workflows/ios.yml)   | Generates `.ipa` and creates a release |
| **Android** | Generates `.apk` & `.aab` and automatic release |
| **Web**   | Deployment on VPS |

---

## 📦 **Installation & Running Locally**
### 🔹 **Prerequisites**
- [Flutter](https://flutter.dev/docs/get-started/install) installed
- [Dart](https://dart.dev/get-dart)
- Xcode (for iOS) and Android Studio (for Android)
- An **Apple Developer** account (to run on iOS)

### 🔹 **Clone the Repository**
```sh
git clone https://github.com/VanhoveHugo/flutter-ceticy.git
cd flutter-ceticy
```

### 🔹 **Install Dependencies**
```sh
flutter pub get
```

### 🔹 **Run the Application**
```sh
flutter run
```

---

## 🛠 **Build Commands**
📱 **Android** (Generate APK)  
```sh
flutter build apk --release
```
📦 **Android App Bundle (AAB)**  
```sh
flutter build appbundle --release
```
🍏 **iOS** (Without code signing)  
```sh
flutter build ios --release --no-codesign
```
🌍 **Web**  
```sh
flutter build web
```

---

## 📝 **Additional Information**
- 📜 License: MIT
- 🛠 Developed with Flutter & Dart
- 💬 Need help? Open an issue!

🚀 **Happy coding!**
