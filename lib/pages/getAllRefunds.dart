import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/refunds.dart';
import 'package:http/http.dart' as http;

//List<Refund> refunds = collection.items;

class AllRefunds extends StatelessWidget {
  final String keyID;
  final String keySecret;
  const AllRefunds({super.key,required this.keyID,required this.keySecret});

  Future<List<Item>?> getDetails() async {
    List<Item>? items;
    String url = 'https://api.razorpay.com/v1/refunds';
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
        final dataMap = fetchAllRefundModelFromJson(response.body);
        List<Item>? items = dataMap.items;
        Fluttertoast.showToast(msg: "success");
        return items;
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
        return items;
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
      return items;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: FutureBuilder(
              future: getDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  debugPrint("snapshot");
                  List<Item>? items = snapshot.data;

                  return Center(
                      child: ListView.builder(
                          itemCount: items!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("ID: ${items[index].id}",
                                        style: const TextStyle(fontSize: 16)),
                                    Text("Status: ${items[index].status}",
                                        style: const TextStyle(fontSize: 16)),
                                    Text("Amount: ${items[index].amount}",
                                        style: const TextStyle(fontSize: 16)),
                                    Text("CreatedAt: ${items[index].createdAt}",
                                        style: const TextStyle(fontSize: 16)),
                                    Text("Currency: ${items[index].currency}",
                                        style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
