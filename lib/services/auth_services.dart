import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';


class AuthServices {
  static var client = http.Client();

  static Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> result;
    Uri uri = Uri.parse('https://dummyjson.com/auth/login');
    Map<String, String> data = {'username':username, 'password':password};
    try {
      var response = await http.post(
        uri,
        body: json.encode(data),
        headers: <String, String>{'Content-Type': 'application/json'}
      );
      if (response.statusCode == 200) {
        User user = userFromJson(response.body);
        result = {
          'status': true,
          'message': 'Successfully logged in.',
          'data': user,
        };
      } else {
        result = {
          'status': false,
          'message': 'Logged in failed.',
          'data': null,
        };        
      }
    } catch (e) {
      result = {
        'status': false,
        'message': 'Unsuccessful request',
        'data': null, 
      };
    }
    return result;
  }
}