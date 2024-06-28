import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';


class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/article');
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ArticleCard(),
      ),
    );
  }

}



class ArticleCard extends StatelessWidget {
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/150'),
                fit: BoxFit.cover,
                
              ),
            )
          ),
          const Expanded(
            
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
                    'Elevage de poules pondeuses',
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
                    'Budget départ: 13 000 000 FCFA',
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
                    Spacer(),
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
                    Spacer(),
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
                ),
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
