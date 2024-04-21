import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/views/widgets/buttons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Guide Pro',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SignUpScreen(),
  ));
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSCRIPTION'),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: Padding(
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
            // First Name Input Field
            RoundedInputField(
              icon: Icons.person,
              hintText: 'Prénom',
            ),
            SizedBox(height: 20.0),
            // Last Name Input Field
            RoundedInputField(
              icon: Icons.person,
              hintText: 'Nom',
            ),
            SizedBox(height: 20.0),
            // Phone Number Input Field
            RoundedInputField(
              icon: Icons.phone,
              hintText: 'Numéro de téléphone',
              keyboardType: TextInputType.phone,
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
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            SizedBox(height: 20.0),
            // Confirm Password Input Field
            RoundedInputField(
              icon: Icons.lock,
              hintText: 'Confirmer le mot de passe',
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            SizedBox(height: 20.0),
            // Sign Up Button
            CustomTextButton(
              text: 'INSCRIPTION',
              backgroundColor: MaterialColors.black,
              textColor: MaterialColors.white,
              onPressed: () {
                // Add your logic for the onPressed callback
                print('Sign Up button pressed');
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
  final TextInputType? keyboardType;

  const RoundedInputField({
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
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
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
