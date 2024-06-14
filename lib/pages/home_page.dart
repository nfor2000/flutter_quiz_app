import 'package:flutter/material.dart';
import 'package:mb_quiz/constants/colors.dart';
import 'package:mb_quiz/pages/level_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameEditing = TextEditingController();
   void _login() {
    if (_formKey.currentState!.validate()) {
      // Add your authentication logic here
      // For simplicity, let's assume the login is successful
      Navigator.push(
       context, MaterialPageRoute(builder: (context) => LevelPage(user: name))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: decorationImage
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset('images/logo.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Mob",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: accentColor),
                  ),
                   Text(
                    "ile Quiz App",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: accentColor),
                  )
                ],
              ),
              
              Text(
                "Enter your name to get started",
                style: TextStyle(fontSize: 16, color: white),
              ),
              const SizedBox(
                height: 20,
              ),
        
        
              Form(
                key: _formKey,
                child: SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white), // Set text color to accentColor
                    textAlignVertical:
                        TextAlignVertical.center, 
                    cursorColor: accentColor,// Align text vertically center
                    decoration: InputDecoration(
                      
                      hintText: "e.g. Adam Smith",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: TextStyle(color: textColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      
                     focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return "Field is empty";
                      }
                      return null;
                    },
                  
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    controller: nameEditing,
                  ),
                ),
              ),
        
        
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: _login,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: accentColor, borderRadius: BorderRadius.circular(10)),
                  child:Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(color: white, fontSize: 18),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
        
        
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By clicking ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'continue',
                      style: TextStyle(color: accentColor),
                    ),
                    TextSpan(
                      text: ', you agree to our ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: accentColor),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: accentColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
