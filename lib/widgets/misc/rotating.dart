import 'package:flutter/material.dart';

class Rotating extends StatefulWidget {
  final Widget child;
  final int duration;
  final bool clockwise;
  const Rotating({
    Key? key,
    required this.child,
    required this.duration,
    this.clockwise = false,
  }) : super(key: key);

  @override
  State<Rotating> createState() => _RotatingState();
}

class _RotatingState extends State<Rotating>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: widget.clockwise ? 1.0 : -1.0)
          .animate(_controller),
      child: widget.child,
    );
  }
}
