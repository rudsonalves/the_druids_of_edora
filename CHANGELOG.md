# Changelog

## 2026/11/26 - initial/start_project

This change establishes the Flutter companion app for the Malfurion automa in *The Druids of Edora*. It adds Android and iOS projects, the setup, dice, and card flows, and the tooling and documentation for development.

1. **`lib/app`, `lib/main.dart`, and `lib/features/setup`**

   * Added the app entry point, dark theme, and manual Portuguese (BR) and English selection.
   * Added automa color selection, setup instructions, and dice rendering with accessibility labels.

2. **`lib/features/dice` and `lib/features/cards`**

   * Added an animated roll of 13 dice and navigation to the card flow.
   * Added a seven-card deck that reshuffles after each cycle, card instructions, and die selection by strongest, weakest, or most frequent value.
   * Added dolmen setup and multi-die placement, with available dice tracked as cards are used.

3. **`android/` and `ios/`**

   * Added native Flutter runners, build configuration, launch assets, app icons, and platform test scaffolding.

4. **`pubspec.yaml`, `pubspec.lock`, and `analysis_options.yaml`**

   * Declared Flutter dependencies, SDK constraints, and analyzer settings.

5. **`test/`**

   * Added deck and die selection tests, plus widget tests for setup, language selection, dice, card progression, and dolmen placement.

6. **`Makefile`, `README.md`, `CHANGELOG.md`, `.gitignore`, `.gitattributes`, and `.metadata`**

   * Added development checks, run and build commands, and a release target; documented their use.
   * Added a changelog header, project metadata, Git ignore rules, and binary handling for PDFs.

7. **`docs/`**

   * Added game reference PDFs and an image.
   * Added an internationalization backlog covering Flutter localization generation, text migration, language behavior, and verification.

### Conclusion

The repository now contains a Flutter app for preparing and running the Malfurion automa, with native mobile projects, automated tests, and development and release guidance.