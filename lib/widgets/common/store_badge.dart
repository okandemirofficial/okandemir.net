import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoreBadge extends StatelessWidget {
  const StoreBadge({super.key, required this.isIos, required this.link});

  final bool isIos;
  final String link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => launchUrlString(link),
        child: Image.asset(
          isIos ? 'assets/images/app_store.png' : 'assets/images/google_play.png',
        ));
  }
}
