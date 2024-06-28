import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidpro_mobile/constants/Theme.dart';



class SearchBox extends StatelessWidget {

  final TextEditingController searchController = TextEditingController();

 final String hintText = 'Rechercher un metier, une formation, un article...';
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    
                    
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


// range price filter
class RangePriceFilter extends StatefulWidget {
  @override
  _RangePriceFilterState createState() => _RangePriceFilterState();
}

class _RangePriceFilterState extends State<RangePriceFilter> {
  double _lowerValue = 0;
  double _upperValue = 1000000;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Prix: '),
        Text('$_lowerValue - $_upperValue'),
        RangeSlider(
          values: RangeValues(_lowerValue, _upperValue),
          min: 0,
          max: 1000000,
          divisions: 1000,
          labels: RangeLabels('$_lowerValue k CFA', '$_upperValue k CFA'),
          onChanged: (RangeValues values) {
            setState(() {
              _lowerValue = values.start;
              _upperValue = values.end;
            });
          },
        ),
      ],
    );
  }
}

