import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mb_quiz/components/button.dart';
import 'package:mb_quiz/components/text_tile.dart';
import 'package:mb_quiz/constants/colors.dart';

class ResultPage extends StatelessWidget {
  final int questionCount;
  final int correct;
  final int wrong;

  const ResultPage({super.key, required this.questionCount, required this.correct, required this.wrong, });
  
  String getComment(double score){
    var comment = "";
    if(score < 50){
      comment = "Oops try again";
    }else if(score < 60){
      comment = "Good";
    }else if(score < 80){
      comment = "Very Good";
    }else{
      comment = "Excellent";
    }
    return comment;
  }
  @override
  Widget build(BuildContext context) {
    
    final score =(correct/questionCount * 100).roundToDouble();
    final screen = MediaQuery.of(context).size;
    final imageUrl = score < 50? 'images/crying.png':score < 80?'images/thumbs-up.png':'images/trophy.png';
    return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: decorationImage
              ),
              child: Center(
                      child: Stack(
                        children: [
              Container(
                width:screen.width,
                height: screen.height,
                color: Colors.transparent,
                child: Column(children: [
                  const SizedBox(height: 40,),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Quiz ", style: GoogleFonts.dmSerifDisplay(fontSize: 28, color: white, fontWeight: FontWeight.bold)),
                          TextSpan(text: "Summary", style: GoogleFonts.dmSerifDisplay(fontSize: 28, color: accentColor, fontWeight: FontWeight.bold))
                        ]
                      )
                    ),
                  ),
              
                ],),
              ),
              
              
              Positioned(
                top: screen.height/2,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  height: screen.height/2,
                  width: screen.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -150,
                        left: 0,
                        child: Container(
                          width: screen.width - 50,
                          height: 250,
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: const [BoxShadow(spreadRadius: 4, color: Color.fromARGB(123, 158, 158, 158), offset: Offset(0, 5), blurRadius: 50)],
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -100,
                                left: screen.width/2 - 125,
                                child: Image.asset(imageUrl, height: 200, width: 200,)
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                   TextInter(text: getComment(score),color: mainColor, fontSize: 24, fontWeight:  FontWeight.bold),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: "You've scrored ", style: GoogleFonts.inter(fontSize: 18,color: textColor)),
                                  TextSpan(text: "$score", style: GoogleFonts.inter(fontSize: 18,color: accentColor)),
                                  TextSpan(text: " points", style: GoogleFonts.inter(fontSize: 18,color: textColor))
                                ])
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                shape: BoxShape.circle
                                              ),
                                              child: Icon(Icons.add, color: white,),
                                            ),
                                            const SizedBox(width: 5,),
                                            Text("$questionCount", style: GoogleFonts.inter(color: mainColor, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Text("Total questions", style: GoogleFonts.inter(color: textColor),)
                                      ],
                                    ),
                                      
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: successColor,
                                                shape: BoxShape.circle
                                              ),
                                              child: Icon(Icons.check, color: white,),
                                            ),
                                            const SizedBox(width: 5,),
                                            Text("$correct", style: GoogleFonts.inter(color: successColor, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Text("Correct", style: GoogleFonts.inter(color: textColor),)
                                      ],
                                    ),
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: dangerColor,
                                                shape: BoxShape.circle
                                              ),
                                              child: Icon(Icons.clear, color: white,),
                                            ),
                                            const SizedBox(width: 5,),
                                            Text("$wrong", style: GoogleFonts.inter(color: dangerColor, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Text("Wrong", style: GoogleFonts.inter(color: textColor),)
                                      ],
                                    )
                                  
                                  ,
                                 
                                  
                                  ],
                                ),
                              )
                          
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                   ,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Button(text: "Restart", press: () {Navigator.pop(context);},color: Colors.blue,),
                          const SizedBox(height: 20,),
                          Button(text: "Go Home", press: () {Navigator.pop(context);Navigator.pop(context);},color: Colors.blue,),
                        ],
                      )
                    ],
                  ),
                ),
              )
                        ],
                      ),
                    ),
            ),
    );
}
}