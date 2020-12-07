const String kRegexEmail =
    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
const String kRegexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}\$";
const String kRegexPhone = "\\(?(0[0-9]{2})\\)?([ .-]?)([0-9]{3})\\2([0-9]{4})";

String validateEmail(String email) {
  RegExp regExp = RegExp(kRegexEmail);
  // if (!regExp.hasMatch(value)) {
  if (email.length < 4) {
    return "Invalid email";
  }
  return null;
}

String validateNameUser(String name) {
  RegExp regExp = RegExp(kRegexEmail);
  // if (!regExp.hasMatch(value)) {
  if (name.length < 4) {
    return "Invalid user name";
  }
  return null;
}

String validatePhone(String phone) {
  final RegExp regExp = RegExp(kRegexPhone);
  if (!regExp.hasMatch(phone)) {
    return "Invalid Phone";
  }
  return null;
}

String validateOTP(String email) {
  RegExp regExp = RegExp(kRegexEmail);
  // if (!regExp.hasMatch(value)) {
  if (email.length != 6) {
    return "Invalid OTP";
  }
  return null;
}

String validatePassword(String password) {
  RegExp regExp = RegExp(kRegexPassword);
  // if (!regExp.hasMatch(value)) {
  if (password.length < 4) {
    return "Invalid password";
  }
  return null;
}

String validateConfirmPassword(String password, String confirmPassword) {
  RegExp regExp = RegExp(kRegexPassword);
  // if (!regExp.hasMatch(value)) {
  if (password.length < 4) {
    return "Invalid password";
  }

  if (password != confirmPassword) {
    return "Password and confirm password is not the same";
  }

  return null;
}
