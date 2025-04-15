import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionMenu extends StatelessWidget {
  SwipeDescriptionMenu({super.key});

  final List<Category> categories = [
    Category(
      title: "Tapas",
      items: [
        MenuItem(
            name: "Assiette de Tapas Variées sauce cocktail", price: "11,50€"),
        MenuItem(
            name: "Calamars fritti sauce tartare",
            price: "15,50€",
            description: "Servi avec du riz"),
        MenuItem(name: "Ardoise charcuterie", price: "11,50€"),
        MenuItem(name: "Ardoise fromages", price: "11,50€"),
        MenuItem(name: "Ardoise mixte", price: "11,50€"),
      ],
    ),
    Category(
      title: "Entrée",
      items: [
        MenuItem(name: "Salade César", price: "12,00€"),
        MenuItem(name: "Soupe du jour", price: "8,00€"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoDev(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categories
              .map((category) => _buildCategoryTile(context, category))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryTile(BuildContext context, Category category) {
    return ExpansionTile(
      title: Text(
        category.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      children:
          category.items.map((item) => _buildMenuItem(context, item)).toList(),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              Text(
                item.price,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          if (item.description != null) ...[
            SizedBox(height: 4),
            Text(
              item.description!,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ]
        ],
      ),
    );
  }
}

class Category {
  final String title;
  final List<MenuItem> items;
  Category({required this.title, required this.items});
}

class MenuItem {
  final String name;
  final String price;
  final String? description;
  MenuItem({required this.name, required this.price, this.description});
}
