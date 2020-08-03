# HS Osnabrück App

Eine App für die Hochschule Osnabrück.
Hier gibts quasi das komplette Osca Portal als App.
Mit Ankündigungen, Datei-Portal, Noten und Statistiken.
Das ganze ist noch sehr prototypisch funktioniert dafür aber 
schon recht gut.

## Installation
Alle iOS Nutzer müssen sich die App leider selbst kompilieren um sie benutzen zu können.
(Dies ist aufgrund der Restriktionen von Apple so. Tut mir leid, da kann ich leider nix machen 🤷‍♂️)
Alle Android Nutzer können sich die App hier herunterladen.

# Infos zur Entwicklung

## Wie wird Code generiert?
Hier ist es ratsam sich erst einmal die [offizielle Doku](https://flutter.dev/docs/development/data-and-backend/json) duchzulesen.
Insbesondere den Teil über die kontinuierliche [Code-Generierung](https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously).
Die Kurzfassung ist, dass `flutter pub run build_runner watch` am Anfang ausgeführt werden muss.
Gibt es Probleme beim Erzeugen von Dateien kann mit `flutter pub run build_runner build --delete-conflicting-outputs` das Problem gelöst werden.