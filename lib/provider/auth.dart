import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyByOKuu8-vI3YL0MJsgUL6fR_BdiB6f6IU';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        print(responseData['error']);
        throw HttpException(responseData['error']['message']);
      }
    } catch (e) {
      // print(e);
      throw e;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}

//  'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=xxx';
//  return _authenticate(email, password, 'signupNewUser');
//  return _authenticate(email, password, 'verifyPassword');
