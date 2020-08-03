# hsos

A sample application for HS OS

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Wie wird Code generiert?
Hier ist es ratsam sich erst einmal die [offizielle Doku](https://flutter.dev/docs/development/data-and-backend/json) duchzulesen.
Insbesondere den Teil über die kontinuierliche [Code-Generierung](https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously).
Die Kurzfassung ist, dass `flutter pub run build_runner watch` am Anfang ausgeführt werden muss.
Gibt es Probleme beim Erzeugen von Dateien kann mit `flutter pub run build_runner build --delete-conflicting-outputs` das Problem gelöst werden.