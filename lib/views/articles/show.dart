import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';


class ArticleShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Show'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://borgenproject.org/wp-content/uploads/5367334314_c107c3d846_z-1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Article Title', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.8), fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      
                      child: Column(
                        children: [
                          Icon(Icons.person, color: const Color.fromARGB(255, 221, 82, 82), size: 50),
                          Text('ghh', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8), fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                 )
                ],
              ),
            ),
          ],

        ), ),
    );
  }
}