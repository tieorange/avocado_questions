import 'package:avocado_questions/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class TinderCardsPage extends StatefulWidget {
  @override
  _TinderCardsPageState createState() => _TinderCardsPageState();
}

class _TinderCardsPageState extends State<TinderCardsPage> {
  final List<String> images = [
    'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
    'https://gank.io/images/02eb8ca3297f4931ab64b7ebd7b5b89c',
    'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
    'https://gank.io/images/b0f73f9527694f44b523ff059d8a8841',
    'https://gank.io/images/1af9d69bc60242d7aa2e53125a4586ad',
  ];

  Image cardContent() {
    return Image.network(
      'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // TODO mock
      future: QuestionDatabase.getQuestionByCategoryReal("category"),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return content();
        else
          return loader();
      },
    );
  }

  Center loader() => Center(child: CircularProgressIndicator());

  Widget content() => Container(
        child: TCard(
          size: Size(400, 600),
          cards: List.generate(
            50,
            (int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23.0,
                      spreadRadius: -13.0,
                      color: Colors.black54,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: cardContent(),
                ),
              );
            },
          ),
        ),
      );
}
