import 'package:flutter/material.dart';
import 'package:guidpro_mobile/constants/Theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final isAuthenticated = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {

              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ArticleList(),
    );
  }
}

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return ArticleItem();
      },
    );
  }
}

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          // width: 90%,
          width: double.infinity,
        ),
        // overlay
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                // add image https://flutter.dev/docs/cookbook/images/network-image
                 image: const DecorationImage(
                   image: NetworkImage('https://media.istockphoto.com/id/543212762/photo/tractor-cultivating-field-at-spring.webp?b=1&s=612x612&w=0&k=20&c=OEKSWztY_quFD-ixXGvCiSp1zlHBsXzDugCnyQf6ERM='),
                  fit: BoxFit.cover,
                ),

                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Elevage de Bovin',
                    style: TextStyle(
                      color: MaterialColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: MaterialColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
