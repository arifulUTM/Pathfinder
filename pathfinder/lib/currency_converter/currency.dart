import 'package:flutter/material.dart';
import 'package:pathfinder/currency_converter/drop_down.dart';
import 'package:pathfinder/currency_converter/api_client.dart';

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  // At first we need to create an instance of the Api client
  ApiClient client = ApiClient();
  // Setting the Main Colors
  Color mainColor = Color(0xFF212936);
  Color secondColor = Color(0xFF2849E5);
  List<String> currencies;
  String from;
  String to;

  // variable for exchange rate

  double rate;
  String result = "";

  // Lets Make a Function to call the Api

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Currency Converter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        onSubmitted: (value) async {
                          // lets make the function to get exchange rate
                          rate = await client.getRate(from, to);
                          setState(() {
                            result =
                                (rate * double.parse(value)).toStringAsFixed(3);
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Input value to convert",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            color: secondColor,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customDropDown(currencies, from, (val) {
                            setState(() {
                              from = val;
                            });
                          }),
                          FloatingActionButton(
                            onPressed: () {
                              String temp = from;
                              setState(() {
                                from = to;
                                to = temp;
                              });
                            },
                            child: Icon(Icons.swap_horiz),
                            elevation: 0.0,
                            backgroundColor: secondColor,
                          ),
                          customDropDown(currencies, to, (val) {
                            setState(() {
                              to = val;
                            });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Result",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(result,
                                style: TextStyle(
                                  color: secondColor,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
