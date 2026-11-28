import 'package:material_ui/material_ui.dart';

enum AutomataColor {
  purple(Color(0xFF82749E)),
  yellow(Color(0xFFE4CE6F)),
  mint(Color(0xFF8FC8B9)),
  red(Color(0xFFD56F73));

  const AutomataColor(this.value);
  final Color value;

  String get medallionAsset => this == yellow
      ? 'assets/images/medallion.png'
      : 'assets/images/medallion-$name.png';
}
