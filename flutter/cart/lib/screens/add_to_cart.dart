import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "package:cart/models/product.dart";

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(context) {
    //

    String? productTitle;
    int? quantity;
    Category? selectedCategory;

    final formKey = GlobalKey<FormState>();

    void onSave() async {
      if (!formKey.currentState!.validate()) return;

      formKey.currentState!.save();

      var response = await http.post(
        Uri.https("cart-afd43-default-rtdb.firebaseio.com", "cart.json"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'title': productTitle,
          'quantity': quantity,
          'category': selectedCategory!.name,
        }),
      );

      var resData = json.decode(response.body);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(
        //
        Product(
          productTitle!,
          quantity!,
          selectedCategory!,
          id: resData['name'],
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //

              // Title Input Field
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  //
                  label: Text("Product Title"),
                ),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Invalid Product Title";
                  }

                  return null;
                },

                onSaved: (value) {
                  productTitle = value;
                },
              ),

              // Quantity & Category
              Row(
                children: [
                  // Qantity field
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //
                        label: Text("Quantity"),
                      ),

                      validator: (value) {
                        var num = int.tryParse(value!);
                        if (num == null || num < 0) {
                          return "Invalid Quantity";
                        }

                        return null;
                      },

                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                  ),

                  //
                  SizedBox(width: 8),

                  // Category selector
                  Expanded(
                    child: DropdownButtonFormField(
                      items: Category.values
                          .map(
                            (cat) => DropdownMenuItem<Category>(
                              value: cat,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: cat.color,
                                  ),
                                  SizedBox(width: 8),
                                  Text(cat.name),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null) {
                          return "Select Category";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        selectedCategory = value!;
                      },
                    ),
                  ),
                ],
              ),

              //
              SizedBox(height: 48),

              // Buttons
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    //
                    onPressed: onSave,
                    child: Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
