import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/controllers/signup_controller.dart';
import 'package:guidpro_mobile/models/sign_up_model.dart';
import 'package:guidpro_mobile/views/widgets/buttons.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSCRIPTION'),
      ),
      body: SingleChildScrollView(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }
  SignUpController signUpController = SignUpController();

  void _onSignUpButtonPressed() {
    signUpFormModel.fullName = fullNameController.text;
    signUpFormModel.email = emailController.text;
    signUpFormModel.phone = phoneController.text;
    signUpFormModel.password = passwordController.text;
    signUpFormModel.confirmPassword = confirmPasswordController.text;

    signUpController.submitForm(signUpFormModel);

  }

  SignUpFormModel signUpFormModel = SignUpFormModel(
    fullName: '',
    email: '',
    phone: '',
    password: '',
    confirmPassword: '',
  );

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img/gp.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Email Input Field
            RoundedInputField(
              icon: Icons.person,
              hintText: 'Nom complet',
              controller: fullNameController,
            ),
            SizedBox(height: 20.0),
            RoundedInputField(
              icon: Icons.email,
              controller: emailController,
              hintText: 'Email',
            ),
            SizedBox(height: 20.0),
            RoundedInputField(
              icon: Icons.phone,
              controller: phoneController,
              hintText: 'Numéro de téléphone',
              keyboardType: TextInputType.phone,

            ),
            SizedBox(height: 20.0),
            // Password Input Field
            RoundedInputField(
              icon: Icons.lock,
              hintText: 'Mot de passe',
              controller: passwordController,
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            SizedBox(height: 20.0),
            RoundedInputField(
              icon: Icons.lock,
              controller: confirmPasswordController,
              hintText: 'Confirmer le mot de passe',
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility2,
              ),
            ),
            SizedBox(height: 20.0),
            // Password Forgot Button
            // Sign In Button
            CustomTextButton(
              text: 'CONNEXION',
              backgroundColor: MaterialColors.black,
              textColor: MaterialColors.white,
              onPressed: () {
                _onSignUpButtonPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  // keyboarType: TextInputType.emailAddress,
  final TextInputType keyboardType;
  final TextEditingController controller;


  const RoundedInputField({
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
