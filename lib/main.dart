import 'package:flutter/material.dart';
import 'package:rozarpay/pages/fetch_all_payments.dart';
import 'package:rozarpay/pages/fetch_by_id.dart';
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
        MyRoutes.Refund:(context)=>const Refund(keyID: "rzp_test_oXV9AaMUvzydYV", keySecret: "5yXOXDpaj0IvxnGSx6zwwHM5",amount: 2000,),
        MyRoutes.FetchAll:(context)=>const FetchAllPayment(keyID: "rzp_test_oXV9AaMUvzydYV", keySecret: "5yXOXDpaj0IvxnGSx6zwwHM5"),
        MyRoutes.AllRefunds:(context)=>const AllRefunds(),
        MyRoutes.CURDPage:(context)=>const FetchByID(),


      },
    );
  }
}
