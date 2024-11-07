import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> products = [];
  List<dynamic> cart = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
    await http.get(Uri.parse('http://127.0.0.1:5000/products/'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Add product to the cart
  void addToCart(dynamic product) {
    setState(() {
      cart.add(product);
    });
  }

  // Remove product from the cart
  void removeFromCart(dynamic product) {
    setState(() {
      cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to the cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cart: cart,
                        onRemoveFromCart: removeFromCart,
                      ),
                    ),
                  );
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // Navigate to product detail screen and pass the product and cart state
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productId: product['id'],
                    onAddToCart: addToCart, // Pass the addToCart function
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'] ?? 'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['title'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text('\$${product['price']}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Handle favorite action
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



class ProductDetailScreen extends StatelessWidget {
  final int productId;
  final Function(dynamic) onAddToCart; // Add callback to add product to cart

  ProductDetailScreen({required this.productId, required this.onAddToCart});

  // Fetch product details from the API
  Future<Map<String, dynamic>> fetchProduct() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/products/$productId'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No product data available'));
          }

          // Extract product data from snapshot
          final product = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product['image'] != null
                    ? Image.network(product['image'])
                    : Placeholder(
                    fallbackHeight: 200, fallbackWidth: double.infinity),
                SizedBox(height: 20),
                Text(
                  product['title'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Category: ${product['category']}"),
                Text("Description: ${product['description']}"),
                Text("Price: \$${product['price']}"),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(
                      "${product['rating']['rate']} "
                          "(${product['rating']['count']} reviews)",
                    ),
                  ],
                ),
                Spacer(), // Pushes the button to the bottom
                ElevatedButton(
                  onPressed: () {
                    // Add product to cart
                    onAddToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product['title']} added to cart')),
                    );
                  },
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<dynamic> cart;
  final Function(dynamic) onRemoveFromCart;

  CartScreen({required this.cart, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.isEmpty
          ? Center(
        child: Text('Your cart is empty'),
      )
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                product['image'] ?? 'https://via.placeholder.com/150',
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['title']),
              subtitle: Text('\$${product['price']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Remove item from the cart
                  onRemoveFromCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product['title']} removed from cart'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


