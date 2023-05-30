import 'package:flutter/material.dart';
import 'package:plantforyou/components/menubar.dart';

class Product {
  final String name;
  final String image;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> _cartItems = [
    Product(
      name: "Product 1",
      image: "assets/images/wepik-export-20230503085419 2.png",
      price: 9.99,
    ),
    Product(
      name: "Product 2",
      image: "assets/images/Philodendron moonlight.png",
      price: 19.99,
    ),
    // Add more products as needed
  ];

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    _cartItems[index].image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(_cartItems[index].name),
                  subtitle: Text(
                    '\$${(_cartItems[index].price * _cartItems[index].quantity).toStringAsFixed(2)}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_cartItems[index].quantity > 1) {
                              _cartItems[index].quantity--;
                            } else {
                              _cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text(_cartItems[index].quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _cartItems[index].quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 200),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total Price: \$${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Remove all items from the shopping cart
              setState(() {
                _cartItems.clear();
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green), // Set the background color
            ),
            child: Text('Checkout'),
          ),
          Container(
            width: 400,
            height: 300,
            child: Menubar(selectedIndex: 2),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShoppingCartPage(),
  ));
}
