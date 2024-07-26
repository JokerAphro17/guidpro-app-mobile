
class SignUpFormModel {

  // Properties
    String fullName = '';
   String email = '';
   String phone = '';
   String password = '';
   String confirmPassword = '';

  // Constructor
  SignUpFormModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  // Methods
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }


}
