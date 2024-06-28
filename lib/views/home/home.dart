import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/views/articles/decouverte.dart';
import 'package:guidpro_mobile/views/home/home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


// tab bar
class Home extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      
      animationDuration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
      
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search), text: 'Découverte'),
              Tab(icon: Icon(Icons.save), text: 'Sauvegarde'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Decouverte(),
            Center(
          child: LoadingAnimationWidget.fourRotatingDots(color: Colors.blueGrey, size: 50),
        ),
          ],
        ),
      ),
    );
  }
}