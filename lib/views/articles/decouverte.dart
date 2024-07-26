import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/models/article.dart';
import 'package:guidpro_mobile/services/advice_service.dart';
import 'package:guidpro_mobile/views/widgets/article.dart';
import 'package:guidpro_mobile/views/widgets/searchBox.dart';

class Decouverte extends StatefulWidget {
  @override
  _DecouverteState createState() => _DecouverteState();
}

class _DecouverteState extends State<Decouverte> {
  final isAuthenticated = false;
  late Future<List<Advice>> futureAdvices;

  @override
  void initState() {
    super.initState();
    futureAdvices = AdviceService().fetchPublishedAdvices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBox(),
            Expanded(
              child: FutureBuilder<List<Advice>>(
                future: futureAdvices,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No advices found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ArticleItem(advice: snapshot.data![index]);
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

