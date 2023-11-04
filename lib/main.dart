import 'package:flutter/material.dart';
import 'package:rozarpay/pages/fetch_all_payments.dart';
import 'package:rozarpay/pages/getAllRefunds.dart';
import 'package:rozarpay/refund.dart';
import 'payment_page.dart';
import 'package:rozarpay/utils/routes.dart';

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
          keyID: 'rzp_test_oXV9AaMUvzydYV',
          keySecret: '5yXOXDpaj0IvxnGSx6zwwHM5',
          productImage: ''),
      routes: {
        MyRoutes.Refund:(context)=>const Refund(),
        MyRoutes.FetchAll:(context)=>const FetchAllPayment(),
        MyRoutes.AllRefunds:(context)=>const AllRefunds(),

      },
    );
  }
}
