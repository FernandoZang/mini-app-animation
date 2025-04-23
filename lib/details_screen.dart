import 'package:flutter/material.dart';
import 'loading_indicator.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String description;
  final String asset;

  const DetailsScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.asset,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: _loaded
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.asset,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          : LoadingIndicator(onComplete: () {
              setState(() => _loaded = true);
            }),
    );
  }
}
