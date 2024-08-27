import 'package:flutter/material.dart';
import 'package:guidpro_mobile/api/client.dart';
import 'package:guidpro_mobile/helpers/helper.dart';
import 'package:guidpro_mobile/models/article.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleShow extends StatelessWidget {
  final Advice advice;

  ArticleShow({required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(advice.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(advice.coverUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
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
                      Text(
                        advice.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Budget : " + advice.budget.toString() + " XOF",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Categorie : Agriculture",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InfoCard(
                    icon: Icons.remove_red_eye,
                    value: "12",
                    label: "Vues",
                  ),
                  InfoCard(
                    icon: Icons.star,
                    value: "4.5/5",
                    label: "Note",
                  ),
                  LikeableInfoCard(
                    icon: Icons.thumb_up,
                    label: "Likes",
                    initialValue: 12,
                  ),
                  InfoCard(
                    icon: Icons.comment,
                    value: "12",
                    label: "Comment",
                  ),
                  InfoCard(
                    icon: Icons.date_range,
                    value: convertToLocalDate(advice.publishedAt),
                    label: "Publié le",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                advice.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sections',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...advice.sections
                .map((section) => CollapsibleSection(
                      title: "Titre : " + section.title,
                      content: section.content,
                    ))
                .toList(),
            Divider(),
            AdviserInfo(
              adviserName: "Jean",
              adviserRole: "Conseiller en Agriculture",
              adviserContact: "d"
            ),
            CommentSection(comments: [
              Comment(
                username: "Jean",
                rating: 4.5,
                comment: "Très utile et bien expliqué!",
              ),
              Comment(
                username: "Fatima",
                rating: 4.0,
                comment: "Bon article, mais quelques points pourraient être améliorés.",
              ),
            ]),
            Composer(), // Composer widget here
          ],
        ),
      ),
    );
  }
}

class Composer extends StatelessWidget {
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              _rating = rating;
            },
          ),
          SizedBox(height: 8),
          TextField(
            controller: _commentController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Laissez un commentaire...",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Handle the submission of the comment and rating
              String comment = _commentController.text;
              
              if (comment.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Veuillez entrer un commentaire."),
                  ),
                );
                return;
              }
              // Submit the comment and rating (_rating) to the backend or API
            },
            child: Text("Soumettre"),
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  CommentSection({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Commentaires",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ...comments.map((comment) => CommentWidget(comment: comment)).toList(),
        ],
      ),
    );
  }
}

class Comment {
  final String username;
  final double rating;
  final String comment;

  Comment({
    required this.username,
    required this.rating,
    required this.comment,
  });
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  comment.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 8),
                RatingBarIndicator(
                  rating: comment.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              comment.comment,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  InfoCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Color.fromARGB(255, 18, 163, 93), size: 24),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollapsibleSection extends StatefulWidget {
  final String title;
  final String content;

  CollapsibleSection({required this.title, required this.content});

  @override
  _CollapsibleSectionState createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: HtmlWidget(
                widget.content,
              ),
            ),
        ],
      ),
    );
  }
}




class LikeableInfoCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final int initialValue;

  LikeableInfoCard({
    required this.icon,
    required this.label,
    required this.initialValue,
  });

  @override
  _LikeableInfoCardState createState() => _LikeableInfoCardState();
}

class _LikeableInfoCardState extends State<LikeableInfoCard> {
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.initialValue;
  }

  void _incrementLikes() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _incrementLikes,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Color.fromARGB(255, 18, 163, 93), size: 24),
              SizedBox(height: 8),
              Text(
                likes.toString(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdviserInfo extends StatefulWidget {
  final String adviserName;
  final String adviserRole;
  final String adviserContact;

  AdviserInfo({
    required this.adviserName,
    required this.adviserRole,
    required this.adviserContact,
  });

  @override
  _AdviserInfoState createState() => _AdviserInfoState();
}

class _AdviserInfoState extends State<AdviserInfo> {
  bool _isExpanded = false;
  bool _showConsultationForm = false;
  final TextEditingController _consultationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        color: _isExpanded ? Colors.white : Colors.grey[300], // Change background color based on expansion state
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Information du Conseiller',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              trailing: IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nom: ${widget.adviserName}'),
                    SizedBox(height: 4),
                    Text('Cabinet: EXPOTEC (Coopérative)'),
                    SizedBox(height: 4),
                    Text("Domaine d'expertise: Agriculture - agriculture durable"),
                    Text('Adresse: Ouagadougou, Burkina Faso'),
                    SizedBox(height: 4),
                    Text('Contact: +226 70 00 00 00'),
                    SizedBox(height: 4),
                    Text('Email: expo@tec.com'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showConsultationForm = !_showConsultationForm;
                        });
                      },
                      child: Text('Demande de consultation'),
                    ),
                    if (_showConsultationForm) ...[
                      SizedBox(height: 16),
                      TextField(
                        controller: _consultationController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Entrez le motif de consultation...",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showConsultationForm = false;
                                _consultationController.clear();
                              });
                            },
                            child: Text('Annuler'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String motif = _consultationController.text;
                              if (motif.isNotEmpty) {
                                print('Motif de consultation: $motif');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Demande envoyée')),
                                );
                                setState(() {
                                  _showConsultationForm = false;
                                  _consultationController.clear();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Veuillez entrer un motif')),
                                );
                              }
                            },
                            child: Text('Envoyer'),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

