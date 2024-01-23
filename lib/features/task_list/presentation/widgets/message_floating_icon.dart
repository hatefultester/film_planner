import 'package:film_planner/config/constants.dart';
import 'package:flutter/material.dart';

import '../../../../config/palette.dart';

class MessageFloatingIcon extends StatelessWidget {
  const MessageFloatingIcon({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: Constants.floatingActionButtonSize + 48,
      child: Stack(
        children: [
          Center(
            child: SizedBox.square(
              dimension: Constants.floatingActionButtonSize + 48,
              child: CircleAvatar(
                backgroundColor: Palette.primaryColor.withOpacity(0.2),
              ),
            ),
          ),
          Center(
            child: SizedBox.square(
              dimension: Constants.floatingActionButtonSize + 24,
              child: CircleAvatar(
                backgroundColor: Palette.primaryColor.withOpacity(0.4),
              ),
            ),
          ),
          Center(
            child: SizedBox.square(
              dimension: Constants.floatingActionButtonSize,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Palette.backgroundColor.withOpacity(0.8),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Palette.primaryColor,
                ),
                child: IconButton(
                  icon: const Icon(Icons.message_rounded),
                  padding: EdgeInsets.zero,
                  iconSize: Constants.floatingActionButtonIconSize,
                  color: Palette.onPrimaryColor,
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
