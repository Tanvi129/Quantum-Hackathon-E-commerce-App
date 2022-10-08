class ProductModel{
  ProductModel({this.price,this.productName,this.productId});
  final String? productName;
  final double? price;
  final int? productId;
  
  factory ProductModel.fromJson(Map<String, dynamic> data) {
    final productName = data["productName"];
    final price=data["price"];
    final productId=data["productId"];
    

    return ProductModel(price: price, productName: productName , productId: productId);

  }

}