
import 'package:flutter/material.dart';
import 'package:mampedia_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.network(product.fields.imageUrl),
            const SizedBox(height: 10),
            Text("Price: \$${product.fields.price}"),
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 10),
            Text("Quantity: ${product.fields.quantity}"),
            const SizedBox(height: 10),
            Text("Time: ${product.fields.time}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to List'),
            ),
          ],
        ),
      ),
    );
  }
}