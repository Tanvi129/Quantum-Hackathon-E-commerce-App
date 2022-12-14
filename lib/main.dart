import 'package:flutter/material.dart';
import 'package:quantum_hackathon/cartscreenLogic.dart';
import 'package:quantum_hackathon/screens/cart_screen.dart';
import 'package:quantum_hackathon/screens/home_screen.dart';
import 'package:quantum_hackathon/screens/login_screen.dart';
import 'package:quantum_hackathon/screens/payment_screen.dart';
import 'package:quantum_hackathon/screens/product_screen.dart';
import 'package:quantum_hackathon/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        appBarTheme: const AppBarTheme( // <-- SEE HERE
      iconTheme: IconThemeData(color: Colors.black),
    ),
      ),
      
      routes: {
        '/': (context) =>  const SplashScreen(),
        '/loginscreen':(context) => LoginScreen(),
        '/homescreen':(context) => HomeScreen(),
        '/cartscreen':(context) => CartScreenLogic(),
        '/productscreen':(context) => ProductScreen(),
        '/paymentscreen':(context) => PaymentScreen(),
          '/cartscreenlogic':(context) => CartScreenLogic(),

      },
    );
  }
}

