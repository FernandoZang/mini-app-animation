import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'dart:math';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.shotDescription,
    required this.asset,
    required this.altAsset,
  }) : super(key: key);

  final String name;
  final double price;
  final String shotDescription;
  final String asset;
  final String altAsset;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  bool _isFavorited = false;
  bool _showAltImage = false;

  late final AnimationController _favCtrl;
  late final Animation<double> _favAnim;

  @override
  void initState() {
    super.initState();
    _favCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _favCtrl.reverse();
        }
      });
    _favAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _favCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _favCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(_expanded ? 16 : 8),
        color: _expanded
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedCrossFade(
                    firstChild: Image.asset(
                      widget.asset,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    secondChild: Image.asset(
                      widget.altAsset,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    crossFadeState: _showAltImage
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 500),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'R\$ ${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => _isFavorited = !_isFavorited);
                      _favCtrl.forward(from: 0);
                    },
                    child: ScaleTransition(
                      scale: _favAnim,
                      child: Icon(
                        _isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _isFavorited ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (_expanded) ...[
              const SizedBox(height: 12),
              Text(widget.shotDescription),
              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        setState(() => _showAltImage = !_showAltImage),
                    child:
                        Text(_showAltImage ? 'Ver Antes' : 'Ver Depois'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          name: widget.name,
                          description: widget.shotDescription,
                          asset: widget.asset,
                        ),
                      ),
                    ),
                    child: const Text('Detalhes'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}