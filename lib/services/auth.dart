import 'dart:collection';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:traki/const/url.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "application/json"
};

Future login(email, password) async {
  Map data = {"email": email, "password": password};
  String payload = json.encode(data);
  String url = '$BASEURL/api/auth/auth';
  http.Response response = await http.post(
    url,
    headers: headers,
    body: payload,
  );
  return response;
}

Future register(name, email, password, phone) async {
  Map data = {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
  };
  String payload = json.encode(data);
  String url = '$BASEURL/api/auth/register';
  http.Response response = await http.post(
    url,
    headers: headers,
    body: payload,
  );
  return response;
}

Future profile() async {
  String url = '$BASEURL/api/auth/user';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map userInfo = json.decode(prefs.getString("user"));
  headers['Authorization'] = 'Bearer ${userInfo['token']}';
  print(headers);
  http.Response response = await http.get(
    url,
    headers: headers,
  );
  return response;
}

// /api/auth/user
