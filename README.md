# Flutter Login/Signup Example with Firebase Authentication

This is an example of a login and signup page using Flutter and Firebase Authentication. This project demonstrates how to implement user authentication features in a Flutter application, allowing users to sign up, log in, and reset their passwords.

## Features

- User registration with email and password
- User login with email and password
- Password reset functionality
- Responsive UI
- SnackBar feedback for user actions

## Technologies Used

- Flutter
- Firebase Authentication
- Dart
- FlutterFire (Firebase SDK for Flutter)

## Getting Started

### Prerequisites

Before running the app, make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Firebase project set up in the [Firebase Console](https://console.firebase.google.com/)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/repository-name.git
2. **Navigate to the project directory:**
    cd repository-name
   
3. **Install dependencies:**
   dependencies:
  flutter:
    sdk: flutter
  firebase_auth: ^x.x.x # Check for the latest version
  flutterfire: ^x.x.x    # Check for the latest version
  Then, run:
  flutter pub get
5. Configure Firebase:

Follow the official Firebase documentation to set up your Flutter app with      Firebase: Add Firebase to Your Flutter App.
Make sure to add the necessary configuration files (e.g., google-services.json for Android and GoogleService-Info.plist for iOS).

##Running the App
To run the app, use the following command:
flutter run
Usage
Register: Enter your email and password to create a new account.
Login: Enter your email and password to log in.
Forgot Password: Click the "Forgot Password" button to receive a password reset email.
