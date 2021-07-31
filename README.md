<p align="center">
  <a href="https://devera.vn/">
    <img src="https://i.ibb.co/g9xNY1k/Devera-Logo.png" alt="Logo" width=151 height=127>
  </a>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter" alt="Platform Flutter"></a>
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Made%20with-Love-1f425f.svg" alt="Made with Love"></a>
<p>


<h1 align="center">Flutter Login App using Bloc</h1>

<p align="center">An example app that uses Flutter BLoC and Firebase Authentication for user authentication.</p>

<br>

# Getting Started

This project is used to demonstrate in [Devera](https://devera.vn) Flutter course how to create a Flutter application in which an user can register and login using the Firebase authentication system.

# How to use

## Step 1: 
Download or clone this repository.
> https://github.com/hungnm138/devera-flutter-login-app

## Step 2: 
Go to [FireBase Console](https://console.firebase.google.com/) and create a new project with the correct package name.

### Android
- Download the `google-services.json` file.
- Move `google-services.json` in the `android/app` folder and setup the Gradle build file. 

### iOS
- Download the `GoogleServices-Info.json` file.
- Move `GoogleServices-Info.json` in the `ios/Runner` folder.

## Step 3: 
- On the home page of your Firebase project, click on `Authentication` on the left sidebar.
- Choose `Sign-in methods` and enable the email/password login provider.

# Libraries & Tools Used
| Package  | Usage |
| ------ | ------ |
| [Flutter Bloc](https://pub.dev/packages/flutter_bloc) | State management
| [Provider](https://pub.dev/packages/provider) | State management and context based DI
| [Equatable](https://pub.dev/packages/equatable) | Easily compare custom classes, used for Bloc states
| [Firebase Core](https://pub.dev/packages/firebase_core) | Flutter plugin for Google Firebase Core
| [Firebase Auth](https://pub.dev/packages/firebase_auth) | Flutter plugin for Google Firebase Authentication
| [Bloc Test](https://pub.dev/packages/bloc_test) | Makes testing blocs and cubits easy

# Conclusion
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

> Also, visit the [Devera Academy](https://devera.vn) website or [Facebook](https://www.facebook.com/DeveraAcademy/) fanpage to find out more about the courses.
