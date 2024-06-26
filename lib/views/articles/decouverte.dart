import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/views/widgets/article.dart';
import 'package:guidpro_mobile/views/widgets/searchBox.dart';

class Decouverte extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Decouverte> {
  final isAuthenticated = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBox(),
            Expanded(
              child: ArticleList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ArticleItem();
      },
    );
  }
}

