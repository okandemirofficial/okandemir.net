import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/widgets/common/conditional_expanded.dart';
import 'package:portfolio_v2/widgets/common/row_to_colum.dart';
import 'package:portfolio_v2/widgets/common/store_badge.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FransizGastesi extends StatelessWidget {
  const FransizGastesi({super.key});

  @override
  Widget build(BuildContext context) {
    return RowToColumn(
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConditionalExpanded(
          expandedOnMobile: false,
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Fransız Gastesi',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                  '• Fransız Gastesi is a culture & news platform which well-known in Francophonie community.'),
              const Text(
                  '• Developed a one-of-a-kind news and blog application with a unique design.'),
              const Text('• WordPress API as a back-end solution.'),
              const Text('• Riverpod State Management. Isar storage'),
              const Text('• Firebase Notifications & Analytics'),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    height: context.isMobile ? 12.w : 19.sp,
                    child: const StoreBadge(
                        isIos: false,
                        link:
                            'https://play.google.com/store/apps/details?id=com.FransizGastesi.Gasteniz'),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: context.isMobile ? 12.w : 19.sp,
                    child: const StoreBadge(
                        isIos: true,
                        link:
                            'https://apps.apple.com/tr/app/frans%C4%B1z-gastesi/id1641149389'),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16,
          height: context.isMobile ? 32 : 0,
        ),
        const ConditionalExpanded(
          expandedOnMobile: false,
          flex: 2,
          child: SizedBox(
            height: 550,
            child: FransizGastesiHomepage(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
