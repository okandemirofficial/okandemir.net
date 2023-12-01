import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';

class ApplyDesktopSpace extends StatelessWidget {
  const ApplyDesktopSpace({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!context.isMobile) const Spacer(),
        if (context.isMobile) Expanded(child: child) else SizedBox(width: 750, child: child),
        if (!context.isMobile) const Spacer()
      ],
    );
  }
}
