import 'package:wajibika_app/utils/globals.dart' as globals;

class ValidationService {
  //validate username
  static String? usernameValidator(String? username) {
    return (username == null || username.isEmpty)
        ? 'Please enter your name'
        : (!globals.nameRegExp.hasMatch(username))
            ? 'Your name should only have letters'
            : null;
  }

  //validate password
  static String? passwordValidator(String? password) {
    return (password == null || password.isEmpty)
        ? 'Please enter a password'
        : (!globals.passwordExp.hasMatch(password))
            ? 'Your password should have at leat 6 characters'
            : null;
  }

  //validate email
  static String? emailValidator(String? email) {
    return (email == null || email.isEmpty)
        ? 'Please enter your email'
        : (!globals.emailRegExp.hasMatch(email))
            ? 'Please enter a valid email address'
            : null;
  }
}