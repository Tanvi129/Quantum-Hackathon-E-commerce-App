import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'  as http;
import 'package:quantum_hackathon/models/productModel.dart';

class ProductListApi{
  List<ProductModel>? productList;

  Future<List<ProductModel>?>  getdata() async{
    
    try{
      
       final url = Uri.parse(
        'http://ec2-13-126-121-46.ap-south-1.compute.amazonaws.com:9095/product/viewProducts');

       var response = await http.get(url);
       var data = jsonDecode(response.body) ;
       var finaldata = data as List;
       
        productList = List.from(finaldata).map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
       

    }catch(e){
      log(e.toString());
    }
    return productList;
  }
}