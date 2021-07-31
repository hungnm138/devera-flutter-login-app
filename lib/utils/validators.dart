/// Validator class hold the RegExp for requested validation
class Validators {
  ///
  /// Regular expression
  ///

  /// Email RegEx
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  /// Password RegEx
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  ///
  /// Functions
  ///

  /// isValidEmail
  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  /// isValidPassword
  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
