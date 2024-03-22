// allows for animating text widget
import 'package:flutter/material.dart';

class TextTweenAnimation extends StatelessWidget {
  const TextTweenAnimation({super.key, required this.text});
  final Text text;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child:
              Padding(padding: EdgeInsets.only(top: val * 20), child: child),
        );
      },
      child: text,
    );
  }
}

// Icon animation
class IconAnimation extends StatefulWidget {
  const IconAnimation(
      {super.key,
      required this.iconData,
      required this.startColor,
      required this.endColor,
      this.selectedIconData,
      this.onPressed});
  final IconData iconData;
  final Color startColor;
  final IconData? selectedIconData;
  final Color endColor;
  final Function()? onPressed;
  @override
  State<IconAnimation> createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;
  bool isfav = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween(begin: 24.0, end: 34.0), weight: 10),
      TweenSequenceItem<double>(
          tween: Tween(begin: 34.0, end: 24.0), weight: 10)
    ]).animate(_controller);

    _colorAnimation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isfav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return IconButton(
          iconSize: _sizeAnimation.value,
          icon: Icon(widget.iconData),
          selectedIcon: Icon(widget.selectedIconData),
          color: _colorAnimation.value,
          onPressed: () {
            widget.onPressed;
            isfav ? _controller.reverse() : _controller.forward();
          },
        );
      },
      animation: _controller,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
