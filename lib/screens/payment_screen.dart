import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: Container(
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
              children: const [
                Text(
                  "Cart SubTotal : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ 500",
                  style: TextStyle(
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
                          child: TextFormField(),
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
                          child: TextFormField(),
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
                          child: TextFormField(),
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
                          child: TextFormField(),
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
                          child: TextFormField(),
                        )
                      ],
                    )
                  ],
                )),
            // const Divider(
            //   thickness: 2,
            // ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: null, child: const Text(
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
    );
  }
}
