import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManuelScrollingController {
  static final globalKeys = [GlobalKey(), GlobalKey(), GlobalKey()];
  static final horizontalControllers = [ScrollController(), ScrollController(), ScrollController()];
  static final mainController = ScrollController();

  static const int _animationDuration = 400;

  static List<double> breakPoints = [500, 1000, 1500];

  static const double _horizontalScrollOffset = 60;
  static int _index = 0;
  static double _mainScroll = 0;
  static const double _mainScrollOffset = 10;

  static void initBreakpoints() {
    final newBreakpoints = <double>[];
    for (var key in globalKeys) {
      RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      // debugPrint(position.dy.toString());
      // debugPrint('increased: ${position.dy}');
      newBreakpoints.add(position.dy - (Device.screenType == ScreenType.mobile ? 10.h : 0));
    }
    breakPoints = newBreakpoints;
  }

  ///https://github.com/mayurnile/web_smooth_scroll/blob/main/lib/src/source.dart
  static void onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      ///Touchpad detector. Behaviour like mobile
      // debugPrint('event.scrollDelta.dy: ${event.scrollDelta.dy}');
      if ((event.scrollDelta.dy < 100 && event.scrollDelta.dy > -100)) {
        _handleVerticalDragUpdate(event.scrollDelta.dy, false);
        return;
      }

      //First calculate target scroll of main scroll controller
      final double mainTarget =
          _calculateTargetScroll(event, mainController, _mainScroll, _mainScrollOffset);

      final index = _index;

      ///If _index passed list count: let it go
      if (index >= breakPoints.length) {
        _animateTargetController(mainController, mainTarget);
        _mainScroll = mainTarget;
        return;
      }

      //If target smaller than current breakPoint. animate and return
      if (mainTarget <= breakPoints[index]) {
        _animateTargetController(mainController, mainTarget);
        _mainScroll = mainTarget;
        return;
      }

      //If main target scrool exceeds currentBreakPoint:

      // 1- Animate mainScroll until breakpoint
      _animateTargetController(mainController, breakPoints[index]);
      _mainScroll = breakPoints[index];

      // 2- Check current vertical controller status and animate.
      final double horizontalTarget = _calculateTargetScroll(event, horizontalControllers[index],
          horizontalControllers[index].offset, _horizontalScrollOffset);

      // 3- Animate horizontalTarget
      _animateTargetController(horizontalControllers[index], horizontalTarget);

      // 4- Check horizontalController and increaseIndex if it's exceed edges
      if (horizontalTarget >= horizontalControllers[index].position.maxScrollExtent) {
        _index = _index + 1;
        return;
      }
      // debugPrint('offset: ${horizontalControllers[_index].offset}');
      // debugPrint('minScrollExtent: ${horizontalControllers[_index].position.minScrollExtent}');
      if (horizontalTarget <= horizontalControllers[index].position.minScrollExtent) {
        _index = _index - 1;
        return;
      }
    }
  }

  ///It's mobile version of [onPointerSignal]
  static void onVerticalDragUpdate(DragUpdateDetails details) async {
    _handleVerticalDragUpdate(details.delta.dy, true);
  }

  ///Common method for both mobile and trackpads
  static _handleVerticalDragUpdate(double delta, bool isMobile) {
    //First calculate target scroll of main scroll controller
    final double mainTarget =
        _calculateTargetMove(delta, mainController, _mainScroll, _mainScrollOffset, isMobile);

    final index = _index;

    ///If _index passed list count: let it go
    if (index >= breakPoints.length) {
      _jumpTargetController(mainController, mainTarget);
      _mainScroll = mainTarget;
      return;
    }

    //If target smaller than current breakPoint. animate and return
    if (mainTarget <= breakPoints[index]) {
      _jumpTargetController(mainController, mainTarget);
      _mainScroll = mainTarget;
      return;
    }

    //If main target scrool exceeds currentBreakPoint:
    ///This step is useless on mobile & trackpad
    // 1- Animate mainScroll until breakpoint
    // _jumpTargetController(
    //     mainController, (isMobile ? _mobileBreakPoints[index] : _desktopBreakPoints[index]));
    // _mainScroll = _mobileBreakPoints[index];

    // 2- Check current vertical controller status and animate.
    final double horizontalTarget = _calculateTargetMove(delta, horizontalControllers[index],
        horizontalControllers[index].offset, _horizontalScrollOffset, isMobile);

    // 3- Animate horizontalTarget
    _jumpTargetController(horizontalControllers[index], horizontalTarget);

    // 4- Check horizontalController and increaseIndex if it's exceed edges
    if (horizontalControllers[index].offset >=
        horizontalControllers[index].position.maxScrollExtent) {
      _index = _index + 1;
      return;
    }
    if (horizontalControllers[index].offset <=
        horizontalControllers[index].position.minScrollExtent) {
      _index = _index - 1;
      return;
    }
  }

  static double _calculateTargetScroll(PointerScrollEvent event, ScrollController controller,
      double targetScroll, double scrollOfset) {
    // Checking if scroll happened is up or down
    if (event.scrollDelta.dy > 0) {
      // Adding the extra offset to over scroll done by user
      targetScroll += (event.scrollDelta.dy + scrollOfset);
    } else {
      // Adding the extra offset to over scroll done by user
      // here we are subtracting the widget scroll offset because
      // [event.scrollDelta.dy] value is negative so to
      // increase overall offset we are subtracting because
      // negative - negative values get added
      targetScroll += (event.scrollDelta.dy - scrollOfset);
    }

    // Checking if scroll has reached to bottom of the screen
    if (targetScroll > controller.position.maxScrollExtent) {
      targetScroll = controller.position.maxScrollExtent;
    }

    // Checking if scroll has gone before the starting point
    // so resetting it back to 0
    if (targetScroll < 0) {
      targetScroll = 0;
    }
    return targetScroll;
  }

  ///Its mobile version of [_calculateTargetScroll]
  static double _calculateTargetMove(double delta, ScrollController controller, double targetScroll,
      double scrollOfset, bool isMobile) {
    if (isMobile) {
      targetScroll += (delta * -1.2);
    } else {
      targetScroll += (delta * 1.2);
    }

    // Checking if scroll has reached to bottom of the screen
    if (targetScroll > controller.position.maxScrollExtent) {
      targetScroll = controller.position.maxScrollExtent;
    }

    // Checking if scroll has gone before the starting point
    // so resetting it back to 0
    if (targetScroll < 0) {
      targetScroll = 0;
    }
    return targetScroll;
  }

  static Future<void> _animateTargetController(
      ScrollController controller, double targetScroll) async {
    await controller.animateTo(
      targetScroll,
      duration: const Duration(milliseconds: _animationDuration),
      curve: Curves.easeInOut,
    );
  }

  ///Mobile version of [_animateTargetController]
  static void _jumpTargetController(ScrollController controller, double targetScroll) async {
    controller.jumpTo(targetScroll);
  }
}
