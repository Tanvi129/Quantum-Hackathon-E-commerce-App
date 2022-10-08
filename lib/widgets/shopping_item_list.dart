import 'package:flutter/material.dart';

class ShoppingListItem
 extends StatelessWidget {
  const ShoppingListItem
  ({Key? key, this.productname, this.price}) : super(key: key);

  final String? productname;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Wrap(
        direction: Axis.horizontal, alignment: WrapAlignment.start,
          // crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/dressplaceholder.jpg")),
            ),
            const SizedBox(
              width: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              children:  [
                Text(
                  productname?? "Unable to Load",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Price: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ " + price.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
