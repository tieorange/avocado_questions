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
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(),
          FutureBuilder(
              future: QuestionDatabase.getQuestionByCategoryReal("category"),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Question>> snapshot) {
                // if (!snapshot.hasData) return buildCircularProgressIndicator();
                return  buildSliverList(snapshot.data);
              })
        ],
      ),
    );

    return Scaffold(
      appBar: buildAppBar(),
      body: buildQuestionsList(),
      floatingActionButton: buildFavoritesFab(),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
          // Provide a standard title.
          title: Text("title"),
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: Placeholder(),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 200,
        );
  }

  SliverList buildSliverList(List<Question> data) {
    return SliverList(
      // Use a delegate to build items as they're scrolled on screen.
      delegate: SliverChildBuilderDelegate(
        // The builder function returns a ListTile with a title that
        // displays the index of the current item.
        (context, index) => buildListItem(index, data[index]),
        // Builds 1000 ListTiles
        childCount: data.length,
      ),
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

  buildCircularProgressIndicator() =>
      Center(child: CircularProgressIndicator());

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
