import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/fetch_all_model.dart';

const String keyID = 'rzp_test_oXV9AaMUvzydYV';
const String keySecret = '5yXOXDpaj0IvxnGSx6zwwHM5';
Map<String, dynamic> dataMap = {};

class FetchAllPayment extends StatefulWidget {
  const FetchAllPayment({super.key});

  @override
  State<FetchAllPayment> createState() => _FetchAllPaymentState();
}

class _FetchAllPaymentState extends State<FetchAllPayment> {
  Future<FetchAllModel> getDetails() async {
    String url =
        'https://api.razorpay.com/v1/payments?from=1686444630&to=1698799830&count=2&skip=1';
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
        print(dataMap);
        return FetchAllModel();

        ///  ---Dikkat
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
        return FetchAllModel();
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
    return FetchAllModel();
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
            FutureBuilder(
              future: getDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("snapshot");
                  FetchAllModel? data = snapshot.data;
                  //   List<Item>? item = data!.items;

                  return const Center(
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
                                child: Text("ID: {data.count.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("ID: {item?[0].id.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("ID: {item?[0].id.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("ID: {item?[0].id.toString()}"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("ID: {item?[0].id.toString()}"),
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
