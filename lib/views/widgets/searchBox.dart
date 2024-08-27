import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String hintText;

  SearchBox({required this.onSearchChanged, this.hintText = 'Rechercher un métier, une formation, un article...'});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.black),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: widget.onSearchChanged,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Elevage'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Culture de céréales'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Culture de légumes'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Culture de matières premières'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
