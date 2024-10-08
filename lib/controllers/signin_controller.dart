import 'package:guidpro_mobile/api/client.dart';
import 'package:guidpro_mobile/models/signin_model.dart';

class SignInController {
  void submitForm(SignInFormModel signInFormModel, Function(Map<String, dynamic>) onSignInSuccess, Function() onSignInFailure) async {
    final apiClient = ApiClient();
    try {
      final data = await apiClient.postData('/auth/signin', signInFormModel.toJson());
      print('Sign in successful: $data');
      onSignInSuccess(data);
      apiClient.persistToken(data['data']['tokens']['token']);
    } catch (e) {
       onSignInFailure();
      if (e is Map<String, dynamic>) {
        print('Failed to sign in: ${e['message']}');
       
      } else {
        print('Failed to sign in: $e');
      }
    }
  }
  // save sessionget
}