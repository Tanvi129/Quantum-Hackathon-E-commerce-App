import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:quantum_hackathon/models/payment_response_model.dart';

class PaymentApi {
  Future<PaymentResponseModel?> makepayment({required String  cardType,required String customerName ,required int cvv , required int cardNumber, required String date, required double amount}) async {
    PaymentResponseModel? paymentResponseModel;
    
      final response = await http.post(
        Uri.parse('http://ec2-3-6-103-221.ap-south-1.compute.amazonaws.com:9095/cart/submit?userId=1'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          "CardType": cardType,
          "CustomerName": customerName,
          "cvv": cvv,
          "CardNumber": cardNumber,
          "Date": date,
          "Amount": amount
        }),
      );
      // var data = jsonDecode(response.body);
      // log(data.toString());
      // paymentResponseModel= PaymentResponseModel.fromJson(data);

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        // log("Hello");
      paymentResponseModel= PaymentResponseModel.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to connect to the server.');
      }
   
    return paymentResponseModel;
  }
}
