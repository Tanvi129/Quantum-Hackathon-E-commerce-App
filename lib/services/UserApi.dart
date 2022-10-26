import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:quantum_hackathon/models/userDetails.dart';
class UserApi{
  Future<UserDetails?> validateUser(String userName,String password) async{
   UserDetails? userDetails;
    try{
    final url = Uri.parse('http://ec2-3-6-103-221.ap-south-1.compute.amazonaws.com:9095/login/loginValidation?userName=$userName&&password=$password');
    var response = await http.get(url);
    var data = jsonDecode(response.body) ;
    switch(response.statusCode){
      case 500:
      throw "Wrong Credentials";
      
      
    }
    userDetails = UserDetails.fromJson(data);
    

    }catch(e){
      log(e.toString());
    }
    return userDetails;

  }
}