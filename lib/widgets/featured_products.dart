import 'package:flutter/material.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: 'HP 62 Black Ink Cartridge',
        code: '(i-PC2P04AE)',
        price: 9.49,
        image: 'hp-black-62.jpg',
      ),
      Product(
        name: 'Canon MF-3110 Toner',
        code: '(C2P04AE)',
        price: 36.45,
        image: 'canon-mf3110-toner.jpg',
      ),
      Product(
        name: 'HP 62 Black Ink Cartridge',
        code: '(i-PC2P04AE)',
        price: 5.99,
        originalPrice: 9.49,
        image: 'hp-black-62.jpg',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const Text(
                'FEATURED PRODUCTS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: products
                        .map((product) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: _ProductCard(product: product),
                              ),
                            ))
                        .toList(),
                  ),
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _NavigationButton(
                          icon: Icons.chevron_left,
                          onPressed: () {},
                        ),
                        _NavigationButton(
                          icon: Icons.chevron_right,
                          onPressed: () {},
                          isRight: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String code;
  final double price;
  final double? originalPrice;
  final String image;

  Product({
    required this.name,
    required this.code,
    required this.price,
    this.originalPrice,
    required this.image,
  });
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset(
            product.image,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 12),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            product.code,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (product.originalPrice != null) ...[
                Text(
                  '\$${product.originalPrice}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      product.originalPrice != null ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: const Text('ADD TO CART'),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isRight;

  const _NavigationButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.isRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isRight ? Colors.orange : Colors.grey[200],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isRight ? Colors.white : Colors.grey[600],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
