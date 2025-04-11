class Globs {
  static const appName = "Foodie";
  
}

class SvKey {
  static const mainUrl = "http://localhost:3001/";
  static const baseUrl = '$mainUrl/api/';
  static const nodeUrl = mainUrl;

  static const svLogin = '${baseUrl}login';
  static const svSignup = '${baseUrl}sign_up';
  static const svForgotPass = '${baseUrl}reset_password_req';
  static const svForgotPassVerify = '${baseUrl}reset_password_verify';
  static const svForgotNewPass =
      '${baseUrl}select_new_password_after_verification';
}

class KKey {
  static const status = "status";
  static const payload = "payload";
}

class MSG {
  static const enterEmail = "Enter a valid email";
  static const enterPassword = "Password must contain 8 characters";
  static const success = "success";
  static const fail = "fail";
}
