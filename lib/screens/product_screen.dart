import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/arguments.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override

  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Downtown"),
      ),
      body: Container(
        color: Colors.pink[50],
        constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                args.productname?? "Unable to Load",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 5,
                  ),
                  color: Colors.black,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/images/dressplaceholder.jpg")),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price: ",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$ "+  args.price.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Some very nice description about the Prouduct. ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: null,
                    child: const Text(
                      "Add To Cart",
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
      ),
    );
  }
}
