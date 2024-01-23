import 'package:film_planner/config/palette.dart';
import 'package:flutter/material.dart';

class MoreSideBar extends StatefulWidget {
  const MoreSideBar({super.key, this.padding});

  final EdgeInsets? padding;

  @override
  State<MoreSideBar> createState() => _MoreSideBarState();
}

class _MoreSideBarState extends State<MoreSideBar> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isExpanded ? 200 : 0,
              height: double.infinity,
              constraints: const BoxConstraints(maxWidth: 500),
              color: Palette.primaryColor,
            ),
            AnimatedContainer(
              height: isExpanded ? 100 : 80,
              width: isExpanded ? 24 : 16,
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: widget.padding?.left != null && !isExpanded
                        ? BorderRadius.circular(4)
                        : const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                  ),
                  child: Center(
                      child: Icon(
                    isExpanded ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded,
                    size: 16,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
