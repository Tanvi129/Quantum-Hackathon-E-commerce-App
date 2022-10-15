class ProductModel{
  ProductModel({this.price,this.productName,this.productId,this.quantity});
  final String? productName;
  final double? price;
  final int? productId;
  final int? quantity;
  
  factory ProductModel.fromJson(Map<String, dynamic> data) {
    final productName = data["productName"];
    final price=data["price"];
    final productId=data["productId"];
    

    return ProductModel(price: price, productName: productName , productId: productId);

  }

  factory ProductModel.fromJsonCart(var data) {
    final productName = data["product"]["productName"];
    final price=data["product"]["price"];
    final productId=data["product"]["productId"];
    final quantity=data["quantity"];
    

    return ProductModel(price: price, productName: productName , productId: productId, quantity: quantity);

  }

}