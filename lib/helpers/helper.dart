



// fucntion to convert to local date 
String convertToLocalDate(String date) {
  final d =  DateTime.parse(date).toLocal().toString().split(' ')[0];
  return frenchDate(d);


}

// french date format
String frenchDate(String date) {
  return date.split('-').reversed.join('/');
}


// convert to frensh 
