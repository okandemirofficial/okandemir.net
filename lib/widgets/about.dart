import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_v2/const/const.dart';
import 'package:portfolio_v2/const/project_paddings.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.isMobile ? 600 : 700),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: Const.defaultShape,
        child: Padding(
          padding: const EdgeInsets.all(ProjectPaddings.medium),
          child: Column(
            children: [
              Text(
                'Okan',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Mobile Application Developer',
                style: context.isMobile
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              ClipOval(
                child: Image.asset(
                  'assets/images/pp.jpg',
                  height: context.isMobile ? 200 : 250,
                  width: context.isMobile ? 200 : 250,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'me@okandemir.net',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Istanbul / Turkey',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 2.h,
              ),
              RowWithSpacing.m(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () =>
                        launchUrlString('https://github.com/okandemirofficial'),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: Icon(
                          LineIcons.github,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  PaddingHorizontal.s(
                    child: InkWell(
                      onTap: () =>
                          launchUrlString('https://okandemirdev.medium.com/'),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          child: Icon(
                            LineIcons.mediumM,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => launchUrlString(
                        'https://www.linkedin.com/in/okandemirofficial'),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: Icon(
                          LineIcons.linkedinIn,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  PaddingHorizontal.s(
                    child: InkWell(
                      onTap: () => launchUrlString(
                          'https://www.instagram.com/okandemirofficial'),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          child: Icon(
                            LineIcons.instagram,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () => launchUrlString('mailto:me@okandemir.net'),
                  style: ButtonStyle(
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromHeight(50)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail_outline_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'MAIL ME!',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 0, maxHeight: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}
