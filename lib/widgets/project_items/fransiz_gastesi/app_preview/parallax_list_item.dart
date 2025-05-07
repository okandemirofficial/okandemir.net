import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/project_paddings.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/post_model.dart';

class FransizGastesiParallaxListItem extends StatelessWidget {
  const FransizGastesiParallaxListItem(this.model, {Key? key})
      : super(key: key);

  final FransizGastesiPostModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ProjectPaddings.medium, vertical: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: _ParallaxListItem(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  model.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white.withAlpha((0.8 * 255).round()),
                      fontSize: 14),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          summary: Text(
            model.excerpt,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white.withAlpha((0.8 * 255).round()),
                ),
          ),
          aspectRatio: 3 / 2,
          backgroundItem: Image.asset(
            model.featuredMediaUrl,
            fit: BoxFit.cover,
          ),
          author: Row(
            children: [
              Text(
                model.date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withAlpha((0.8 * 255).round()),
                    ),
              ),
              const Spacer(),
              Text(
                model.author,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withAlpha((0.8 * 255).round()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxListItem extends StatelessWidget {
  _ParallaxListItem({
    Key? key,
    required this.title,
    required this.summary,
    required this.backgroundItem,
    required this.aspectRatio,
    this.author = const SizedBox.shrink(),
  }) : super(key: key);

  final Widget title;
  final Widget summary;
  final Widget backgroundItem;
  final Widget author;
  final double aspectRatio;
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(child: backgroundItem),
            _textWidgets(context),
          ],
        ),
      ),
    );
  }

  _textWidgets(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
          itemglobalKey: _globalKey,
          listItemContext: context,
          scrollable: Scrollable.of(context)),
      children: [
        Container(
          key: _globalKey,
          color: Theme.of(context)
              .colorScheme
              .secondary
              .withAlpha((0.9 * 255).round()),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16, top: 4.0),
            child: SizedBox(
              height: 114,
              child: Column(
                children: [
                  title,
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: summary,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: author,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.itemglobalKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey itemglobalKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.topLeft(const Offset(0, -200)),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    //final viewportDimension = scrollable.position.viewportDimension;
    final viewportDimension = scrollable.position.viewportDimension / 3;
    //final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    //final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    final verticalAlignment = Alignment(0.0, scrollFraction * 2);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (itemglobalKey.currentContext!.findRenderObject() as RenderBox).size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
        backgroundSize, Offset.zero & listItemSize * 1.37);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        itemglobalKey != oldDelegate.itemglobalKey;
  }
}
