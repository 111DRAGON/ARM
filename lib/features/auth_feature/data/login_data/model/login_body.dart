class LoginBody {
  final String phone;
  final String password;

  LoginBody({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
