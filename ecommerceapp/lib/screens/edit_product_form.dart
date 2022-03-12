import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductForm extends StatefulWidget {
  final Product product;
  const EditProductForm({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late final TextEditingController title;
  late final TextEditingController price;
  late final TextEditingController des;
  late final TextEditingController imgUrl;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    title = TextEditingController(text: widget.product.title);
    price = TextEditingController(text: widget.product.price.toString());
    des = TextEditingController(text: widget.product.des);
    imgUrl = TextEditingController(text: widget.product.url);
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    price.dispose();
    des.dispose();
    imgUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Add New Product",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Please Enter Product Details",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "This field cannot be Empty";
                          }
                          return null;
                        },
                        controller: title,
                        decoration: const InputDecoration(
                            label: Text("Title"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "This field cannot be Empty";
                          }
                          return null;
                        },
                        controller: price,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            label: Text("Price"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "This field cannot be Empty";
                          }
                          return null;
                        },
                        controller: des,
                        maxLines: 6,
                        decoration: const InputDecoration(
                            label: Text("description"),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: imgUrl.text.isEmpty
                                ? null
                                : Image.network(
                                    imgUrl.text,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Expanded(
                              child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "This field cannot be Empty";
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              setState(() {});
                            },
                            controller: imgUrl,
                            decoration: const InputDecoration(
                                label: Text("Url"),
                                border: OutlineInputBorder()),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                Provider.of<Products>(context, listen: false)
                                    .editProduct(Product(
                                        des: des.text,
                                        id: widget.product.id,
                                        isFav: widget.product.isFav,
                                        price: double.parse(price.text),
                                        title: title.text,
                                        url: imgUrl.text));
                                Navigator.of(context).pop();
                              },
                              child: const Text("Submit")))
                    ],
                  ),
                ),
              ))),
    );
  }
}
