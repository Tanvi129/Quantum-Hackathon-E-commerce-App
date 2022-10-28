import 'package:flutter/material.dart';
import 'package:quantum_hackathon/cartscreenLogic.dart';
import 'package:quantum_hackathon/models/arguments.dart';
import 'package:quantum_hackathon/models/productModel.dart';
import 'package:quantum_hackathon/services/CartApi.dart';

class CartListItem extends StatefulWidget {
  CartListItem({Key? key, this.productModel}) : super(key: key);
  final ProductModel? productModel;

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  CartApi cartApi = CartApi();

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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/productscreen',
                    arguments: Arguments(
                        productname: widget.productModel!.productName,
                        price: widget.productModel!.price,
                        productId: widget.productModel!.productId));
              },
              child: Container(
                height: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                        imagedisplay(),

                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  widget.productModel?.productName ?? "Unable to load",
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
                  "\$ " + widget.productModel!.price.toString(),
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
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                            cartApi.removefromcart(widget.productModel!.productId);
                          });
                          Navigator.pushReplacementNamed(
                              context, '/cartscreenlogic');
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.pink),
                    ),
                    Text(
                      widget.productModel!.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            cartApi.addtocart(widget.productModel!.productId);
                          });
                          Navigator.pushReplacementNamed(
                              context, '/cartscreenlogic');
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
    );
  }

  String imagedisplay(){
    if(widget.productModel!.productId==1){
      return "assets/images/laptop.jpeg";
    }
    if(widget.productModel!.productId==2){
      return "assets/images/phone.jpeg";
    }if(widget.productModel!.productId==3){
      return "assets/images/headphone.jpeg";
    }if(widget.productModel!.productId==4){
      return "assets/images/camera.jpeg";
    }
    return "assets/images/dressplaceholder.jpg";
  }
}
