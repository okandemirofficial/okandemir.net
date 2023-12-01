import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';

///Row on desktop and column on the mobile
class RowToColumn extends StatelessWidget {
  const RowToColumn({
    super.key,
    required this.children,
    this.columnCrossAxisAlignment,
    this.columnMainAxisAlignment,
    this.rowCrossAxisAlignment,
    this.rowMainAxisAlignment,
    this.columnMainAxisSize,
    this.rowMainAxisSize,
  });

  final List<Widget> children;

  final CrossAxisAlignment? columnCrossAxisAlignment;
  final MainAxisAlignment? columnMainAxisAlignment;
  final MainAxisSize? columnMainAxisSize;

  final CrossAxisAlignment? rowCrossAxisAlignment;
  final MainAxisAlignment? rowMainAxisAlignment;
  final MainAxisSize? rowMainAxisSize;

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? Column(
            crossAxisAlignment: columnCrossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: columnMainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: columnMainAxisSize ?? MainAxisSize.max,
            children: children,
          )
        : Row(
            crossAxisAlignment: rowCrossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: rowMainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: rowMainAxisSize ?? MainAxisSize.max,
            children: children,
          );
  }
}
