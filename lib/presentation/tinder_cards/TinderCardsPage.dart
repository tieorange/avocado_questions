import 'package:avocado_questions/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class TinderCardsPage extends StatefulWidget {
  @override
  _TinderCardsPageState createState() => _TinderCardsPageState();
}

class _TinderCardsPageState extends State<TinderCardsPage> {
  Widget cardContent(Question data) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        data.questionContent,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w900),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // TODO mock
      future: QuestionDatabase.getQuestionByCategoryReal("category"),
      builder: (context, AsyncSnapshot<List<Question>> snapshot) {
        if (snapshot.hasData)
          return content(snapshot.data!);
        else
          return loader();
      },
    );
  }

  Center loader() => Center(child: CircularProgressIndicator());

  Widget content(List<Question> data) => Container(
        child: Center(
          child: TCard(
            size: Size(400, 600),
            cards: List.generate(
              data.length,
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
                    child: cardContent(data[index]),
                  ),
                );
              },
            ),
          ),
        ),
      );
}
