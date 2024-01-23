import 'package:flutter/material.dart';

import '../../../../config/palette.dart';

class MessageFloatingIcon extends StatelessWidget {
  const MessageFloatingIcon({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Palette.primaryColor,
      child: IconButton(
        icon: const Icon(Icons.message_rounded),
        color: Palette.onPrimaryColor,
        onPressed: onPressed,
      ),
    );
  }
}
