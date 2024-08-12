import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';
import 'package:guidpro_mobile/models/article.dart';
import 'package:guidpro_mobile/views/articles/show.dart';


class ArticleItem extends StatelessWidget {
  final Advice advice;

  ArticleItem({required this.advice});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleShow(advice: advice),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ArticleCard(advice: advice),
      ),
    );
  }

}



class ArticleCard extends StatelessWidget {
   final Advice advice;

  ArticleCard({required this.advice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 200,
            height: 150,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(advice.coverUrl),
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
           Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      advice.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // categorie
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                    child: Text(
                      'Domaine: Agriculture',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 99, 99, 99),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                    child: Text(
                      'Budget départ: '+advice.budget.toString()+' FCFA',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      
                      // view
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 2.0),
                        child: Text(
                          '12/12/2021',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                     
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
             