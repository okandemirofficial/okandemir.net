import 'package:flutter/material.dart';

class OrionInnovation extends StatelessWidget {
  const OrionInnovation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Orion Innovation',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
            '• Developed advanced mapping features (multi-layer maps, multiple providers, path tracking) for DeerCast, a leading hunting platform in the USA (deercast.com).'),
        const Text(
            '• Integrated shared libraries across multiple GSM Outdoors applications to promote code reuse and consistency.'),
        const Text(
            '• Designed and implemented a modular framework architecture following SOLID principles to enhance scalability and maintainability. Provided unit tests for each business logic.'),
        const Text(
            '• Collaborated closely with cross-functional teams to optimize mobile user experience and application performance.'),
      ],
    );
  }
}
