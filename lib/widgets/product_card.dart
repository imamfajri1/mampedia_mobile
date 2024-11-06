import 'package:flutter/material.dart';
import 'package:mampedia_mobile/screens/productentry_form.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (item.name == "Tambah Product") {
      backgroundColor = Colors.lightGreen[700];
    } else if (item.name == "Lihat Daftar Produk") {
      backgroundColor = Colors.indigo[900];
    } else if (item.name == "Logout") {
      backgroundColor = Colors.red[900];
    } else {
      backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));
          if (item.name == "Tambah Product") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductEntryFormPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
