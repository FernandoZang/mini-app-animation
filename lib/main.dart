import 'package:flutter/material.dart';
import 'package:mini_app_animations/model/Product.dart';
import 'package:mini_app_animations/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini App - Animações',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mini App - Animações'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> produtos = [];

  @override
  void initState() {
    super.initState();
    populateDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final product = produtos[index];
          return ProductCard(
            name: product.name,
            price: product.price,
            shotDescription: product.shotDescription,
            asset: 'assets/images/camiseta_vermelha.webp',
            altAsset: 'assets/images/camiseta_preta.webp',
          );
        },
      ),
    );
  }

  void populateDB() {
    const sd =
        'Camisa 100% algodão, de corte clássico, cor vermelha vibrante. '
        'Ideal para uso casual em qualquer estação, confortável e durável.';
    produtos.add(Product('id1', 'Camisa Vermelha', 30.22, sd));
    produtos.add(Product('id2', 'Camisa Azul', 25.50, sd));
    produtos.add(Product('id3', 'Camisa Preta', 28.75, sd));
    produtos.add(Product('id4', 'Camisa Branca', 24.00, sd));
    produtos.add(Product('id5', 'Camisa Verde', 27.30, sd));
    produtos.add(Product('id6', 'Camisa Amarela', 29.99, sd));
    produtos.add(Product('id7', 'Camisa Cinza', 26.80, sd));
  }
}
