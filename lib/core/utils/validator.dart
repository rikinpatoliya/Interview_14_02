import 'package:flutter/services.dart';

String? validateNullOrBlank(String? value, String msg) {
  return value == null || value.trim().isEmpty ? msg : null;
}

String? validateMobileNo(dynamic value) {
  bool mobileValid = RegExp(r"^[0-9]{10}$").hasMatch(value);
  if (value.isEmpty) {
    return 'Please enter mobile no.';
  } else if (value.length != 10) {
    return 'Please enter valid mobile no.';
  } else if (!mobileValid) {
    return 'Please enter valid mobile no.';
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (password == null || password.isEmpty) {
    return 'Please enter password';
  } else if (!regex.hasMatch(password)) {
    return 'Use 8 or more characters with a mix of uppercase and lowercase letters, numbers & Special Character';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please enter confirm password';
  } else if (value.trim() != password) {
    return 'Password and confirm password not match';
  } else {
    return null;
  }
}

String? validateEmailId(String? value) {
  if (value == null) {
    return 'Please enter valid email id';
  }
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (emailValid) {
    return null;
  } else {
    return 'Please enter valid email id';
  }
}

FilteringTextInputFormatter spaceNotAllowed() {
  return FilteringTextInputFormatter.deny(RegExp('[ ]'));
}

FilteringTextInputFormatter onlyAlphaAllowed() {
  return FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$'));
}
