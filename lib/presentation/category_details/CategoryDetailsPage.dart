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
                if (!snapshot.hasData) return buildSliverList([]);
                return buildSliverList(snapshot.data);
              })
        ],
      ),
      floatingActionButton: buildFavoritesFab(),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      // Provide a standard title.
      title: buildTitleAppBar(),
      // Allows the user to reveal the app bar if they begin scrolling
      // back up the list of items.
      floating: true,
      // Display a placeholder widget to visualize the shrinking size.
      flexibleSpace: Image.network(
        "https://images.unsplash.com/photo-1579763863374-132c0184f2aa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2646&q=80",
        fit: BoxFit.fill,
      ),
      // Make the initial height of the SliverAppBar larger than normal.
      expandedHeight: 230,
    );
  }

  DecoratedBox buildTitleAppBar() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.category, style: TextStyle(color: Colors.white)),
        ));
  }

  SliverList buildSliverList(List<Question> data) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildListItem(index, data[index]),
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

  buildListItem(int index, Question data) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
            child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            "${data.questionContent}",
            style: textStyleListItem(),
          ),
        )),
  );
}

TextStyle textStyleListItem() => TextStyle(fontSize: 20);
