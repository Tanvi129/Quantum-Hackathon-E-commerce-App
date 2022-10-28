import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    _jumpHome();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset('assets/images/logo.jpeg')),
      
    );
  }

   _jumpHome() async{
    await Future.delayed(const Duration(seconds: 1),(){});
    Navigator.pushReplacementNamed(context, '/loginscreen');
   }
}