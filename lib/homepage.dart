import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/widgets/about.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';
import 'package:portfolio_v2/widgets/introduction.dart';
import 'package:portfolio_v2/widgets/project_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => ManuelScrollingController.initBreakpoints());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SelectionArea(
        child: context.isMobile ? const MobilePage() : const DesktopPage(),
      ),
    );
  }
}

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: ManuelScrollingController.onVerticalDragUpdate,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: ManuelScrollingController.mainController,
        physics: const NeverScrollableScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(
            child: AboutWidget(),
          ),
          SliverToBoxAdapter(
            child: IntroductionWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
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
      ),
    );
  }
}

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingAll.l(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: AboutWidget()),
          Expanded(
            flex: 5,
            child: Listener(
              onPointerSignal: ManuelScrollingController.onPointerSignal,
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                controller: ManuelScrollingController.mainController,
                physics: const NeverScrollableScrollPhysics(),
                slivers: const [
                  SliverToBoxAdapter(
                    child: IntroductionWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 64),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
