import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.name, required this.price, required this.shotDescription, required this.asset});

  final String name;
  final double price;
  final String shotDescription;
  final bool  = false;
  final String asset;

  @override
  State<ProductCard> createState() => _ProductCardState(name: this.name, price: this.price, shotDescription: this.shotDescription, asset: this.asset);
}


class _ProductCardState extends State<ProductCard> {
  bool _expanded = false;

  final String name;
  final double price;
  final String shotDescription;
  final String asset;

  _ProductCardState({required this.name, required this.price, required this.shotDescription, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: _expanded ? 300.0 : 200.0,
        height:_expanded ? 400.0 : 200.0,
        color: _expanded ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary, 
        child: ListTile(
          title: ListView(
            children: [
              Image.asset(
                asset,
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight
              ),
              const SizedBox(),
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('R\$ ${price.toString()}', style: const TextStyle(fontSize: 14)),
              _expanded? Text(shotDescription) : const Text('')
            ],
          ),
          trailing: const Icon(Icons.favorite),
          onTap: () { setState(() { _expanded = !_expanded; });},
        ),
      )
    );
  }
}