import 'package:avocado_questions/data/questions.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String category;

  CategoryDetailsPage(this.category);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildQuestionsList(),
      floatingActionButton: buildFavoritesFab(),
    );
  }

  FloatingActionButton buildFavoritesFab() {
    return FloatingActionButton(
      child: Icon(Icons.favorite_border_outlined),
      onPressed: () {},
    );
  }

  Padding buildQuestionsList() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: QuestionDatabase.getQuestionByCategoryReal("category"),
            builder:
                (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
              if (!snapshot.hasData) return buildCircularProgressIndicator();
              return buildList(snapshot.data);
            }));
  }

  buildCircularProgressIndicator() => Center(child: CircularProgressIndicator());

  AppBar buildAppBar() => AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(widget.category,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)));

  buildList(List<Question> data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return buildListItem(index, data[index]);
        },
      );

  buildListItem(int index, Question data) => Card(
          child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Text(
          "${data.questionContent}",
          style: textStyleListItem(),
        ),
      ));
}

TextStyle textStyleListItem() => TextStyle(fontSize: 20);
