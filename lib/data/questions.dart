import 'package:flutter/material.dart';

class Question {
  String questionContent = "";
  final bool wasItRead = false;

  Question(this.questionContent);
}

class QuestionDatabase {
  static List<Question> getQuestionByCategory(String category) {
    return List.from([
      Question("1. Где ты родился?"),
      Question("2. Где ты вырос?"),
      Question("3. В какую школу ты ходил?"),
    ]);
  }
}

class ColorConverter {
  static hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return MaterialColor(int.parse(hexColor, radix: 16), {});
  }
}
