import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String keyID = 'rzp_test_oXV9AaMUvzydYV';
const String keySecret = '5yXOXDpaj0IvxnGSx6zwwHM5';
Map<String, dynamic> dataMap = {};

Future<Map<String, dynamic>> fetchPayment() async {
  String url = 'https://api.razorpay.com/v1/payments/';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$keyID:$keySecret'))}';
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      // Refund request successful
      dataMap = jsonDecode(response.body);
      Fluttertoast.showToast(msg: "success");
      return dataMap;
    } else {
      Fluttertoast.showToast(
          msg: "Refund request failed with status code ${response.statusCode}");
      return dataMap;
    }
  } catch (error) {
    Fluttertoast.showToast(msg: "Error creating refund request: $error");
  }
  return dataMap;
}

class FetchAllPayment extends StatefulWidget {
  const FetchAllPayment({super.key});

  @override
  State<FetchAllPayment> createState() => _FetchAllPaymentState();
}

class _FetchAllPaymentState extends State<FetchAllPayment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch All Payments',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch All Payments'),
        ),
        body: const Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              
              //ElevatedButton(onPressed: fetchPayment, child: Text("Fetch All",style: TextStyle(color: Colors.black,backgroundColor: Colors.green))),
            ],
          ),
        ),
      ),
    );
  }
}
