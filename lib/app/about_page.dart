import 'package:flutter/services.dart' show PlatformException;
import 'package:material_ui/material_ui.dart';

import 'widgets/forest_surface.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late final packageInfo = PackageInfo.fromPlatform();

  Future<void> openLink(String url) async {
    try {
      if (await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        return;
      }
    } on PlatformException {
      // The browser could not be opened.
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.aboutLinkError)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(strings.aboutTitle)),
      body: ForestSurface(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/icons/play-store-icon.png',
                    width: 88,
                    height: 88,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Druids of Edora',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              FutureBuilder<PackageInfo>(
                future: packageInfo,
                builder: (context, snapshot) {
                  final version = snapshot.data?.version;
                  if (version == null || version.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    strings.aboutVersion(version),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(strings.aboutDescription),
              const SizedBox(height: 20),
              Text(
                strings.aboutAcknowledgments,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(strings.aboutCreatorCredit),
              const SizedBox(height: 12),
              link(
                strings.aboutBggProfile,
                'https://boardgamegeek.com/profile/jujuandco',
              ),
              link(
                strings.aboutOriginalSolo,
                'https://boardgamegeek.com/filepage/309448/unofficial-solo-for-druids-of-edora-byos',
              ),
              const Divider(),
              link(
                strings.aboutLicense,
                'https://github.com/rudsonalves/the_druids_of_edora',
              ),
              link(
                strings.aboutPrivacyPolicy,
                'https://rudsonalves.github.io/the_druids_of_edora/privacy-policy.html',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget link(String label, String url) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label),
    trailing: const Icon(Icons.open_in_new),
    onTap: () => openLink(url),
  );
}
