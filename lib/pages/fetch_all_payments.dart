import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/fetch_all_model.dart';

FetchAllPaymentModel? dataMap;

class FetchAllPayment extends StatelessWidget {
  final String keyID;
final String keySecret;
  const FetchAllPayment({super.key,required this.keyID,required this.keySecret});

  Future<List<Item>?> getDetails() async {
    List<Item>? items;
    String url =
        'https://api.razorpay.com/v1/payments?from=1686444630&to=1698799830&count=5';
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
        final data = fetchAllPaymentModelFromJson(response.body);
        debugPrint(response.body);
        Fluttertoast.showToast(msg: "success");
        items = data.items;
        //print(dataMap);
        //   count = dataMap['count'].toString();
        return items;

        ///  ---Dikkat
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
        return items;
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Payment"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
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
                          decoration:BoxDecoration(border: Border.all(color: Colors.black)),
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
                                Text("Method: ${items[index].method}",
                                    style: const TextStyle(fontSize: 16)),
                                Text("Email: ${items[index].email}",
                                    style: const TextStyle(fontSize: 16)),
                                Text("Contact: ${items[index].contact}",
                                    style: const TextStyle(fontSize: 16)),
                                Text(
                                    "Amount Refunded: ${items[index].amountRefunded}",
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
          },
        ),
      ),
    );
  }
}
