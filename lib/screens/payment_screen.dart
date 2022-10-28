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
      backgroundColor: const Color(0xff323232),
      appBar: AppBar(
        backgroundColor: const Color(0xff14FFEC),
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color(0xff212121),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // constraints: const BoxConstraints.expand(),
          color: const Color(0xff323232),
          padding: const EdgeInsets.all(16),
          // color: Colors.pink[50],
          child: Column(
            children: [
              Image.asset('assets/images/payimage.png'),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Row(
                children: [
                  const Text(
                    "Cart SubTotal : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ " + cartSubtotal,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              SizedBox(height: 20,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Card Type",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                              ),
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
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                              ),
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
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                              ),
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
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                              ),
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
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                focusColor: Color(0xff14FFEC),
                               labelStyle:
                  TextStyle(color: Colors.white, fontSize: 16.0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff14FFEC)),
                                ),
                              ),
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
                height: 75,
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
                        builder: (_) => CupertinoAlertDialog(
                          title: const Text("Payment Status"),
                          content: Text(paymentResponseModel?.message ??
                              "Sorry Unable to Process Transaction"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.popUntil(context,
                                      ModalRoute.withName('/homescreen'));
                                },
                                style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff14FFEC),),),
                                child: const Text("OK"))
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xff14FFEC)),
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
