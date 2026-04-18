// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/service_locator.dart';

const String ACCESS_TOKEN = 'accessToken';
const String CUSTOMER_ACCOUNT_ID = 'customerAccountId';
const String LOGIN_STATUS = 'loginStatus';
const String THEME_VALUE = 'themeValue';
const String USER_ROLE = 'userRole';

class AppCacheService {
  String? _token;
  String? get token => _token;

  String? _customerAccountId;
  String? get customerAccountId => _customerAccountId;

  String? _role;
  String? get role => _role;

  SharedPreferences get sharedPreferences =>
      serviceLocator<SharedPreferences>();

  ///[Theme]
  saveTheme(String themeValue) async {
    await sharedPreferences.setString(THEME_VALUE, themeValue);
  }

  ///[Token]
  Future<bool> saveToken(String token) async {
    bool saved = await sharedPreferences.setString(ACCESS_TOKEN, token);
    if (saved) {
      _token = getToken();
    }
    return saved;
  }

  String? getTheme() {
    var theme = sharedPreferences.getString(THEME_VALUE);

    return theme;
  }

  String? getToken() {
    var token = sharedPreferences.getString(ACCESS_TOKEN);
    return token;
  }

  Future<bool> deleteToken() async {
    _token = null;
    return await sharedPreferences.remove(ACCESS_TOKEN);
  }

  ///[Role]
  Future<bool> saveRole(String role) async {
    bool saved = await sharedPreferences.setString(USER_ROLE, role);
    if (saved) {
      _role = role;
    }
    return saved;
  }

  String? getRole() {
    _role = sharedPreferences.getString(USER_ROLE);
    return _role;
  }

  Future<bool> deleteRole() async {
    _role = null;
    return await sharedPreferences.remove(USER_ROLE);
  }

  ///[Customer Account Id]
  Future<bool> saveCustomerAccountId(String id) async {
    bool saved = await sharedPreferences.setString(CUSTOMER_ACCOUNT_ID, id);
    if (saved) {
      _customerAccountId = await getCustomerAccountId();
    }
    return saved;
  }

  Future<String?> getCustomerAccountId() async {
    String id;
    var cid = sharedPreferences.getString(CUSTOMER_ACCOUNT_ID);
    if (cid == null) {
      id = '';
      return null;
    }
    id = cid;
    _customerAccountId = id;
    log("$_customerAccountId");
    return _customerAccountId;
  }

  Future<bool> deleteCustomerAccountId() async {
    _customerAccountId = null;
    return await sharedPreferences.remove(CUSTOMER_ACCOUNT_ID);
  }

  bool getFirstLoginStatus() {
    return sharedPreferences.getBool(LOGIN_STATUS) ?? false;
  }

  Future<bool> clearAll() async {
    _token = null;
    _customerAccountId = null;
    _role = null;
    return await sharedPreferences.clear();
  }
}
