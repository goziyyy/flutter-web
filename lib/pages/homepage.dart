import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/header.dart';
import '../widgets/navigation.dart';
import '../widgets/hero_search.dart';
import '../widgets/featured_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopBar(),
            Header(),
            CustomNavigationBar(),
            HeroSearch(),
            FeaturedProducts(),
          ],
        ),
      ),
    );
  }
}
