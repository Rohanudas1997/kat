import 'package:kat_game/common/constant/utils/text_utils.dart';

class FormValidator {
  static String? validateEmail(String? val) {
    if (val == null) {
      return "Email field cannot be empty";
    } else if (val.isEmpty) {
      return "Email field cannot be empty";
    } else if (TextUtils.validateEmail(val)) {
      return null;
    } else {
      return "Please enter valid email address";
    }
  }

  static String? validatePassword(String? val) {
    if (val == null) {
      return "Password field cannot be empty";
    } else if (val.isEmpty) {
      return "Password field cannot be empty";
    } else if (val.length < 8) {
      return "Password must be at least 8 character long";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? newPassword) {
    if (val == null) {
      return "Password field cannot be empty";
    } else if (val.isEmpty) {
      return "Password field cannot be empty";
    } else if (val.length < 8) {
      return "Password must be at least 8 character long";
    } else if (val != newPassword) {
      return "Invalid confirm password";
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null) {
      return "Name field cannot be empty";
    } else if (val.isEmpty) {
      return "Name field cannot be empty";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    RegExp regExp = RegExp(r'(^[9][678][0-9]{8}$)');
    if (val == null) {
      return "Phone number field cannot be empty";
    } else if (val.isEmpty) {
      return "Phone number field cannot be empty";
    } else if (val.length != 10 && !regExp.hasMatch(val)) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }

  static String? validateFieldNotEmpty(String? val, String fieldName) {
    if (val == null) {
      return "$fieldName field cannot be empty";
    } else if (val.isEmpty) {
      return "$fieldName field cannot be empty";
    } else {
      return null;
    }
  }

  static String? validateDateOfBirth(String? val) {
    if (val == null) {
      return "Date of birth field cannot be empty";
    } else if (val.isEmpty) {
      final DateTime dateTime = DateTime.parse(val);
      final maxDate = DateTime.now().year - 21;
      if (dateTime.year < maxDate) {
        return "Date of birth field cannot be empty";
      } else {
        return "Date of birth must be at least 21 years old";
      }
    } else {
      return null;
    }
  }
}
