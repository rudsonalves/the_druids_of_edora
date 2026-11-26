# Changelog

## 2026/11/26 - ajustes/cartas-06

This change prevents the Automa deck from drawing `surroundFire` during its first seven draws. It updates draw eligibility and opening deck order, adds test coverage, and increments the build version.

1. **lib/features/cards/automa_card.dart**

   * Added a shared eligibility check for `connectDolmens` and `surroundFire`, used by both shuffle detection and card selection.
   * Arranged the initial deck so its first seven draws exclude `surroundFire`.

2. **test/automa_deck_test.dart**

   * Added an assertion that the first seven draws exclude `surroundFire` while retaining checks that both cycles contain the expected cards.

3. **pubspec.yaml**

   * Incremented the build version from `0.8.0+1` to `0.8.0+2`.

### Conclusion

The deck now enforces the seven-draw opening restriction for `surroundFire`, with test coverage for the opening sequence and full deck cycles.
## 2026/11/26 - ajustes/cartas-04

This change updates the Automata game flow, supply rules, and card presentation. It adds launch artwork, an end-of-game summary, and Android release bundle signing support.

1. **Makefile, README.md, and android/app/build.gradle.kts**

   * Added `make build-aab` with an upload key configuration check and a signed release app bundle build.
   * Replaced debug signing for Android release builds with a signing configuration loaded from `android/key.properties`.
   * Documented the upload key properties, build command, output path, and version source.

2. **Android and iOS launch resources, assets/icons, and docs/images**

   * Added launch artwork and a matching background color for Android and iOS splash screens, including Android 12 styles.
   * Added Druid and Bear form icons, a Play Store icon, and a Play Store feature graphic.

3. **lib/app**

   * Added an animated `LaunchIntro` before setup, with an immediate transition when animations are disabled.
   * Updated `EdoraApp` to show setup after the intro completes.

4. **lib/features/cards**

   * Changed tablet selection to consume only the selected copy; potion selection continues to consume the selected item and earlier items.
   * Advanced potion draws through available cost tiers and added a fallback to all remaining potions.
   * Reconciled supply queues after inventory adjustments and added counts for unavailable items and placed amulet gems.
   * Added a game summary with dice, dolmen, supply, sickle, knowledge, and amulet totals. The summary supports restart, Android app exit, and closing on other platforms.

5. **lib/features/cards/widgets**

   * Updated card sections to reflect resolved actions and rearranged movement and die content.
   * Displayed placed stone counts and updated supply selection visuals to show which items will be consumed.

6. **lib/features/setup and lib/l10n**

   * Replaced the drawn form badges with image assets and added them to the form selection dialog.
   * Renamed Malfurion references to Automata in English and Portuguese, revised action and supply instructions, and added game summary labels.
   * Updated the generated localization classes to match the translation files.

7. **pubspec.yaml and test**

   * Updated the app description to refer to the solo Automata.
   * Revised supply tests for tablet consumption and potion tier fallback, and expanded widget coverage for the game summary and platform exit behavior.

### Conclusion

The app now presents a branded launch sequence, applies the revised supply rules, and shows a reviewable summary when play ends. The change also prepares Android release bundles for upload key signing.
## 2026/11/26 - ajustes/cartas-03

This change updates the app’s displayed name and refines the setup screen. It adds a restart action, replaces the setup chips with a compact summary, and updates localization and widget coverage for the new UI.

1. **AndroidManifest.xml, Info.plist, and lib/app/edora_app.dart**

   * Changed the Android label, iOS display name, and Flutter app title to “Druids of Edora”.

2. **lib/features/setup**

   * Updated the app bar title and replaced the color, form, and player chips with a color swatch, form badge, and abbreviated player count.
   * Added tooltips for the color and form, plus an accessibility label for the player count.
   * Added a restart button that cancels an active roll, clears the setup selections and dice, and reopens setup selection.

3. **lib/features/setup/widgets/automa_form_badge.dart**

   * Added a painted badge with distinct druid and bear designs.

4. **lib/l10n**

   * Added English and Portuguese strings for the restart action and abbreviated player count, including generated localization methods.

5. **test/widget_test.dart**

   * Updated setup assertions for the tooltip and abbreviated player count.
   * Added checks for the restart button’s placement and for clearing dice when setup restarts.

### Conclusion

The setup screen now presents selections more compactly and lets users restart the flow. The app name is consistent across Flutter, Android, and iOS.
## 2026/11/26 - ajustes/cartas-02

This change adds a shrine action flow to the card screen. Players can identify available actions at a shrine, draw one, complete it, and see its outcome beside the selected die. Setup now records the player count used to limit shrine action choices.

1. **`lib/features/setup/setup_page.dart`**

   * Added a required choice of two to four players, displayed it in the setup summary, and passed it to the card screen.
   * Reorganized setup helpers and adjusted the automa form dialog button alignment.

2. **`lib/features/cards/cards_page.dart` and `widgets/shrine_action_dialog.dart`**

   * Added a dialog for marking available shrine actions up to the player count and randomly selecting one.
   * Added availability checks, action execution, and per-die outcome tracking.
   * Prevented card advancement and player connection completion while an action is pending, with an option to mark an unavailable action.

3. **`lib/features/cards/action_supply.dart`, `automa_card.dart`, and `widgets/automa_instruction_card.dart`**

   * Exposed unshuffled available supply items for action checks while retaining shuffled draws.
   * Identified cards that use shrine actions and extracted deck refill logic.
   * Added the shrine action control and displayed resolved action details beside selected dice.

4. **`lib/l10n` and `assets/actions/any-action.png`**

   * Added English and Portuguese text for player setup and shrine actions, along with the generic action image.
   * Changed the available stone count display to a fraction out of six.

5. **Android and iOS app icons**

   * Updated launcher icon images across Android densities and iOS icon sizes.

6. **`test/widget_test.dart`**

   * Updated setup tests to select a player count and card tests to resolve pending actions.
   * Added checks that advancement stays disabled until shrine actions are resolved.

### Conclusion

The card flow now supports shrine actions with choices limited by player count and records their results beside the dice. The change also updates setup, localized text, app imagery, and widget coverage.
## 2026/11/26 - ajustes/cartas-01

This change expands Malfurion’s card actions with supply tracking, sickle and amulet progress, and knowledge progress. It also moves dice rolling into setup and updates the game flow, localization, and tests.

1. **`lib/features/cards/action_supply.dart` and supply dialogs**

   * Added stock tracking for tablets, potions, standing stones, and runestones.
   * Added randomized item queues, turn-based potion ranges, and consumption through the selected item.
   * Added dialogs for choosing supplies and viewing or adjusting inventory.

2. **`lib/features/cards/sickle_amulet.dart` and `widgets/amulet_dialog.dart`**

   * Added sickle progress and amulet slot tracking.
   * Added a dialog for selecting an empty amulet slot, with a sickle option when the second position is full.

3. **`lib/features/cards/cards_page.dart` and `widgets/automa_instruction_card.dart`**

   * Connected supply, sickle, amulet, and knowledge actions to the card interface.
   * Added inventory controls and per-card action state.
   * Added a finish-game action after all dice are used and prevented back navigation during play.

4. **`lib/features/cards/automa_card_localization.dart` and `lib/l10n/`**

   * Updated action instructions and added English and Portuguese strings for setup, supplies, inventory, progress, and game completion.
   * Updated the generated localization classes to expose the new messages.

5. **`lib/features/setup/setup_page.dart` and `lib/features/dice/dice_page.dart`**

   * Moved the animated 13-die roll into setup and removed the separate dice page.
   * Added color and form selection dialogs, then routed directly from setup to the cards page.

6. **`test/action_supply_test.dart` and `test/widget_test.dart`**

   * Added coverage for supply counts, queues, potion turn ranges, and independent stone stocks.
   * Updated widget tests for the revised setup and navigation flow, inventory display, and game completion.

### Conclusion

The game now tracks card action resources and progress within the cards flow. Setup includes dice rolling, and the updated navigation provides a defined way to finish a game.
## 2026/11/26 - recursos/dolmens-01

This change adds draw limits and pair tracking for the “Connect 2 dolmens” card. It also replaces free-text pair entry with a visual selector and adds the assets, translations, documentation, and tests used by the new flow.

1. **`lib/features/cards/automa_card.dart`**

   * Added draw and dolmen occurrence counters that continue across deck reshuffles.
   * Deferred the dolmen card after its second appearance during the first nine draws and made it ineligible when no pairs remain. Updated deck replenishment to draw from eligible cards while retaining deferred cards.

2. **`lib/features/cards/`**

   * Added six typed dolmen pairs with localized names and image paths, replacing the setup dialog’s text field with image-backed choices for available pairs.
   * Tracked completed pairs on the cards page and added an action for a player-completed connection that advances to the next card without consuming another die.
   * Updated the instruction card to show the selected pair’s image and die progress during a connection.

3. **`assets/` and `pubspec.yaml`**

   * Added six dolmen images and fifteen tablet images, and registered both asset folders with Flutter.

4. **`lib/l10n/`**

   * Added English and Portuguese color names and player-connection labels. Updated setup and die-placement wording, and changed dolmen progress to show the die count without the pair name.

5. **`docs/`**

   * Added a backlog describing the card draw and pair-selection rules, with acceptance criteria and an open decision about recording connections outside the card flow.
   * Moved the internationalization backlog files to `docs/backlogs/closed/` and added dolmen and stone-tablet reference images.

6. **`test/`**

   * Updated deck tests for the draw counter and added coverage for tenth-draw eligibility and deferral when no pair is available.
   * Updated widget tests to select a visual pair and check the revised die progress and button text.

### Conclusion

The change set adds pair-aware dolmen card selection and a visual connection flow, with supporting assets, localization, documentation, and tests.
## 2026/11/26 - internacionalizacao/implementecao-01

This change adds generated English and Portuguese localizations to the Malfurion companion app. It moves interface and card instructions into translation catalogs while retaining the manual language selector and Brazilian Portuguese default. The diff also adds potion assets, reorganizes reference manuals, and updates widget coverage.

1. **Localization configuration and catalogs**

   * Added `l10n.yaml`, English and Portuguese ARB catalogs, and generated `AppLocalizations` classes.
   * Enabled Flutter localization generation, added `intl` as a direct dependency, and excluded generated localization files from analysis.

2. **App setup and dice flow**

   * Registered the localization delegate and supported locales in `lib/app/edora_app.dart`.
   * Migrated setup instructions, color names, navigation labels, dice messages, and die accessibility labels to localized strings.

3. **Card and dolmen flow**

   * Moved the seven card descriptions from `automa_card.dart` into the catalogs and added `automa_card_localization.dart` to resolve them by card identity.
   * Localized card controls, available-dice counts, dolmen setup fields, and progress text. Removed boolean language parameters and changed the die section to use an explicit display flag instead of comparing translated titles.

4. **Assets, documentation, and tests**

   * Added 18 potion images under `assets/potions/`, registered that asset directory, and added `docs/images/potions.png`.
   * Moved three reference PDFs into `docs/manuals/` and added an internationalization task checklist.
   * Extended the English widget test through the card screen and updated the package version to `0.1.0+1`.

### Conclusion

The app now draws its setup, dice, and card text from generated English and Portuguese localizations, including parameterized messages and accessibility labels. The change set also supplies potion assets and organizes the supporting documentation.
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
