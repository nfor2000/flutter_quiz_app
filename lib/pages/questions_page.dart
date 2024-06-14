import 'package:flutter/material.dart';
import 'package:mb_quiz/components/answer_tile.dart';
import 'package:mb_quiz/components/button.dart';
import 'package:mb_quiz/components/countdown_timer.dart';
import 'package:mb_quiz/constants/colors.dart';
import 'package:mb_quiz/models/question.dart';
import 'package:mb_quiz/models/questions.dart';
import 'package:mb_quiz/pages/result_page.dart';

class QuestionPage extends StatefulWidget {
  final String? category;
  const QuestionPage({super.key, this.category});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filterQuestions();
    selectedAnswerIndex = null;
  }

  void filterQuestions() {
    filteredQuestions = questions
        .where((question) => question.category == widget.category)
        .toList();
  }

  int? selectedAnswerIndex;
  int questionIndex = 0;
  int correct = 0;
  int wrong = 0;
  int countDownTime = 50;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      correct++;
    } else {
      wrong++;
    }
    setState(() {});
  }

  void goToFinish() {
    int newCorrect = correct;
    int newWrong = wrong;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                questionCount: filteredQuestions.length,
                correct: newCorrect,
                wrong: newWrong)));
    setState(() {
      correct = 0;
      wrong = 0;
      questionIndex = 0;
      selectedAnswerIndex = null;
    });
  }

  void gotToNextQuestion() {
    if (questionIndex < filteredQuestions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
      countDownTime = 50;
    }
    setState(() {});
  }

  void onTimerEnd(int? value) {
    selectedAnswerIndex = value;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = filteredQuestions[questionIndex];

    bool isLastQuestion = questionIndex == filteredQuestions.length - 1;
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            width: screen.width,
            height: screen.height,
            decoration: BoxDecoration(image: decorationImage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Level: ",
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.category,
                            style: TextStyle(
                                color: accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Question ",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "${questionIndex + 1}/${filteredQuestions.length}",
                            style: TextStyle(
                                color: accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screen.height - (screen.height * (2 / 3)),
            child: Container(
              width: screen.width,
              height: screen.height * (2 / 3),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -100,
                    left: 25,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 25),
                      width: screen.width - 50,
                      height: 150,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 2),
                                color: Color.fromARGB(110, 158, 158, 158))
                          ]),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -25,
                              left: screen.width / 2 - 75,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                        correct > 0 ? successColor : mainColor,
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: Offset(0, 2),
                                          color: Color.fromARGB(
                                              100, 158, 158, 158))
                                    ]),
                                child: Center(
                                  child: Text(
                                    "$correct",
                                    style:
                                        TextStyle(color: white, fontSize: 24),
                                  ),
                                ),
                              )),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: question.question,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ])),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 75),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: question.options.length,
                              itemBuilder: (context, index) {
                                final options = question.options;
                                return GestureDetector(
                                    onTap: () {
                                      selectedAnswerIndex == null
                                          ? pickAnswer(index)
                                          : null;
                                    },
                                    child: AnswerTile(
                                      answer: options[index],
                                      isSelected: selectedAnswerIndex == index,
                                      currentIndex: index,
                                      selectedAnswerIndex: selectedAnswerIndex,
                                      correctAnswerIndex:
                                          question.correctAnswerIndex,
                                    ));
                              }),
                        ),
                        Center(
                          child: CountdownTimer(
                              key: ValueKey(questionIndex),
                              duration: countDownTime,
                              onTimerEnd: () {
                                onTimerEnd(question.correctAnswerIndex);
                              }, selectedIndex: selectedAnswerIndex,),
                        ),
                        Container(
                            margin: const EdgeInsets.all(20),
                            child: selectedAnswerIndex != null
                                ? Button(
                                    text: "Next",
                                    press: isLastQuestion
                                        ? goToFinish
                                        : gotToNextQuestion,
                                    color: mainColor,
                                  )
                                : Button(
                                    text: "Next",
                                    press: () {
                                      return;
                                    },
                                    color: textColor,
                                  )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
