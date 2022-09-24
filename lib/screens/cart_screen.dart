import 'package:flutter/material.dart';
import 'package:quantum_hackathon/widgets/cart_item.dart';
import 'package:quantum_hackathon/widgets/shopping_item_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              "Item Count : 1",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
           Expanded(
              // fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productscreen');
                      },
                      child: CartListItem(),
                    );
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Cart SubTotal : ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: null,
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        fixedSize:
                            MaterialStateProperty.all<Size>(const Size(150, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )))),
              )
          ],
        ),
      ),
    );
  }
}
