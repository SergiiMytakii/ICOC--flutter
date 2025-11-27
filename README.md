

# The app for the International Churches of Christ (ICOC).
* Includes:
  * Songbook section (texts, chords, and videos of songs in more than 10 languages) 
  * Video section 
  * Bible study section
  * Q&A section


# Features:
  * Bloc as a state manager.
  * Clean architecture pattern.
  * Rich animations.
  * Advanced filtering and sorting features to achieve the best user experience.
  * Flexibility. Seamless adding materials in new languages.
  * Firebase as a backend (RealTime DB, Storage, Crashlytics, Analytics).
  * Offline full-text search with SQLite virtual tables
  * Multilanguage support.
  * translation to other languages using ChatGpt

# Admin panel
  * implemented the admin panel to manage content
  * https://icoc-8f075.web.app/
  * https://github.com/SergiiMytakii/icoc_admin_pannel

# Dev Notes
* To enable injectable generation run:$ dart run build_runner watch --delete-conflicting-outputs
* For Codemagic:  Before Pull Request with dev delete Podfile.loc to avoid a build crash in Codemagic.
* To test deep links on IOS simulator:$  xcrun simctl openurl booted your-app-scheme://your-deep-link-path
* To run app:$ flutter run --dart-define=openAIKey=your_open_ai_key
* To run in debug mode set your launch.json file: 
    {
  "version": "0.2.0",
  "configurations": [
    {
      "name": "icoc-flutter",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--dart-define",
        "openAIKey=..."
      ]
    }
  ]
}




