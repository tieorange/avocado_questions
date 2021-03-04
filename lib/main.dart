import 'package:avocado_questions/data/questions.dart';
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
            textTheme: GoogleFonts.comfortaaTextTheme(
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalKey theKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: theKey,
      appBar: buildAppBar(),
      body: buildCategoriesList(),
      floatingActionButton: buildFab(context),
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

  FloatingActionButton buildFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
              'We are working hard on this button. Still not working :( ;( :( ((((('),
        ));
      },
      child: Icon(Icons.favorite_border_outlined),
    );
  }

  buildCategoriesList() {
    var childhood = "🏀 Детство";
    var friends = "👨‍👩‍👦‍👦 Семья и друзья";
    var freeTime = "🚴‍♀ ️Досуг";

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        buildCard(childhood),
        buildCard(friends),
        buildCard(freeTime),
      ],
    );
  }

  buildCard(String categoryName) {
    return Card(
      // color: ColorConverter.hexStringToColor("#fdfd96"),
      color: Colors.lightGreen[100],
      child: InkWell(
        onTap: () => goToCategoryPage(categoryName),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                categoryName,
                textAlign: TextAlign.center,
                style: textStyleListItem(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.network(
        "https://images.unsplash.com/photo-1519038983316-43241d5d7b61?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80");
  }

  goToCategoryPage(String category) {
    print("GOGOGOGOGOG");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryDetailsPage(category)),
    );
  }
}
