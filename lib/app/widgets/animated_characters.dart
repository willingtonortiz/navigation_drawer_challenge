import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AnimatedCharacters extends StatelessWidget {
  AnimatedCharacters({
    Key? key,
    required this.text,
    this.duration,
    this.textStyle,
  }) : super(key: key) {
    characters = text.split('');
  }

  final String text;
  final TextStyle? textStyle;
  final Duration? duration;
  late final List<String> characters;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Row(
        children: characters.mapIndexed((index, character) {
          return FutureBuilder<double?>(
            future: Future.delayed(Duration(milliseconds: index * 50)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SizedBox();
              }
              return TweenAnimationBuilder(
                duration: duration ?? const Duration(milliseconds: 100),
                tween: Tween<double>(begin: 30, end: 0),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: Text(
                  character,
                  style: textStyle,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
