import 'package:flutter/material.dart';
import 'package:guidpro_mobile/views/articles/decouverte.dart';
import 'package:guidpro_mobile/views/auth/login.dart';
import 'package:guidpro_mobile/views/drawer/profile.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Guid Pro"),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Ouvrir le drawer manuellement
              },
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search), text: 'Découverte'),
              Tab(icon: Icon(Icons.save), text: 'Sauvegarde'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Guid Pro Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Accueil'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0; // Sélectionne l'onglet d'accueil
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                  // Ajoutez votre logique pour naviguer vers les paramètres ici
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Déconnexion'),
                onTap: () {
                  Navigator.pop(context);
                  _logout(context);
                },
              ),
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
