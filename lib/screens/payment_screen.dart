import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/payment_response_model.dart';
import 'package:quantum_hackathon/services/PaymentApi.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final cardTypeController = TextEditingController();
  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryDateController = TextEditingController();
  PaymentApi paymentApi = PaymentApi();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String cartSubtotal = arguments["cartSubtotal"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          // color: Colors.pink[50],
          child: Column(
            children: [
              Image.asset('assets/images/paylogo.png'),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                // color: Colors.pink,
                thickness: 2,
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
                    "\$ " + cartSubtotal,
                    style: const TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                // color: Colors.pink,
                thickness: 2,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Card Type",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: cardTypeController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Card Number",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 16) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "CVV",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: cvvController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Text(
                            "Expiry Date",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: expiryDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              // const Divider(
              //   thickness: 2,
              // ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      PaymentResponseModel? paymentResponseModel =
                          await paymentApi.makepayment(
                              cardType: cardTypeController.text,
                              customerName: nameController.text,
                              cvv: int.parse(cvvController.text),
                              cardNumber: int.parse(cardNumberController.text),
                              date: expiryDateController.text,
                              amount: double.parse(cartSubtotal));
                              // log(int.parse(cvvController.text).toString());
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text(paymentResponseModel?.message ?? "Unable to Process Transaction")),
                      // );
                      showCupertinoDialog(
                        context: context,


                        builder:(_)=> CupertinoAlertDialog(
                          title: const Text("Payment Status"),
                          content: Text(paymentResponseModel?.message ?? "Sorry Unable to Process Transaction"),
                          actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.popUntil(context, ModalRoute.withName('/homescreen'));
                            }, child: const Text("OK"))
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Pay Now",
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
                      ))))
            ],
          ),
        ),
      ),
    );
  }
}
