import 'package:flutter/material.dart';
import 'package:mb_quiz/constants/colors.dart';

class AnswerTile extends StatelessWidget {
  final int? currentIndex;
  final String answer;
  final bool isSelected;
  final int? selectedAnswerIndex;
  final int? correctAnswerIndex;
  const AnswerTile({
    super.key,
    required this.currentIndex,
    required this.answer,
    required this.isSelected,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
  });

  Widget buildCorrectIcon() => CircleAvatar(
    radius: 15,
    backgroundColor: successColor,
    child: Icon(Icons.check, color: white,),
  );


  Widget buildWrongIcon() => CircleAvatar(
    radius: 12,
    backgroundColor: dangerColor,
    child: Icon(Icons.clear, color: white,),
  );

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return selectedAnswerIndex != null? Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 50,
      decoration: BoxDecoration(
        color: white,
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Color.fromARGB(100, 158, 158, 158)),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isCorrectAnswer?successColor:isWrongAnswer?dangerColor:white)
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            answer,
            style: TextStyle(
                color: mainColor, fontSize: 18, fontWeight: FontWeight.w600),
          )),
          const SizedBox( width: 10,),
          isCorrectAnswer? buildCorrectIcon():isWrongAnswer?buildWrongIcon():const SizedBox.shrink(),

        ],
      ),
    ):Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 50,
      decoration: BoxDecoration(
        color: white,
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Color.fromARGB(100, 158, 158, 158)),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color:white)
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            answer,
            style: TextStyle(
                color: mainColor, fontSize: 18, fontWeight: FontWeight.w600),
          )),

        ],
      ),
    );
  }
}
