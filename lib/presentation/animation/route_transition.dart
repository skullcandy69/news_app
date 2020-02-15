import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget child1;
  final Widget child2;
  final Duration duration;
  final TransitionType transitionType;
  final Curve curves;

  RouteTransition(
      {this.child1,
      this.child2,
      this.transitionType,
      this.curves = Curves.easeInOut,
      this.duration = const Duration(milliseconds: 400)})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child1,
          transitionDuration: duration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            switch (transitionType) {
              case TransitionType.Size:
                return sizeTransition(child1, animation);
              case TransitionType.Fade:
                return fadeTransition(child1, animation);
              case TransitionType.Rotation:
                return rotationTransition(child1, child2, animation, curves);
              case TransitionType.Scale:
                return scaleTransition(child1, child2, animation);
              case TransitionType.Slide:
                return slideEntryTransition(child1, animation);
              default:
                return child1;
            }
          },
        );

  static Widget scaleTransition(
      Widget pushPage, Widget popPage, Animation animation) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
      child: pushPage,
    );
  }

  static Widget sizeTransition(Widget child, Animation animation) {
    return Align(
      child: SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }

  static Widget rotationTransition(
      Widget pushPage, Widget popPage, Animation animation, Curve curve) {
    return Stack(
      children: <Widget>[
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: -1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: curve,
            ),
          ),
          child: popPage,
        ),
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: curve,
            ),
          ),
          child: pushPage,
        )
      ],
    );
  }

  static Widget slideEntryTransition(Widget child, Animation animation) {
    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget slideEntryExitTransition(
      Widget pushPage, Widget popPage, Animation animation) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: const Offset(1.0, 0.0),
          ).animate(animation),
          child: popPage,
        ),
        SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: pushPage,
        )
      ],
    );
  }

  static Widget fadeTransition(Widget child, Animation animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Widget scaleRotationTransition(Widget child, Animation animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
        ),
        child: child,
      ),
    );
  }
}

enum TransitionType { Slide, Fade, Scale, Rotation, Size }
