import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/utils/project_image_providers.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';
import 'package:portfolio_v2/widgets/common/store_badge.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Diziyleogren extends StatelessWidget {
  const Diziyleogren({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: context.isMobile ? null : ManuelScrollingController.globalKeys[2],
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Diziyleogren',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
            "• A startup was built by us, focusing on an English vocabulary learning platform that utilizes series and movies. Our idea was appreciated by many authorities, resulting in approval for inclusion in the Turkish Exporters Assembly's Startup Program"),
        const Text(
            '• The responsibility of building the platform website and mobile app was assigned to me. The Android application, under my supervision, has been downloaded 39,000 times'),
        const Text(
            '• The tech stack utilized for the project consisted of Asp .Net, Microsoft SQL Server, jQuery, and Flutter.'),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          width: 700,
          child: ListView(
            key: context.isMobile ? ManuelScrollingController.globalKeys[2] : null,
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            children: [
              for (var i = 0; i < 7; i++)
                PaddingAll.s(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () => showImageViewerPager(
                        context,
                        ProjectsImageProvider(
                          count: 4,
                          initialIndex: i,
                          imageFolder: 'diziyleogren',
                        ),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Image.asset(
                          'assets/images/diziyleogren/ss$i.png',
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
                link: 'https://play.google.com/store/apps/details?id=com.diziyleogren.diziyleogren',
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: context.isMobile ? 12.w : 19.sp,
              child: const StoreBadge(
                  isIos: true, link: 'https://apps.apple.com/tr/app/diziyleogren/id6444682457'),
            ),
          ],
        ),
      ],
    );
  }
}
