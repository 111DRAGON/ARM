class LoginModel {
  final bool success;
  final String message;
  final String data;

  LoginModel(
      {required this.success, required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }


}
