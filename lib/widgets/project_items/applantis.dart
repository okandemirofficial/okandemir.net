import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/utils/project_image_providers.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';
import 'package:portfolio_v2/widgets/common/store_badge.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Applantis extends StatelessWidget {
  const Applantis({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: context.isMobile ? null : ManuelScrollingController.globalKeys[0],
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Applantis Software',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
            '• Created & maintained a leading tennis application called Serve24 Pro. (Android & IOS)'),
        const Text('• MVMM App Architecture'),
        const Text('• Bloc State Management package to handle app states'),
        const Text('• Codemagic CD/CI tools'),
        const Text('• Git tools'),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          width: 700,
          child: ListView(
            key: context.isMobile ? ManuelScrollingController.globalKeys[0] : null,
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            children: [
              for (var i = 0; i < 4; i++)
                PaddingAll.s(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () => showImageViewerPager(
                        context,
                        ProjectsImageProvider(
                          count: 4,
                          initialIndex: i,
                          imageFolder: 'serve24',
                        ),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Image.asset(
                          'assets/images/serve24/ss$i.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SizedBox(
              height: context.isMobile ? 12.w : 19.sp,
              child: const StoreBadge(
                  isIos: false,
                  link: 'https://play.google.com/store/apps/details?id=com.applantis.serve24pro'),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: context.isMobile ? 12.w : 19.sp,
              child:
                  const StoreBadge(isIos: true, link: 'https://apps.apple.com/tr/app/id1661857071'),
            ),
          ],
        ),
      ],
    );
  }
}
