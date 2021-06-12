import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pay/pay.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home:  HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  // ignore: unused_field
  var _formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final paymentItems = <PaymentItem>[
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
    type: PaymentItemType.total,
  )
];
 void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  // void onApplePayResult(paymentResult) {
  //   debugPrint(paymentResult.toString());
  // }

  @override
  void initState() {
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Transaction",
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formkey,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
              
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GooglePayButton(
                        width: 150,
                        height: 50,
                        paymentConfigurationAsset: 'Gpay.json',
                        paymentItems: paymentItems,
                        style: GooglePayButtonStyle.black,
                        type: GooglePayButtonType.pay,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: onGooglePayResult,
                        loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                        
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}