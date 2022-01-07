import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    final nameStyle = GoogleFonts.playfairDisplay(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
    final priceStyle = TextStyle(
      fontSize: 16,
      color: Colors.blue[900],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: -math.pi / 2, end: 0),
          duration: const Duration(milliseconds: 250),
          builder: (context, double value, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(value),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: _buildImage(name),
        ),
        const SizedBox(height: 8),
        Text(name, style: nameStyle),
        const SizedBox(height: 8),
        Text(price, style: priceStyle),
      ],
    );
  }

  Widget _buildImage(String name) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.all(32),
            child: FlutterLogo(size: 16),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: FloatingActionButton(
            elevation: 4,
            mini: true,
            backgroundColor: Colors.white,
            onPressed: () {},
            heroTag: name,
            child: const Icon(
              Icons.favorite_outline,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
