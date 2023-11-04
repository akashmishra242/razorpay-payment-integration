import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/refunds.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> dataMap = {};
Collection collection = Collection.fromJson(dataMap);
const String keyID = 'rzp_test_oXV9AaMUvzydYV';
const String keySecret = '5yXOXDpaj0IvxnGSx6zwwHM5';
List<Refund> refunds = collection.items;

class AllRefunds extends StatefulWidget {
  const AllRefunds({super.key});

  @override
  State<AllRefunds> createState() => _AllRefundsState();
}

class _AllRefundsState extends State<AllRefunds> {
  void getDetails() async {
    String url =
        'https://api.razorpay.com/v1/payments/pay_Mr7Hgx714XiLzw/refunds';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$keyID:$keySecret'))}';
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
        collection = Collection.fromJson(dataMap);
        refunds = collection.items;
        Fluttertoast.showToast(msg: "success");
        setState(() {});
        for (Refund refund in refunds) {
          print('Refund ID: ${refund.id}');
          print('Amount: ${refund.amount} ${refund.currency}');
          print('Payment ID: ${refund.paymentId}');
          print('Status: ${refund.status}');
          print('Notes: ${refund.notes.comment}');
          print('Acquirer ARN: ${refund.acquirerData.arn}');
          print('Created At: ${refund.createdAt}');
          print('Batch ID: ${refund.batchId}');
          print('Speed Processed: ${refund.speedProcessed}');
          print('Speed Requested: ${refund.speedRequested}');
          print('--------------------------------');
        }
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(),
      ),
    );
  }
}
