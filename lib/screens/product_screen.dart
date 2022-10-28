import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/arguments.dart';
import 'package:quantum_hackathon/services/CartApi.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  CartApi cartApi = CartApi();
  @override
  Widget build(BuildContext context) {
    final Arguments args =
        ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14FFEC),
        centerTitle: true,
        title: const Text("Downtown",style: TextStyle(
          color: Color(0xff212121),
        ),),
      ),
      body: Container(
        color: const Color(0xff323232),
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                args.productname ?? "Unable to Load",
                
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
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
                    color: Color(0xffb0b5b8),
                    width: 5,
                  ),
                  
                ),
                child: ClipRRect(
                    // borderRadius: BorderRadius.circular(15),
                    
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
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$ " + args.price.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Some very nice description about the Product. ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      cartApi.addtocart(args.productId);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:  Text("Item Added to the Cart"),
                      ));
                    },
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff14FFEC),),
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(150, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
