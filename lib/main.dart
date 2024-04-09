import 'package:flutter/material.dart';
import 'package:rozarpay/pages/fetch_all_payments.dart';
import 'package:rozarpay/pages/fetch_by_id.dart';
import 'package:rozarpay/pages/getAllRefunds.dart';
import 'package:rozarpay/refund.dart';
import 'payment_page.dart';
import 'package:rozarpay/utils/routes.dart';
import 'secrets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Razorpay implement app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymentPage(
          amount: 20000,
          keyID: keyId,
          keySecret: keySecret,
          productImage: ''),
      routes: {
        MyRoutes.Refund:(context)=>const Refund(keyID: keyId, keySecret: keySecret,amount: 2000,),
        MyRoutes.FetchAll:(context)=>const FetchAllPayment(keyID: keyId, keySecret: keySecret),
        MyRoutes.AllRefunds:(context)=>const AllRefunds(keyID: keyId, keySecret: keySecret),
        MyRoutes.CURDPage:(context)=>const FetchByID(),
      },
    );
  }
}
