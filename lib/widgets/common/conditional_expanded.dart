import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';

class ConditionalExpanded extends StatelessWidget {
  const ConditionalExpanded({
    super.key,
    required this.expandedOnMobile,
    required this.child,
    this.flex,
  });

  final bool expandedOnMobile;

  final int? flex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!context.isMobile) {
      return Expanded(
        flex: flex ?? 1,
        child: child,
      );
    }
    if (!expandedOnMobile) {
      return child;
    }
    return Expanded(child: child);
  }
}
