import 'package:flutter/material.dart';

class FadeWidget extends StatefulWidget {
  Widget childWidget;
  FadeWidget({
    Key? key,
    required this.childWidget,
  }) : super(key: key);

  @override
  State<FadeWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FadeTransition(opacity: _animation, child: widget.childWidget));
  }
}
