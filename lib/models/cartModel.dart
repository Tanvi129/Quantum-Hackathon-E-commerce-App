import 'package:quantum_hackathon/models/productModel.dart';

class CartModel {
  CartModel({this.productList, this.cartTotal, this.cartId, this.itemCount});
  final List<ProductModel>? productList;
  final double? cartTotal;
  final int? cartId;
  final int? itemCount;
  factory CartModel.fromJson(var data) {
    var finaldata = data["item"] as List;
    final productList = List.from(finaldata)
        .map<ProductModel>((item) => ProductModel.fromJsonCart(item))
        .toList();
    final cartTotal = data["cartTotal"];
    final cartId = data["cartId"];
    int count = 0;
    for (int i = 0; i < productList.length; i++) {
      int? e = productList[i].quantity;
      count++;
    }
    final itemCount=count;

    return CartModel(
        productList: productList, cartTotal: cartTotal, cartId: cartId, itemCount: itemCount);
  }
}
