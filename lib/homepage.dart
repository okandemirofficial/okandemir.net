import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/widgets/about.dart';
import 'package:portfolio_v2/widgets/introduction.dart';
import 'package:portfolio_v2/widgets/project_list.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SelectionArea(
        child: context.isMobile ? const MobilePage() : DesktopPage(),
      ),
    );
  }
}

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: AboutWidget(),
        ),
        SliverToBoxAdapter(
          child: IntroductionWidget(),
        ),
        SliverToBoxAdapter(
          child: ProjectListWidget(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 500,
          ),
        )
      ],
    );
  }
}

class DesktopPage extends StatelessWidget {
  DesktopPage({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PaddingAll.l(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: AboutWidget()),
          Expanded(
            flex: 5,
            child: WebSmoothScroll(
              animationDuration: 250,
              controller: _controller,
              child: CustomScrollView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                slivers: const [
                  SliverToBoxAdapter(
                    child: IntroductionWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: ProjectListWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
