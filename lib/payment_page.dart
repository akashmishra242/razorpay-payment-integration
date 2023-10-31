// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rozarpay/pages/curd.dart';
import 'package:rozarpay/utils/routes.dart';



class PaymentPage extends StatefulWidget {
  final String keyID;
  final String keySecret;
  final int amount;
  final String? productImage;

  const PaymentPage(
      {super.key,
      required this.keyID,
      required this.keySecret,
      required this.amount,
      this.productImage});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openPaymentPortal() async {
    var options = {
      'key': widget.keyID,
      'amount': widget.amount,
      'name': 'Sujal',
      'description': 'Payment',
      'prefill': {
        'contact': '9999999999',
        'email': 'sujalschauhan123@gmail.com'
      },
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  void processRefund(String paymentId, double amount) async {
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
        body: jsonEncode({'amount': widget.amount, 'speed': 'optimum'}),
      );

      if (response.statusCode == 200) {
        // Refund request successful
        //var responseData = jsonDecode(response.body);
        Fluttertoast.showToast(msg: "Amount refunded to Your Account");
      } else {
        Fluttertoast.showToast(
            msg:
                "Refund request failed with status code ${response.statusCode}");
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error creating refund request: $error");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "PAYMENT WAS SUCCESSFUL: ${response.paymentId}");
    //paymentId=response.paymentId!;
    //   channel.sink.add("Payment Was Successfull, 200 Credited");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR OCCURED: ${response.code} - ${response.message}");
    // channel.sink.add("Error Occured In Payment");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET IS : ${response.walletName}");
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 14, 40, 235),
        centerTitle: true,
        title: const Text('Payment',
            style: TextStyle(fontSize: 22.0, color: Color(0xFF545D68))),
      ),
      body: Column(children: [
        const SizedBox(height: 16.0),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Text(
                    'Tesla Car',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                  const SizedBox(height: 10.0),
                  Image.asset(
                    'assets/images/tesla.png',
                    scale: 2,
                  ),
                  const Text(' Price : 200',
                      style: TextStyle(color: Colors.grey, fontSize: 24.0)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 18.0),
        InkWell(
            onTap: () {
              openPaymentPortal();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Container(
                  width: MediaQuery.of(context).size.width - 60.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue.shade900),
                  child: Center(
                      child: Text('Pay',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue.shade50)))),
            )),
        const SizedBox(
          child: Text("Issue A Refund"),
          height: 30.0,
        ),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.Refund);
              //processRefund('pay_Mr7Hgx714XiLzw', 20000);
             // getDetails("pay_Mr7Hgx714XiLzw");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Container(
                  width: MediaQuery.of(context).size.width - 60.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromARGB(255, 227, 51, 3)),
                  child: Center(
                      child: Text('Get Refund',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue.shade50)))),
            )),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) {
        //           return const CURDPage();
        //         },
        //       ));
        //     },
        //     child: const Text("CURD")),
      ]),
    );
  }
}
