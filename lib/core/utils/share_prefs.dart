import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/domain/models/args/add_to_cart/add_to_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _sharedPrefs;

  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  /// Check if the user is logged in.
  bool get isLoggedIn => _sharedPrefs.getBool(_keyIsLogin) ?? false;

  // Get value from cart
  Future<List<AddToCartArgs>> getAddToCartData() async {
    final String? addToCartJson = _sharedPrefs.getString(_keyAddToCart);
    if (addToCartJson == null || addToCartJson.isEmpty) {
      return [];
    }
    try {
      final List<dynamic> decodedData = jsonDecode(addToCartJson);
      return decodedData.map((item) => AddToCartArgs.fromJson(item)).toList();
    } catch (e) {
      // Log the error and return null.
      debugPrint('Error decoding loginData: $e');
      return [];
    }
  }

  /// Set the login status in SharedPreferences.
  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    await _sharedPrefs.setBool(_keyIsLogin, isLoggedIn);
  }

  // Add To cart
  Future<void> setAddToCart(List<AddToCartArgs> addToCartList) async {
    final String encodedData =
        jsonEncode(addToCartList.map((item) => item.toJson()).toList());
    await _sharedPrefs.setString(_keyAddToCart, encodedData);
  }
}

final sharedPrefs = SharedPrefs();

// constants/strings.dart
const String _keyIsLogin = "isLogin";
const String _keyAddToCart = "addToCart";
