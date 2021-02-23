import 'package:avocado_questions/data/txt_parser_to_object.dart';
import 'package:avocado_questions/presentation/category_details/CategoryDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(//return LayoutBuilder
        builder: (context, constraints) {
      return OrientationBuilder(//return OrientationBuilder
          builder: (context, orientation) {
        //initialize SizerUtil()
        SizerUtil().init(constraints, orientation); //initialize SizerUtil

        return MaterialApp(
          title: '🥑 Питання Авокадо 🥑',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.amberAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.robotoMonoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: MyHomePage(title: '🥑 Питання авокадо 🥑'),
        );
      });
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildCategoriesList(),
      floatingActionButton: buildFab(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.favorite_border_outlined),
    );
  }

  buildCategoriesList() {
    var childhood = "🏀 Детство";
    var friends = "👨‍👩‍👦‍👦 Семья и друзья";
    var freeTime = "🚴‍♀ ️Досуг";

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        buildCard(childhood),
        buildCard(friends),
        buildCard(freeTime),
      ],
    );
  }

  buildCard(String categoryName) {
    return InkWell(
      onTap: () => goToCategoryPage(categoryName),
      child: Card(
        child: Column(
          children: [
            Image.network(
                "https://images.unsplash.com/photo-1519038983316-43241d5d7b61?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80"),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: textStyleListItem(),
            )
          ],
        ),
      ),
    );

    return Card(
      color: Colors.grey[200],
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Image.network(
              "https://images.unsplash.com/photo-1519038983316-43241d5d7b61?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80"),
          subtitle: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: textStyleListItem(),
          ),
          onTap: () => goToCategoryPage(categoryName),
        ),
      ),
    );
  }

  goToCategoryPage(String category) {
    print("GOGOGOGOGOG");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryDetailsPage(category)),
    );
  }
}
