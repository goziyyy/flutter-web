import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          // Wrap Row dengan SingleChildScrollView untuk mencegah overflow
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              // Tambahkan IntrinsicWidth
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ubah ke MainAxisSize.min
                children: [
                  Container(
                    color: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28, // Kurangi padding horizontal
                      vertical: 16,
                    ),
                    child: const Text(
                      'HOME',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  _NavItem(
                    title: 'INK CARTRIDGES',
                    horizontalPadding: 28, // Kurangi padding horizontal
                  ),
                  _NavItem(
                    title: 'TONER CARTRIDGES',
                    horizontalPadding: 28, // Kurangi padding horizontal
                  ),
                  _NavItem(
                    title: 'CONTACT US',
                    horizontalPadding: 28, // Kurangi padding horizontal
                  ),
                  _NavItem(
                    title: 'LOGIN / REGISTER',
                    horizontalPadding: 28, // Kurangi padding horizontal
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final double
      horizontalPadding; // Tambahkan parameter untuk padding horizontal

  const _NavItem({
    Key? key,
    required this.title,
    this.horizontalPadding = 32, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 16,
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
