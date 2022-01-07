import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/app/models/product.dart';
import 'package:navigation_drawer_challenge/app/pages/app_drawer_page.dart';
import 'package:navigation_drawer_challenge/app/widgets/delayed_widget.dart';
import 'package:navigation_drawer_challenge/app/widgets/product_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _openAppDrawer(context),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'ALL PRODUCTS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
      centerTitle: true,
      actions: [
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          backgroundColor: const Color(0xff3047be),
          child: const Icon(Icons.search),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          childAspectRatio: 0.48,
          children: productList
              .mapIndexed(
                (index, product) => DelayedWidget(
                  duration: Duration(milliseconds: 500 + index * 50),
                  placeholder: const SizedBox(),
                  child: ProductGridItem(
                    name: product.name,
                    price: product.price,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _openAppDrawer(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AppDrawer(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final width = MediaQuery.of(context).size.width;

          final tween = Tween<double>(begin: -width, end: 0).animate(animation);

          return Transform.translate(
            offset: Offset(tween.value, 0),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
      ),
    );
  }
}
