# Platter

A new Flutter application. Internal flutter study for WIT Mobile Developer.

## Getting Started

This is normal flutter app. You must follow the instructions from the [official documentation](https://flutter.dev/docs/cookbook). For Test Page, it use <b>BLoC</b> (Business Logic Component) to separate business logic with UI itself.

## Test Feature

- Search city

## Build with 🛠

- [BLoC Pattern](https://bloclibrary.dev/) - Business Logic Component to separate the business logic with UI.
- [Equatable](https://pub.dev/packages/equatable) - Comparation library for comparing objects in `Dart` often involves having to override the `==` operator.
- [Dio](https://github.com/flutterchina/dio/) - Type-safe HTTP client.
- [Json Serializable](https://pub.dev/packages/json_serializable) - Json handler.
- [Mockito](https://pub.dev/packages/mockito) - Mock creator library

## How To Run Flutter App

If you want to generate file `*.g.dart`, you can use this command on the terminal. But before you running that, make sure you are inside the project folder first using `cd`command. Then you can run the command below.

One time build:

```console
flutter pub run build_runner build
```

or you can watch for changes and rebuild automatically using this

```console
flutter pub run build_runner watch
```

## Todo

- [ ] Explore more about BLoC
- [ ] Setup Flavor for each stage
- [ ] Search street food (Test Page)
- [ ] More about unit test
- [ ] More about integration test
- [ ] Setup with Azure Cloud
