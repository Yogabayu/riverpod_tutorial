import 'package:flutter/material.dart';

import '../../utils/themes.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final bool elevated;

  CustomCard({
    required this.child,
    required this.onTap,
    required this.borderRadius,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevated
          ? BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
              boxShadow: [
                Themes.cardShadow,
              ],
            )
          : BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
            ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
