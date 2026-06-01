# Task App - Laboratory 3

## Course

**Application of Artificial Intelligence in Mobile Devices**
Laboratory 3 – Introduction to Flutter & Basic UI Elements

## Author

Ahmed Azab

---

## Project Description

This project is a simple Task Management Application developed using Flutter and Dart. The application demonstrates the fundamental concepts of Flutter development, including project structure, state management, user interface design, forms, validation, and dynamic list rendering.

The application allows users to:

* View a list of tasks
* Add new tasks
* Edit existing tasks
* Delete tasks
* Mark tasks as completed
* Validate user input before saving tasks

---

## Learning Objectives

The purpose of this laboratory was to:

* Understand Flutter project structure
* Differentiate between StatelessWidget and StatefulWidget
* Build user interfaces using Material Design widgets
* Use ListView.builder for dynamic lists
* Implement forms and validation
* Create and manage custom data models
* Handle application state using setState()

---

## Project Structure

```text
lib/
│
├── main.dart
│
├── models/
│   └── task.dart
│
└── presentation/
    └── screens/
        └── my_home_page.dart
```

---

## Features

### Task List Display

Tasks are displayed using ListView.builder, which efficiently renders items on demand.

### Add Task

Users can add new tasks through a modal dialog.

### Edit Task

Existing tasks can be modified using the Edit button.

### Delete Task

Tasks can be removed from the list using the Delete button.

### Complete Task

Tasks can be marked as completed using a checkbox.

### Validation

The application validates user input:

* Task name cannot be empty
* Task name must contain at least 3 characters

---

## Technologies Used

* Flutter
* Dart
* Material Design

---

## Task Data Model

Each task contains:

```dart
class Task {
  String title;
  bool isComplete;

  Task({
    required this.title,
    this.isComplete = false,
  });
}
```

---

## Running the Application

### Prerequisites

* Flutter SDK
* Dart SDK
* VS Code or Android Studio

### Run the Project

```bash
flutter pub get
flutter run
```

For Chrome:

```bash
flutter run -d chrome
```

For macOS:

```bash
flutter run -d macos
```

---

## Expected Functionality

* Add new tasks
* Edit task content
* Delete tasks
* Mark tasks as completed
* Automatically update the user interface
* Display completed tasks with strikethrough styling

---

## Laboratory Outcome

The laboratory successfully demonstrates the implementation of a complete CRUD (Create, Read, Update, Delete) application using Flutter. The project applies Flutter fundamentals such as widgets, state management, forms, validation, and dynamic user interface updates.

---

## Screenshots

Add screenshots of the application here before submission.

Example:

* Main Screen
* Add Task Dialog
* Edit Task Dialog
* Completed Task Example

---

## License

This project was developed for educational purposes as part of the laboratory requirements for the course:

**Application of Artificial Intelligence in Mobile Devices**
