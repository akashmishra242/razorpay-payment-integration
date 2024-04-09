import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

final _formKey = GlobalKey<FormState>();
String paymentId = "";
Map<String, dynamic> dataMap = {};

String method = "";
String amount = "";
String status = "";

class Refund extends StatefulWidget {
  final String keyID;
  final String keySecret;
  final int amount;
  const Refund(
      {super.key,
      required this.keyID,
      required this.keySecret,
      required this.amount});

  @override
  State<Refund> createState() => _RefundState();
}

class KeyValue {
  final String key;
  final String value;

  KeyValue(this.key, this.value);
}

class _RefundState extends State<Refund> {
  Future<Map<String, dynamic>> getDetails(String id) async {
    String url = 'https://api.razorpay.com/v1/payments/$id';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${widget.keyID}:${widget.keySecret}'))}';
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
            msg:
                "Refund request failed with status code ${response.statusCode}");
        return dataMap;
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
    return dataMap;
  }

  void processRefund(String paymentId, int amount) async {

    // Payment needs to be in Captured Status before Refunded.
    String url = 'https://api.razorpay.com/v1/payments/$paymentId/refund';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${widget.keyID}:${widget.keySecret}'))}';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
        body: jsonEncode({'amount': amount, 'speed': 'optimum'}),
      );

      if (response.statusCode == 200) {
        // Refund request successful
        //var responseData = jsonDecode(response.body);
        Fluttertoast.showToast(
            msg: "Amount of $amount successfully refunded to Your Account");
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
  Widget build(BuildContext context) {
    List<KeyValue> items = [
      KeyValue('Method: ', method),
      KeyValue('Amount: ', amount),
      KeyValue('Status: ', status),
    ];
    return MaterialApp(
      title: 'Refund',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Refund'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Enter the Payment ID",
                    style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Payment ID"),
                  onChanged: (value) {
                    paymentId = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    dataMap = await getDetails(paymentId);
                    setState(() {
                      log(dataMap.toString());
                      //  log(dataMap['id']);
                      method = dataMap['id'];
                      amount = dataMap['amount'].toString();
                      status = dataMap['status'].toString();
                    });
                  },
                  child: Container(
                    color: Colors.cyanAccent,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "Get Details ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Text('Method: $method'),
                Text('Amount: $amount'),
                Text('Status: $status'),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      processRefund(paymentId, widget.amount);
                    },
                    child: const Text("Get Refund")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
