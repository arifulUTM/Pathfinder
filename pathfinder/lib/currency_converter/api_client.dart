import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "1d730282ff43eacd0a22"});

  // Free Api Link : https://free.currencyconverterapi.com/
  // Here's your free API key: 1d730282ff43eacd0a22
  // The first parameter of URI should be just the main url, without http, any kind of special char like
  // the second parameter will be the endpoint patch
  // and the third parameter is a map for the different properties

  // Now let's make the function to get the Currencies list

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      print(currencies);
      return currencies;
    } else {
      throw Exception("Failed to Connect to API");
    }
  }

// Getting Exchange Rate

  Future<double> getRate(String from, String to) async {
    final Uri rateUrl = Uri.https('free.currconv.com', '/api/v7/convert', {
      "apiKey": "1d730282ff43eacd0a22",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response res = await http.get(rateUrl);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    } else {
      throw Exception("Failed to Connect with API");
    }
  }
}
