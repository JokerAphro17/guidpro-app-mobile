import 'package:guidpro_mobile/api/client.dart';
import 'package:guidpro_mobile/models/signin_model.dart';

class SignInController {
  void submitForm(SignInFormModel signInFormModel, Function(Object) onSignInSuccess, Function(Object) onSignInFailure) async {
    final apiClient = ApiClient();
    try {
      final data = await apiClient.postData('/auth/signin', signInFormModel.toJson());
      print('Sign in successful: $data');
      onSignInSuccess(data);
    } catch (e) {
      if (e is Map<String, dynamic>) {
        print('Failed to sign in: ${e['message']}');
        onSignInFailure(e);
      } else {
        print('Failed to sign in: $e');
      }
    }
  }
}