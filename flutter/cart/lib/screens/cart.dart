import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "package:cart/models/product.dart";
import "package:cart/screens/add_to_cart.dart";

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //

  List<Product> productList = [];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  void _loadData() async {
    var response = await http.get(
      Uri.https("cart-afd43-default-rtdb.firebaseio.com", "cart.json"),
    );

    final Map<String, dynamic> resData = json.decode(response.body);

    setState(() {
      productList = Product.fromData(resData);
    });
  }

  // ===============================================
  void _addToCartPage(BuildContext context) async {
    //

    final newProduct = await Navigator.of(context).push(
      MaterialPageRoute(
        //
        builder: (ctx) => AddToCart(),
      ),
    );

    setState(() {
      productList.add(newProduct);
    });
  }
  // ===============================================

  void _removeFromCart(Product product) async {
    final int index = productList.indexOf(product);

    setState(() {
      productList.remove(product);
    });

    try {
      await http.delete(
        Uri.https(
          "cart-afd43-default-rtdb.firebaseio.com",
          "cart/${product.id}.json",
        ),
      );
    } catch (e) {
      print(e);
      setState(() {
        productList.insert(index, product);
      });
    }
  }

  // ===============================================

  @override
  Widget build(context) {
    //

    return Scaffold(
      //
      appBar: AppBar(
        title: const Text("Grocery App"),
        actions: [
          IconButton(
            //
            icon: Icon(Icons.add),
            onPressed: () {
              _addToCartPage(context);
            },
          ),
          SizedBox(width: 8),
        ],
      ),

      //
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          //

          //
          return Dismissible(
            key: ValueKey(productList[index].id),
            onDismissed: (direction) {
              _removeFromCart(productList[index]);
            },
            child: ListTile(
              title: Text(productList[index].title),
              leading: Container(
                width: 16,
                height: 16,
                color: productList[index].category.color,
              ),
              trailing: Text(productList[index].quantity.toString()),
            ),
          );

          //
        },
      ),
    );
  }
}
