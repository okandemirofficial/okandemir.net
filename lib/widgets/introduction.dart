import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/project_paddings.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/widgets/common/apply_desktop_space.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ApplyDesktopSpace(
      child: _IntroductionColumn(),
    );
  }
}

class _IntroductionColumn extends StatelessWidget {
  const _IntroductionColumn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.isMobile
          ? const EdgeInsets.all(ProjectPaddings.medium)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!context.isMobile)
            SizedBox(
              height: 5.h,
            ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hello! I am ',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.headlineLarge,
                ),
                TextSpan(
                  text: 'Okan',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: appColorsDark.primary,
                            fontWeight: FontWeight.w900,
                          )
                      : Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: appColorsDark.primary,
                            fontWeight: FontWeight.w900,
                          ),
                ),
                TextSpan(
                  text: ' from Istanbul. A Mobile Developer with over ',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.headlineLarge,
                ),
                TextSpan(
                  text: '4',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: appColorsDark.primary,
                            fontWeight: FontWeight.w900,
                          )
                      : Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: appColorsDark.primary,
                            fontWeight: FontWeight.w900,
                          ),
                ),
                TextSpan(
                  text: ' years of experience.',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          SizedBox(height: context.isMobile ? 16 : 64),
          Text(
            "Designing, developing, and maintaining high-quality mobile applications for IOS and Android platforms.",
            style: context.isMobile
                ? Theme.of(context).textTheme.bodySmall
                : Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 64),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Text(
                  'To see my projects',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w100),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 32,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
