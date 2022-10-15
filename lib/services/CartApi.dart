import 'package:quantum_hackathon/models/cartModel.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'  as http;

class CartApi{
  CartModel? cartModel;
  Future<CartModel?>  getdata() async{
    
    try{
      
       final url = Uri.parse(
        'http://ec2-13-126-121-46.ap-south-1.compute.amazonaws.com:9095/cart/viewItemsforUser?userId=1');

       var response = await http.get(url);
       var data = jsonDecode(response.body) ;
      //  var finaldata = data as List;
       
        cartModel = CartModel.fromJson(data);
       

    }catch(e){
      log(e.toString());
    }
    return cartModel;
  }
  
}