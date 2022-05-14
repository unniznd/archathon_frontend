import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';

Future<bool> authenticate(String username, var password) async {
  var response = await http.post(
    Uri.parse('https://archathonbackendserver.herokuapp.com/login/'),
    body: {"username": username, "password": password.toString()},
  );

  if (response.statusCode == 200) {
    final Map auth = json.decode(response.body);
    print(auth['token']);
    await storage.write(key: "token", value: auth['token']);
    return true;
  }
  return false;
}

Future<bool> create_account(String username, var password, String email) async {
  var response = await http.post(
    Uri.parse('https://archathonbackendserver.herokuapp.com/register/'),
    body: {
      "username": username,
      "password": password.toString(),
      "email": email
    },
  );

  if (response.statusCode == 200) {
    final Map auth = json.decode(response.body);
    // print(auth['token']);
    await storage.write(key: "token", value: auth['token']);
    return true;
  }
  return false;
}
