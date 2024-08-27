import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/models/article.dart';
import 'package:guidpro_mobile/services/advice_service.dart';
import 'package:guidpro_mobile/views/widgets/article.dart';
import 'package:guidpro_mobile/views/widgets/searchBox.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Decouverte extends StatefulWidget {
  @override
  _DecouverteState createState() => _DecouverteState();
}

class _DecouverteState extends State<Decouverte> {
  final isAuthenticated = false;
  late Future<List<Advice>> futureAdvices;
  List<Advice> _allAdvices = [];
  List<Advice> _filteredAdvices = [];

  @override
  void initState() {
    super.initState();
    futureAdvices = AdviceService().fetchPublishedAdvices();
    futureAdvices.then((advices) {
      setState(() {
        _allAdvices = advices;
        _filteredAdvices = advices;
      });
    });
  }

  void search(String query) {
    setState(() {
      _filteredAdvices = _allAdvices
          .where((advice) =>
              advice.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBox(onSearchChanged: search),
            Expanded(
              child: FutureBuilder<List<Advice>>(
                future: futureAdvices,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.blueGrey, size: 50));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("Pas d'articles"));
                  } else {
                    return ListView.builder(
                      itemCount: _filteredAdvices.length,
                      itemBuilder: (context, index) {
                        return ArticleItem(advice: _filteredAdvices[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
