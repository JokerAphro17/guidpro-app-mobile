import 'package:flutter/material.dart';
import 'package:guidpro_mobile/models/article.dart';



class AdviceController extends ChangeNotifier {
  List<Advice> _advices = [];

  List<Advice> get advices => _advices;

  void addAdvice(Advice advice) {
    _advices.add(advice);
    notifyListeners();
  }

  void removeAdvice(String id) {
    _advices.removeWhere((advice) => advice.id == id);
    notifyListeners();
  }

  void updateAdvice(Advice updatedAdvice) {
    final index = _advices.indexWhere((advice) => advice.id == updatedAdvice.id);
    if (index != -1) {
      _advices[index] = updatedAdvice;
      notifyListeners();
    }
  }
}
