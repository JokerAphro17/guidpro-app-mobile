import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/views/widgets/buttons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Guide Pro',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginScreen(),
  ));
}

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

void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
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
          ),
          SizedBox(height: 20.0),
          // Password Input Field
          RoundedInputField(
            icon: Icons.lock,
            hintText: 'Mot de passe',
            obscureText: _obscureText,
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
            onPressed: () {
              // Add your logic for the onPressed callback
              print('Login button pressed');
            },
          ),
        ],
      ),
    );
  }

}

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  const RoundedInputField({
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
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
