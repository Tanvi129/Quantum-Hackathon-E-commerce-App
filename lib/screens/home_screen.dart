import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quantum_hackathon/widgets/shopping_item_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Downtown"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.pink[50],
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
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
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: ShoppingItemList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
