
class Validator {
  // private constructor to avoid create class object
  Validator._();

  // check if string not empty and has value
  static bool hasValue(String? string) {
    if (string == null || string.isEmpty) return false;
    return true;
  }

  // Return true if email is valid. Otherwise, return false
  static bool isEmail(String? email) {
    RegExp exp = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (exp.hasMatch(email ?? "")) return true;
    return false;
  }

  // Return true if email is valid. Otherwise, return false
  static bool isArabic(String string) {
    RegExp exp = new RegExp(r'[\u0600-\u06FF]+');
    if (exp.hasMatch(string)) return true;
    return false;
  }

  // Return true if phone number is valid. Otherwise, return false
  static bool isPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }
    final pattern = r'^01[0125][0-9]{8}';
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(phoneNumber)) return true;
    return false;
  }

  // Return true if password is valid. Otherwise, return false
  static bool isValidPassword(String? password) {
    if (password == null) return false;
    if (password.length < 6) return false;
    return true;
  }

  // Return true if String is valid Numeric. Otherwise, return false
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // Return true if String is valid url. Otherwise, return false
  static bool isUrl(String url) {
    if (url == null) return false;
    final pattern = r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(url)) return true;
    return false;
  }



}
