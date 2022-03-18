import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String token;
  String userid;
  DateTime expiry;

  Auth({required this.expiry, required this.token, required this.userid});

  Future<void> login(
      {required String userEmail, required String password}) async {
    const apikey = "AIzaSyBeFUxL0wsC56WIKI4NCmGz2aSI5LgS4x8";
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apikey");
    await http.post(url,
        body: json.encode({
          'email': userEmail,
          'password': password,
          'returnSecureToken': true
        }));
  }

  Future<void> reg(
      {required String userEmail, required String password}) async {
    const apikey = "AIzaSyBeFUxL0wsC56WIKI4NCmGz2aSI5LgS4x8";
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apikey");
    final res = await http.post(url,
        body: json.encode({
          'email': userEmail,
          'password': password,
          'returnSecureToken': true
        }));

    print(json.decode(res.body));
  }
}
