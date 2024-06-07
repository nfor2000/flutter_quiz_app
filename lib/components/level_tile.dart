import 'package:flutter/material.dart';


class LevelTile extends StatelessWidget {
  final String level ;
  final List<Color> gradient;
  const LevelTile({super.key, required this.level, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient, begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(level, style: const TextStyle(color: Colors.white, fontSize: 18,),),
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(color: Colors.blue, width: 2)
                  ),
                ),
                const SizedBox(width: 10,),
                const Text.rich(
                  TextSpan(

                  children: [
                    TextSpan(text:"Your highest score is ", style: TextStyle(color: Colors.grey),),
                    TextSpan(text: "40", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    TextSpan(text: " points ", style: TextStyle(color: Colors.grey),),
                  ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  
}