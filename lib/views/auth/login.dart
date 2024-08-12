import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/views/widgets/buttons.dart';
import 'package:guidpro_mobile/controllers/signin_controller.dart';
import 'package:guidpro_mobile/models/signin_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CONNEXION'),
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
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoggingIn = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  final signInController = SignInController();
  final signInFormModel = SignInFormModel(
    email: '',
    password: '',
  );


  void _onLoginButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      signInFormModel.email = _emailController.text;
      signInFormModel.password = _passwordController.text;
      setState(() {
        _isLoggingIn = true;
      });
     signInController.submitForm(signInFormModel, (data) {
       setState(() {
         _isLoggingIn = false;
       });
       Fluttertoast.showToast(
          msg: 'Connexion réussie',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.pushReplacementNamed(context, '/home');


     }, () {
       setState(() {
         _isLoggingIn = false;
       });
        Fluttertoast.showToast(
            msg: 'Echec de la connexion: Email ou mot de passe incorrect',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

     });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey, // center the form contents
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo Image
              Container(
                width: 200,
                height: 200,
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
                icon: Icons.email,
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              // Password Input Field
              RoundedInputField(
                icon: Icons.lock,
                hintText: 'Mot de passe',
                obscureText: _obscureText,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              SizedBox(height: 20.0),
              // Password Forgot Button
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add your logic for the onPressed callback
                    print('Password forgot button pressed');
                  },
                  child: Text('Mot de passe oublié?'),
                ),
              ),
              SizedBox(height: 20.0),
              // Sign In Button
              CustomTextButton(
                text: 'CONNEXION',
                backgroundColor: MaterialColors.black,
                textColor: MaterialColors.white,
                onPressed: _onLoginButtonPressed,
                isLoading: _isLoggingIn,
              ),
            ],
          ),
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
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const RoundedInputField({
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
