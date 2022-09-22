import 'package:flutter/material.dart';

class ShoppingItemList extends StatelessWidget {
  const ShoppingItemList({Key? key}) : super(key: key);

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
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          // crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                                "assets/images/dressplaceholder.jpg")),),
            const SizedBox(
              width: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              children: const [
                Text(
                  "Maxi Dress",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Text(
                  "\$ 100",
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
