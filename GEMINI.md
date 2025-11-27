## Project Overview

This is a Flutter application for the International Churches of Christ (ICOC). It is a cross-platform mobile app for both Android and iOS. The app includes sections for a songbook, bible studies, Q&A, and video content.

The project follows the Clean Architecture pattern and utilizes the BLoC pattern for state management.

### Key Technologies

*   **Framework:** Flutter
*   **State Management:** `flutter_bloc`
*   **Navigation:** `go_router`
*   **Dependency Injection:** `get_it` with `injectable` for code generation
*   **Backend:** Firebase (Realtime Database, Storage, Crashlytics, Analytics)
*   **Local Storage:** `get_storage` for key-value pairs and `sqflite` for full-text search.
*   **Localization:** `easy_localization` for multi-language support.
*   **CI/CD:** Codemagic is used for continuous integration and deployment.

## Building and Running

### Prerequisites

*   Flutter SDK is installed.
*   An OpenAI key is required.

### Running the Application

To run the application, use the following command. Replace `your_open_ai_key` with your actual OpenAI API key.

```bash
flutter run --dart-define=openAIKey=your_open_ai_key
```

Alternatively, you can configure your IDE (like VS Code) to pass the `openAIKey` as an argument.

### Build Runner

The project uses code generation for dependency injection. If you add new dependencies or create new services, you may need to run the build runner:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Development Conventions

### Coding Style

The project enforces a strict set of linting rules defined in `analysis_options.yaml`. Please adhere to these rules to maintain code quality and consistency.

### State Management

State management is handled using the `flutter_bloc` package. When adding new features with state, create a new BLoC or Cubit and provide it to the widget tree, typically using the `MyMultiblocProvider`.

### Navigation

Routing is managed by the `go_router` package. All routes are defined in `lib/core/routes/app_router.dart`. When adding a new screen, define a new `GoRoute` in the router configuration.

### Dependency Injection

Dependency injection is managed using the `get_it` and `injectable` packages. Services are registered in `lib/injection.dart` and its generated counterpart. Annotate your services with `@injectable`, `@lazySingleton`, etc., and run the build runner to update the dependency graph.

### Localization

The application supports multiple languages using the `easy_localization` package. Translation files are located in `assets/translations` in JSON format. To add or update translations, edit the corresponding JSON file.
