import 'package:flutter/material.dart';

class SFadeInAnimation extends StatelessWidget {
  final Widget child;
  final bool isTwoWayAnimation;
  final int durationInMs;
  final SAnimatePosition animate;

  const SFadeInAnimation({
    Key? key,
    required this.child,
    required this.isTwoWayAnimation,
    required this.durationInMs,
    required this.animate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: durationInMs),
      top: animate.topAfter,
      bottom: animate.bottomAfter,
      left: animate.leftAfter,
      right: animate.rightAfter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: durationInMs),
        opacity: isTwoWayAnimation ? 1.0 : 0.0,
        child: child,
      ),
    );
  }
}

class SAnimatePosition {
  final double? topBefore, topAfter;
  final double? bottomBefore, bottomAfter;
  final double? leftBefore, leftAfter;
  final double? rightBefore, rightAfter;

  SAnimatePosition({
    this.topBefore,
    this.topAfter,
    this.bottomBefore,
    this.bottomAfter,
    this.leftBefore,
    this.leftAfter,
    this.rightBefore,
    this.rightAfter,
  });
}
