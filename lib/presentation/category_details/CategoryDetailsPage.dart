import 'package:avocado_questions/data/questions.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatefulWidget {
  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  // TODO: change category name to real one
  List<Question> questionsList =
      QuestionDatabase.getQuestionByCategory("some category");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
      ),
    );
  }

  buildList() => ListView.builder(
        itemCount: questionsList.length,
        itemBuilder: (context, index) {
          return buildListItem(index);
        },
      );

  buildListItem(int index) => Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "${questionsList[index].questionContent}",
          style: textStyleListItem(),
        ),
      ));
}

TextStyle textStyleListItem() => TextStyle(fontSize: 20);
