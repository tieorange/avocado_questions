import 'package:avocado_questions/data/questions.dart';
import 'package:flutter/services.dart' show rootBundle;


class TxtParser{
    static Future<String> parseQuestions(String category) async {
      return await rootBundle.loadString("assets/questions.txt");
    }

    static Future<List<Question>> textToObject(String category) async {
      var text = await parseQuestions(category);

      var splittedText = text.split("\n");
      splittedText.retainWhere((element) => element.isNotEmpty);


      var list = splittedText.map((e) => Question(e)).toList();
      print(list.toString());
      return list;
    }
}