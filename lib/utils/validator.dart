const String kRegexEmail =
    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
const String kRegexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}\$";

String validateEmail(String email) {
  RegExp regExp = RegExp(kRegexEmail);
  // if (!regExp.hasMatch(value)) {
  if (email.length < 4) {
    return "Invalid email";
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
