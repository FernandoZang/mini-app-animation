import 'package:flutter/material.dart';
import 'dart:math';

class LoadingIndicator extends StatefulWidget {
  final VoidCallback onComplete;
  const LoadingIndicator({required this.onComplete, super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  int _turns = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _turns++;
          if (_turns < 3) {
            _ctrl.forward(from: 0);
          } else {
            _ctrl.stop();
            widget.onComplete();
          }
        }
      });
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) => Transform.rotate(
          angle: _ctrl.value * 2 * pi,
          child: const Icon(Icons.sync, size: 48),
        ),
      ),
    );
  }
}
