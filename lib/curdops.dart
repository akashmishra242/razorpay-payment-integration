import 'package:flutter/material.dart';
import 'package:rozarpay/pages/fetch_all_payments.dart';
import 'package:rozarpay/pages/fetch_by_id.dart';
import 'package:rozarpay/pages/getAllRefunds.dart';
import 'package:rozarpay/utils/routes.dart';

class CURD extends StatelessWidget {
  const CURD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CURD',
      theme: ThemeData(colorScheme:const  ColorScheme.light()),
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('CURD Operation Razorpay'),
        ),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const FetchByID();
                      }));
                    },
                    child: const Text("Fetch Payment By ID")),
                    const SizedBox(height: 10,),
               ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const FetchAllPayment(keyID: "rzp_test_oXV9AaMUvzydYV", keySecret: "5yXOXDpaj0IvxnGSx6zwwHM5");
                      }));
                    },
                    child: const Text("Fetch all Payments")),
                    const SizedBox(height: 10,),
                     ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AllRefunds();
                      }));
                    },
                    child: const Text("Fetch all Refunds")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
