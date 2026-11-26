import 'package:material_ui/material_ui.dart';

import '../../cards/automa_card.dart';

class AutomaFormBadge extends StatelessWidget {
  const AutomaFormBadge({super.key, required this.form});

  final AutomaForm form;

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/icons/form-${form.name}.png',
    width: 32,
    height: 32,
    excludeFromSemantics: true,
  );
}
