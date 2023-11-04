import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rozarpay/refund.dart';

import '../models/upi_model.dart';

class CURDPage extends StatefulWidget {
  const CURDPage({super.key});

  @override
  State<CURDPage> createState() => _CURDPageState();
}

String paymentId = "";

class _CURDPageState extends State<CURDPage> {
  Future<UpiModel> getDetails(String id) async {
    String url = 'https://api.razorpay.com/v1/payments/$id';
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
        Fluttertoast.showToast(msg: "success");
        return UpiModel.fromJson(dataMap);
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
        return UpiModel();
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
    return UpiModel();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Payment"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Enter the Payment ID", style: TextStyle(fontSize: 20)),
            TextFormField(
              decoration: const InputDecoration(labelText: "Payment ID"),
              onChanged: (value) {
                paymentId = value;
                setState(() {});
              },
            ),
            FutureBuilder(
              future: getDetails(paymentId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UpiModel? upidata = snapshot.data;
                  int index = 0;
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 0, vertical: 8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Text("ID: ${upidata!.id.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                    "Amount: ${upidata.amount.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                    "Status: ${upidata.status.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                    "Currency: ${upidata.currency.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                    "International: ${upidata.international.toString()}"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
