# TRANSISI

TRANSISI - A Flutter project.

## Flutter clean architecture sample

- Clean architecture with SOLID principals
- Blocs has been used for state management

## File Structures

```
lib
│   │   main.dart
│   │
│   ├───app
│   │   ├───bloc
│   │   │   ├───auth
│   │   │   │       auth_bloc.dart
│   │   │   │       auth_event.dart
│   │   │   │       auth_state.dart
│   │   │   │
│   │   │   └───employe
│   │   │       ├───create_employe
│   │   │       │       employe_bloc.dart
│   │   │       │       employe_event.dart
│   │   │       │       employe_state.dart
│   │   │       │
│   │   │       ├───get_employe
│   │   │       │       employe_bloc.dart
│   │   │       │       employe_event.dart
│   │   │       │       employe_state.dart
│   │   │       │
│   │   │       └───get_employes
│   │   │               employes_bloc.dart
│   │   │               employes_event.dart
│   │   │               employes_state.dart
│   │   │
│   │   ├───screens
│   │   │   ├───home
│   │   │   │   │   create_page.dart
│   │   │   │   │   detail_page.dart
│   │   │   │   │   home_page.dart
│   │   │   │   │
│   │   │   │   └───child
│   │   │   │           list_view.dart
│   │   │   │           success.dart
│   │   │   │
│   │   │   └───login
│   │   │       │   login_page.dart
│   │   │       │
│   │   │       └───child
│   │   │               form_login.dart
│   │   │               snackbar.dart
│   │   │
│   │   └───utilities
│   │           theme.dart
│   │
│   └───data
│       ├───model
│       │       auth_model.dart
│       │       employe_model.dart
│       │
│       ├───repository
│       │       auth_repository.dart
│       │       employe_repository.dart
│       │
│       └───service
│               auth_service.dart
│               employe_service.dart
```

## App Release

Go to this folder to install the App

```
build\app\outputs\flutter-apk\
```

or use link

[Link](https://drive.google.com/drive/u/1/folders/1uKPmIyy8iav_OIGcV16nrz0HX9WDgbYs)

## Login

```

email: eve.holt@reqres.in
password: cityslicka

```
