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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      child: Icon(Icons.add),
    );
  }

  ListView buildCategoriesList() {
    return ListView(children: [
      ListTile(
        title: Text("Childhood"),
        onTap: () => goToCategoryPage(),
      ),
      ListTile(
        title: Text("Family and friends"),
        onTap: () => goToCategoryPage(),
      ),
      ListTile(
        title: Text("Entertainment"),
        onTap: () => goToCategoryPage(),
      ),
    ]);
  }

  goToCategoryPage() {
    print("GOGOGOGOGOG");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryDetailsPage()),
    );
  }
}


