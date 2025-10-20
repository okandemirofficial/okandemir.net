import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/utils/project_image_providers.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StarpathProtocol extends StatelessWidget {
  const StarpathProtocol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Starpath Protocol',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
            '• Founder & Full-Stack Developer of Starpath Protocol — a mobile MMO strategy game.'),
        const Text(
            '• Built with Flutter Flame; backend and client entirely in Dart with MongoDB.'),
        const Text(
            '• Features include spaceship customization, PvP battles, leveling, missions; optimized for lightweight, strategic play.'),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => launchUrlString('https://starpathprotocol.com/'),
          child: const Text(
            'starpathprotocol.com',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          width: 700,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 1; i <= 5; i++)
                PaddingAll.s(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () => showImageViewerPager(
                        context,
                        ProjectsImageProvider(
                          count: 5,
                          initialIndex: i - 1,
                          imageFolder: 'starpath_protocol',
                          pictureName: (index) => '${index + 1}.jpeg',
                        ),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Image.asset(
                          'assets/images/starpath_protocol/$i.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
