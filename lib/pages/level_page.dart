import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mb_quiz/components/level_tile.dart';
import 'package:mb_quiz/constants/colors.dart';
import 'package:mb_quiz/pages/questions_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});


  @override
  Widget build(BuildContext context) {
    String getCategory(int value){
      return value == 0? "Beginner":value == 1? "Junior":value == 2? "Intermediate":"Advanced";
    }
    const List<List<Color>> colors = [
      [Color.fromARGB(255, 105, 13, 179), Color.fromARGB(255, 124, 149, 249)],
      [Color.fromARGB(255, 247, 157, 1), Color.fromARGB(255, 245, 71, 51)],
      [Color.fromARGB(255, 154, 66, 226), Color.fromARGB(255, 124, 149, 249)],
      [Color.fromARGB(255, 247, 97, 97), Color.fromARGB(255, 133, 156, 245)],
    ];
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(color: mainColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose level",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 25,
                  color: white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Select an option below to start the quiz",
              style: TextStyle(
                  fontSize: 16, color: accentColor),
            ),

            const SizedBox(height: 50,),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: ListView.builder(
                  itemCount: colors.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage(category: getCategory(index),)));
                    },
                    child: LevelTile(
                        level: getCategory(index),gradient: colors[index],
                      ),
                  )),
            )
          ),
          ],
        ),
      ),
    );
  }
}
