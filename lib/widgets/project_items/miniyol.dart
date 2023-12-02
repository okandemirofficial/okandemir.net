import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/utils/project_image_providers.dart';
import 'package:portfolio_v2/widgets/common/store_badge.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Miniyol extends StatelessWidget {
  const Miniyol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Miniyol',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
            '• A new business model, Miniyol Self, offering a C2C rent-a-car solution, has been developed by our team.'),
        const Text(
            '''• Involvement in the KYC (Know Your Customer) process was undertaken, focusing on the integration of complex dynamic forms and the management of photo and video content.'''),
        const Text(
            '• Pixel-perfect pages were coded from Figma designs, ensuring meticulous detail and accuracy in the development process.'),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          width: 700,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < 3; i++)
                PaddingAll.s(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () => showImageViewerPager(
                        context,
                        ProjectsImageProvider(
                          count: 3,
                          initialIndex: i,
                          imageFolder: 'miniyol',
                          pictureName: (index) => '$index.jpeg',
                        ),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Image.asset(
                          'assets/images/miniyol/$i.jpeg',
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
                  link:
                      'https://play.google.com/store/apps/details?id=com.miniyol.arac.kiralama'),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: context.isMobile ? 12.w : 19.sp,
              child: const StoreBadge(
                  isIos: true,
                  link:
                      'https://apps.apple.com/us/app/miniyol-ara%C3%A7-kiralama/id1564745639'),
            ),
          ],
        ),
      ],
    );
  }
}
