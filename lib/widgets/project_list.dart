import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/project_paddings.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/widgets/common/apply_desktop_space.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';
import 'package:portfolio_v2/widgets/project_items/applantis.dart';
import 'package:portfolio_v2/widgets/project_items/diziyleogren.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/fransiz_gastesi.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplyDesktopSpace(
      child: Padding(
        padding: context.isMobile ? const EdgeInsets.all(ProjectPaddings.medium) : EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.isMobile ? 370.h : 2100,
              child: VerticalDivider(
                thickness: 0.5,
                indent: 24,
                width: 16,
                color: appColorsDark.onBackground,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(-24, 16),
                    child: const Icon(
                      Icons.circle_rounded,
                      size: 16,
                    ),
                  ),
                  const Text('Jan 23 - Present'),
                  Applantis(
                    scrollController: ManuelScrollingController.horizontalControllers[0],
                  ),
                  SizedBox(
                    height: context.isMobile ? 64 : 128,
                  ),
                  Transform.translate(
                    offset: const Offset(-24, 16),
                    child: const Icon(
                      Icons.circle_rounded,
                      size: 16,
                    ),
                  ),
                  const Text('Jul 22 - Jan 23'),
                  FransizGastesi(
                    scrollController: ManuelScrollingController.horizontalControllers[1],
                  ),
                  SizedBox(
                    height: context.isMobile ? 64 : 128,
                  ),
                  Transform.translate(
                    offset: const Offset(-24, 16),
                    child: const Icon(
                      Icons.circle_rounded,
                      size: 16,
                    ),
                  ),
                  const Text('Jun 19 - Present'),
                  Diziyleogren(
                    scrollController: ManuelScrollingController.horizontalControllers[2],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
