class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String email;
  String password;
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String profilePicture;

  RegisterRequest(
    this.email,
    this.password,
    this.userName,
    this.mobileNumber,
    this.countryMobileCode,
    this.profilePicture,
  );
}
