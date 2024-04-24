import 'package:guidpro_mobile/models/sign_up_model.dart';

class SignUpController {


   void submitForm(SignUpFormModel signUpFormModel) {
    // display the user data
    print('First Name: ${signUpFormModel.fullName}');
    print('Email: ${signUpFormModel.email}');
    print('Phone: ${signUpFormModel.phone}');
    print('Password: ${signUpFormModel.password}');
    print('Confirm Password: ${signUpFormModel.confirmPassword}');

}

}
