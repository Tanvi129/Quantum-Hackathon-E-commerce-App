import 'package:flutter/material.dart';
import 'package:quantum_hackathon/models/arguments.dart';
import 'package:quantum_hackathon/models/productModel.dart';
import 'package:quantum_hackathon/services/ProductListApi.dart';

import 'package:quantum_hackathon/widgets/shopping_item_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductListApi productListApi = ProductListApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14FFEC),
        centerTitle: true,
        title: const Text("Downtown",style: TextStyle(
          color: Color(0xff212121),
        ),),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xff323232),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Find Your Style",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                    color: Colors.white,),
                    iconSize: 35,
                    onPressed: () {
                      Navigator.pushNamed(context, '/cartscreen');
                    },
                  ),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   // fit: FlexFit.loose,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: 5,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Navigator.pushNamed(context, '/productscreen');
            //           },
            //           child: ShoppingListItem(),
            //         );
            //       }),
            // ),
            FutureBuilder(
              future: productListApi.getdata(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return const AlertDialog(
                    title: Text("Failed to load Data"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                        child: AlertDialog(
                      title: Text('${snapshot.error}'),
                    )
                        //  Text(
                        //   '${snapshot.error} occured',
                        //   style: const TextStyle(fontSize: 18),
                        // ),
                        );
                  } else if (snapshot.hasData) {
                    final List<ProductModel> product =
                        snapshot.data as List<ProductModel>;
                    return Expanded(
                      // fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: product.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/productscreen',
                                      arguments: Arguments(
                                          productname:
                                              product[index].productName,
                                          price: product[index].price,
                                          productId: product[index].productId));
                                },
                                child: ShoppingListItem(
                                  productname: product[index].productName,
                                  price: product[index].price,
                                  productId: product[index].productId,
                                ));
                          }),
                    );
                  }
                }
                return const Center(
                    child: AlertDialog(
                  alignment: Alignment.center,
                  title: Text(
                    "Failed to load Data",
                    textAlign: TextAlign.center,
                  ),
                ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
