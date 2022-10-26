import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/cartModel.dart';
import 'package:quantum_hackathon/screens/cart_screen.dart';
import 'package:quantum_hackathon/services/CartApi.dart';

class CartScreenLogic extends StatefulWidget {
  const CartScreenLogic({Key? key}) : super(key: key);

  @override
  State<CartScreenLogic> createState() => _CartScreenLogicState();
}

class _CartScreenLogicState extends State<CartScreenLogic> {
  CartApi cartApi = CartApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cartApi.getdata(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Container(
              color: Colors.white,
              constraints: const BoxConstraints.expand(),
              child: const AlertDialog(
                title: Text("Failed to load Data"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              constraints: const BoxConstraints.expand(),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                constraints: const BoxConstraints.expand(),
                color: Colors.white,
                child: Center(
                    child: AlertDialog(
                  title: Text('${snapshot.error}'),
                )),
              );
            } else if (snapshot.hasData) {
              CartModel cartModel = snapshot.data as CartModel;
              return CartScreen(cartModel: cartModel,);
            }
          }
          log("Failed");
          return Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(),
            child: const Center(
                child: AlertDialog(
              alignment: Alignment.center,
              title: Text(
                "Your Cart is Empty!!!",
                textAlign: TextAlign.center,
              ),
            )),
          );
        }));
  }
}
