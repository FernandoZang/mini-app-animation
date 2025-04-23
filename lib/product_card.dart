import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.name, required this.price, required this.shotDescription});

  final String name;
  final double price;
  final String shotDescription;
  final bool  = false;

  @override
  State<ProductCard> createState() => _ProductCardState(name: this.name, price: this.price, shotDescription: this.shotDescription);
}


class _ProductCardState extends State<ProductCard> {
  bool _expanded = false;

  final String name;
  final double price;
  final String shotDescription;

  _ProductCardState({required this.name, required this.price, required this.shotDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: _expanded ? 200.0 : 100.0,
        height:_expanded ? 200.0 : 100.0,
        color: _expanded ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary, 
        child: ListTile(
          title: ListTile(
            title: Text(name, style: const TextStyle(fontSize: 16)),
            subtitle: Text(price.toString(), style: const TextStyle(fontSize: 14))
            ),
          subtitle: _expanded? Text(shotDescription) : const Text(''),
          trailing: const Icon(Icons.favorite),
          onTap: () { setState(() { _expanded = !_expanded; });},
        ),
      )
    );
  }
}