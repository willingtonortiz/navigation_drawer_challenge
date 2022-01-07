import 'package:flutter/material.dart';

class DelayedWidget extends StatelessWidget {
  const DelayedWidget({
    Key? key,
    required this.duration,
    required this.placeholder,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final Widget child;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double?>(
      future: Future.delayed(duration),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return placeholder;
        }

        return child;
      },
    );
  }
}
