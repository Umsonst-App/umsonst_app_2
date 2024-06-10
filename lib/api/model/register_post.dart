class RegisterModel {
  final String userName;
  final String email;

  RegisterModel({required this.userName, required this.email});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      userName: json['username'] as String,
      email: json['email'] as String,
    );
  }
}