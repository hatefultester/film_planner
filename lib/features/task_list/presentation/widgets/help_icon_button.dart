import 'package:film_planner/config/constants.dart';
import 'package:flutter/material.dart';

import '../../../../config/palette.dart';

class HelpIconButton extends StatelessWidget {
  const HelpIconButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: SizedBox.square(
        dimension: Constants.appBarActionSize,
        child: CircleAvatar(
          backgroundColor: Palette.primaryColor,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.help_outline,
            ),
            iconSize: Constants.appBarActionIconSize,
            color: Palette.onPrimaryColor,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
