// import 'package:get/utils.dart';

class Validator {
  String? email(String? value) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'Please enter an email';
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid email address';
    }
  }

  String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required'.toString();
    } else {
      return null;
    }
  }

  String? password(String? value, {bool isFromLogin = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if ((value.length) < 6) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  String? cnfPassword({
    required String? value1,
    required String? value2,
  }) {
    if (value1 == null || value1.isEmpty || value2 == null || value2.isEmpty) {
      return 'Please enter password';
    }
    if (value1 == value2) {
      return null;
    } else {
      return 'Please enter same password as above';
    }
  }
}
