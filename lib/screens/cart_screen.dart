import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/arguments.dart';
import 'package:quantum_hackathon/models/cartModel.dart';
import 'package:quantum_hackathon/widgets/cart_item.dart';
import 'package:quantum_hackathon/widgets/shopping_item_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 
  @override
  Widget build(BuildContext context) {
    String cartSubtotal = widget.cartModel.cartTotal.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Item Count : " + widget.cartModel.itemCount.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              // fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.cartModel.productList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, '/productscreen',
                    //         arguments: Arguments(
                    //             productname: widget
                    //                 .cartModel.productList![index].productName,
                    //             price:
                    //                 widget.cartModel.productList![index].price,
                    //             productId: widget
                    //                 .cartModel.productList![index].productId));
                    //   },
                    //   child: CartListItem(
                    //     productModel: widget.cartModel.productList![index],
                    //   ),
                    // );
                    return CartListItem(
                        productModel: widget.cartModel.productList![index],
                      );
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  "Cart SubTotal : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cartSubtotal,
                  style: const TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/paymentscreen', arguments: {"cartSubtotal":cartSubtotal});
                  },
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
