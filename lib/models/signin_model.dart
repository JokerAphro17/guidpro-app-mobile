class SignInFormModel {
  // Properties
  String email = '';
  String password = '';

  // Constructor
  SignInFormModel({
    required this.email,
    required this.password,
  });

  // Methods
  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }
}