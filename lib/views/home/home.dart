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
              Tab(icon: Icon(Icons.agriculture), text: 'Cultures Propices'),
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
            CulturesPropicesWidget(),
          ],
        ),
      ),
    );
  }
}


class CulturesPropicesWidget extends StatelessWidget {
  final List<Map<String, String>> regionsCultures = [
    {
      "region": "Sahel",
      "culture": "Mil, Sorgho, Arachide",
      "sol": "Sol sablonneux, faible en matière organique",
      "climat": "Climat aride, précipitations faibles (300-500 mm/an)",
      "conseils": "Irrigation nécessaire pour certaines cultures, lutte contre l'érosion."
    },
    {
      "region": "Plateau-Central",
      "culture": "Maïs, Niébé, Riz",
      "sol": "Sol ferrugineux, modérément fertile",
      "climat": "Climat soudanien, précipitations moyennes (600-900 mm/an)",
      "conseils": "Utilisation de compost et d'engrais organiques recommandée."
    },
    {
      "region": "Boucle du Mouhoun",
      "culture": "Coton, Sésame, Sorgho",
      "sol": "Sol alluvial, riche en nutriments",
      "climat": "Climat soudanien, précipitations abondantes (900-1200 mm/an)",
      "conseils": "Bonne gestion de l'eau pour éviter l'excès d'humidité."
    },
    {
      "region": "Hauts-Bassins",
      "culture": "Coton, Riz, Maïs",
      "sol": "Sol ferrugineux tropical, fertile",
      "climat": "Climat soudanien, précipitations importantes (800-1100 mm/an)",
      "conseils": "Rotation des cultures pour maintenir la fertilité du sol."
    },
    {
      "region": "Cascades",
      "culture": "Riz, Banane, Manioc",
      "sol": "Sol argileux, bien drainé",
      "climat": "Climat tropical humide, précipitations très abondantes (1000-1400 mm/an)",
      "conseils": "Gestion rigoureuse de l'eau, prévention des maladies liées à l'humidité."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: regionsCultures.length,
      itemBuilder: (context, index) {
        final region = regionsCultures[index];
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  region['region']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.agriculture, color: Colors.green),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Cultures propices : ${region['culture']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.terrain, color: Colors.brown),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Sol : ${region['sol']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.cloud, color: Colors.blue),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Climat : ${region['climat']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Conseils : ${region['conseils']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
