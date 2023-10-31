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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getDetails("pay_Mr7Hgx714XiLzw"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UpiModel? upidata = snapshot.data;

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
                                Text(upidata!.id.toString()),
                                Text(upidata.amount.toString()),
                                Text(upidata.status.toString()),
                                Text(upidata.currency.toString()),
                                Text(upidata.description.toString()),
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
      ),
    );
  }
}
