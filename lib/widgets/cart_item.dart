import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/productModel.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key? key, this.productModel}) : super(key: key);
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Wrap(direction: Axis.horizontal, alignment: WrapAlignment.start,
          // crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              height: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/dressplaceholder.jpg",
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  productModel?.productName ??"Unable to load",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Price: "  ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ " + productModel!.price.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 

                  children: [
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Icon(Icons.remove,
                      color: Colors.pink),
                    ),
                    Text(
                      productModel!.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Icon(Icons.add,
                      color: Colors.pink,),
                    ),
                  ],
                ),
              ],
            ),
          ]),
    );
  }
}
