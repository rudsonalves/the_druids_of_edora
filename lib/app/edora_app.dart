import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../features/setup/setup_page.dart';

class EdoraApp extends StatefulWidget {
  const EdoraApp({super.key, this.random});

  final Random? random;

  @override
  State<EdoraApp> createState() => _EdoraAppState();
}

class _EdoraAppState extends State<EdoraApp> {
  Locale? selectedLocale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Druids of Edora',
      debugShowCheckedModeBanner: false,
      locale: selectedLocale ?? const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR'), Locale('en')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color(0xFFD8AE64),
              brightness: Brightness.dark,
            ).copyWith(
              primary: const Color(0xFFE2BD77),
              onPrimary: const Color(0xFF142E2A),
              surface: const Color(0xFF183A32),
              onSurface: const Color(0xFFF4ECDD),
            ),
        scaffoldBackgroundColor: const Color(0xFF102B28),
        useMaterial3: true,
      ),
      home: SetupPage(
        random: widget.random ?? Random(),
        onLocaleChanged: (locale) => setState(() => selectedLocale = locale),
      ),
    );
  }
}
