import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiresIn;

  bool get isAuth {
    final isvalid = _expiresIn?.isAfter(DateTime.now()) ?? false;
    return _token != null && isvalid;
  }

  String? get getToken {
    return isAuth ? _token : null;
  }

  String? get getEmail {
    return isAuth ? _email : null;
  }

  String? get getUid {
    return isAuth ? _uid : null;
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDunT9kaar3hkfdVyM3x-QBMQ0ooQ0ILYI';

    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
        {'email': email, 'password': password, 'returnSecureToken': true},
      ),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      print('houve erro!');
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];
      _expiresIn = DateTime.now().add(
        Duration(
          seconds: int.parse(
            body['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    }

    print('========================$urlFragment===========================');
    print(response.body);
    print('========================$urlFragment===========================');
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signIn(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
