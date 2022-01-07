import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:navigation_drawer_challenge/app/pages/home_page.dart';
import 'package:navigation_drawer_challenge/app/utils/utils.dart';
import 'package:navigation_drawer_challenge/app/widgets/animated_characters.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3047bd),
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(context, 'WRIST WATCH'),
            const SizedBox(height: 36),
            _buildListItem(context, 'LEATHER GOODS'),
            const SizedBox(height: 36),
            _buildListItem(context, 'PERFUME'),
            const SizedBox(height: 36),
            _buildListItem(context, 'JEWELLERY'),
            const SizedBox(height: 36),
            _buildListItem(context, 'SKINCARE'),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => _navigateToPage(context),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text) {
    final textStyle = GoogleFonts.playfairDisplay(
      fontSize: 28,
      color: Colors.white,
    );

    return GestureDetector(
      onTap: () => _navigateToPage(context),
      child: Row(
        children: [
          Text(
            '-',
            style: textStyle,
          ),
          const SizedBox(width: 20),
          AnimatedCharacters(
            text: text,
            textStyle: textStyle,
            duration: const Duration(milliseconds: 250),
          )
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context) {
    final firstLinearScale = linearScale(
      domain: const Range(0, 0.5),
      range: const Range(0, 1),
    );

    final secondLinearScale = linearScale(
      domain: const Range(0.5, 1),
      range: const Range(0, 1),
    );

    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (animation.value <= 0.5) {
            return Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..scale(firstLinearScale(animation.value), 0.002),
              child: child,
            );
          }

          return Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..scale(1.0, secondLinearScale(animation.value)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}
