import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/onboard-background.jpg"),
                      fit: BoxFit.cover))),
          Padding(
            padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 48.0),
                        child: Text.rich(TextSpan(
                            text: "Guide Pro",
                            style: TextStyle(color: Colors.white, fontSize: 58),
                            children: <TextSpan>[
                            ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: Text(
                            "Profitez de l'expérience des experts, afin de vous reussir vos aisements, vos projets...",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w200)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 42.0),
                    child: Row(children: <Widget>[
                      Container(

                      )
                    ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}

