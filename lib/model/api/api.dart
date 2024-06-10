class LoginResponse {
  final String uid;

  LoginResponse({required this.uid});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return LoginResponse(
      uid: json['uid'],
    );
  }
}

class ErrorResponse {
  final String error;
  final String message;

  ErrorResponse({required this.error,required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json){
    return ErrorResponse(
      error: json['error'],
      message: json['message'],);
  }
}