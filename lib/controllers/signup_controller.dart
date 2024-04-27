import 'package:guidpro_mobile/models/sign_up_model.dart';
import 'package:guidpro_mobile/api/client.dart';

class SignUpController {

 void submitForm(SignUpFormModel signUpFormModel ) async {
  final apiClient = ApiClient();
  try {
   final data = await apiClient.postData('/signup',signUpFormModel.toJson());
   print('Sign up successful: $data');
  } catch (e) {
   print('Failed to sign up: $e');
  }
 }


}

