import 'package:avocado_questions/presentation/category_details/CategoryDetailsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '🥑 Питання авокадо 🥑'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
      title: Text(widget.title),
    );
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.favorite),
    );
  }

  buildCategoriesList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Card(
          child: ListTile(
            title: Text(
              "🏀 Детство",
              style: textStyleListItem(),
            ),
            onTap: () => goToCategoryPage(),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "👨‍👩‍👦‍👦 Семья и друзья",
              style: textStyleListItem(),
            ),
            onTap: () => goToCategoryPage(),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "🚴‍♀️Досуг",
              style: textStyleListItem(),
            ),
            onTap: () => goToCategoryPage(),
          ),
        ),
      ]),
    );
  }

  goToCategoryPage() {
    print("GOGOGOGOGOG");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryDetailsPage()),
    );
  }
}
