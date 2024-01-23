import 'package:flutter/material.dart';

import '../../../../config/palette.dart';

class HelpIconButton extends StatelessWidget {
  const HelpIconButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Palette.primaryColor,
      child: IconButton(
        icon: const Icon(Icons.help_outline),
        color: Palette.onPrimaryColor,
        onPressed: onPressed,
      ),
    );
  }
}
