class PaymentResponseModel{
  final String? message;
  final String? authcode;
  PaymentResponseModel({ this.message, this.authcode});

  factory PaymentResponseModel.fromJson(var data){
    final message = data["Message"];
    final authcode = data["Authentication Code"];
    return PaymentResponseModel(message: message, authcode: authcode);

  }

}