import 'package:flutter/material.dart';
import 'screens/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async => runApp(new MainScreen());
Future<List> _apicall() async {
  String strUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=5";
  final response = await http.get(strUrl);
  print(response.body);
  return json.decode(response.body);
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Loginscreen(),
    );
  }
}
