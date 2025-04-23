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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  var produtos = [];

  @override
  Widget build(BuildContext context) {
    populateDB();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if(index<produtos.length) {
            Product product = produtos[index] as Product;
            return ProductCard(name: product.name, price: product.price, shotDescription: product.shotDescription);
          }
        }
      )
    );


  }

    void populateDB() {
    produtos = [];
    produtos.add(Product('id1', 'Produto 1', 30.22, 'short description'));
    produtos.add(Product('id2', 'Produto 2', 20.22, 'short description'));
    produtos.add(Product('id3', 'Produto 3', 30.22, 'short description'));
    produtos.add(Product('id4', 'Produto 4', 21.22, 'short description'));
    produtos.add(Product('id5', 'Produto 5', 30.22, 'short description'));
    produtos.add(Product('id6', 'Produto 6', 50.22, 'short description'));
    produtos.add(Product('id7', 'Produto 7', 30.22, 'short description'));
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);
    produtos_enlarged.add(false);

  }
}
