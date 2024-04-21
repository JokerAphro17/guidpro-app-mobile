import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/views/widgets/buttons.dart';

class Board extends StatelessWidget {
  const Board({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/help.png'),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bienvenue sur',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: MaterialColors.placeholder,
                      ),
                    ),
                    Text(
                      'GUID PRO',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MaterialColors.blue,
                      ),
                    ),
                    Text(
                      'Profitez de l\'expérience des experts, afin de vous réussir vos aisements, vos projets...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MaterialColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  CustomTextButton(
                    text: 'CONNEXION',
                    backgroundColor: MaterialColors.black,
                    textColor: MaterialColors.white,
                    onPressed: () {
                      // Add your logic for the onPressed callback
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  CustomTextButton(
                    text: 'INSCRIPTION',
                    backgroundColor: MaterialColors.placeholder,
                    textColor: MaterialColors.black,
                    onPressed: () {
                      // Add your logic for the onPressed callback
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom TextButton widget
