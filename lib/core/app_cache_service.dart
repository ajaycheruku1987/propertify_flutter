// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/service_locator.dart';

const String ACCESS_TOKEN = 'accessToken';
const String CUSTOMER_ACCOUNT_ID = 'customerAccountId';
const String USER_PHONE = 'userPhone';
const String LOGIN_STATUS = 'loginStatus';
const String THEME_VALUE = 'themeValue';
const String USER_ROLE = 'userRole';

class AppCacheService {
  String? _token;
  String? _customerAccountId;
  String? _role;
  String? _phone;

  String? get token => _token ?? sharedPreferences.getString(ACCESS_TOKEN);

  String? get customerAccountId {
    final id = _customerAccountId ?? sharedPreferences.getString(CUSTOMER_ACCOUNT_ID);
    return (id == null || id.isEmpty) ? null : id;
  }

  String? get userPhone {
    final phone = _phone ?? sharedPreferences.getString(USER_PHONE);
    return phone;
  }

  String? get role => _role ?? sharedPreferences.getString(USER_ROLE);

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
    _customerAccountId = id;
    return await sharedPreferences.setString(CUSTOMER_ACCOUNT_ID, id);
  }

  Future<String?> getCustomerAccountId() async {
    final id = sharedPreferences.getString(CUSTOMER_ACCOUNT_ID);
    _customerAccountId = id;
    return id;
  }

  ///[User Phone]
  Future<bool> saveUserPhone(String phone) async {
    _phone = phone;
    return await sharedPreferences.setString(USER_PHONE, phone);
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
    _phone = null;
    return await sharedPreferences.clear();
  }
}
