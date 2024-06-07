
import 'package:mb_quiz/models/question.dart';

List<Question> questions = [

Question(
    question: "What is the main programming language used for Android app development?",
    options: ["A. Java", "B. Python", "C. Swift", "D. Kotlin"],
    correctAnswerIndex: 3,
    category: "Beginner",
  ),

  Question(
    question: "Which component is responsible for laying out the user interface in Android?",
    options: ["A. Activity", "B. Fragment", "C. Layout", "D. Intent"],
    correctAnswerIndex: 2,
    category: "Beginner",
  ),

  Question(
    question: "What is an APK in Android?",
    options: ["A. Android Package", "B. Android Kernel", "C. Android Project", "D. Android Library"],
    correctAnswerIndex: 0,
    category: "Beginner",
  ),

  Question(
    question: "What is the purpose of ProGuard in Android?",
    options: ["A. Code obfuscation", "B. Memory management", "C. Multithreading", "D. Layout rendering"],
    correctAnswerIndex: 0,
    category: "Beginner",
  ),

  // Junior Category
  Question(
    question: "What is the purpose of a RecyclerView in Android?",
    options: ["A. Display images", "B. Play videos", "C. Handle user input", "D. Display lists"],
    correctAnswerIndex: 3,
    category: "Junior",
  ),

  Question(
    question: "What is the purpose of an Intent in Android?",
    options: ["A. Handle network requests", "B. Start a service", "C. Exchange data between components", "D. Authenticate users"],
    correctAnswerIndex: 2,
    category: "Junior",
  ),

  Question(
    question: "What is an Activity in Android?",
    options: ["A. A user interface element", "B. A background service", "C. An application component", "D. A data storage mechanism"],
    correctAnswerIndex: 2,
    category: "Junior",
  ),

  Question(
    question: "What is the purpose of Gradle in Android development?",
    options: ["A. To write UI code", "B. To manage project dependencies", "C. To test the application", "D. To handle background tasks"],
    correctAnswerIndex: 1,
    category: "Junior",
  ),

  // Intermediate Category
  Question(
    question: "What is the purpose of the ViewModel in Android Architecture Components?",
    options: ["A. Manage user authentication", "B. Handle database operations", "C. Store UI-related data", "D. Perform network requests"],
    correctAnswerIndex: 2,
    category: "Intermediate",
  ),

  Question(
    question: "What is the purpose of LiveData in Android Architecture Components?",
    options: ["A. Manage background threads", "B. Handle navigation between screens", "C. Observe and react to data changes", "D. Perform encryption"],
    correctAnswerIndex: 2,
    category: "Intermediate",
  ),

  Question(
    question: "What is the purpose of Fragments in Android?",
    options: ["A. Manage data persistence", "B. Handle background tasks", "C. Manage application permissions", "D. Create reusable UI components"],
    correctAnswerIndex: 3,
    category: "Intermediate",
  ),

  Question(
    question: "What is the purpose of the SQLiteDatabase class in Android?",
    options: ["A. To manage device storage", "B. To handle network communication", "C. To interact with a SQLite database", "D. To render UI components"],
    correctAnswerIndex: 2,
    category: "Intermediate",
  ),

  // Advanced Category
  Question(
    question: "What is the purpose of the ContentProvider in Android?",
    options: ["A. To manage application resources", "B. To handle background tasks", "C. To share data between applications", "D. To handle user authentication"],
    correctAnswerIndex: 2,
    category: "Advanced",
  ),

  Question(
    question: "What is the purpose of the Retrofit library in Android?",
    options: ["A. To handle UI layout", "B. To perform network requests", "C. To manage device permissions", "D. To handle database operations"],
    correctAnswerIndex: 1,
    category: "Advanced",
  ),

  Question(
    question: "What is the purpose of the ConstraintLayout in Android?",
    options: ["A. To handle device orientation changes", "B. To manage application resources", "C. To create responsive user interfaces", "D. To handle background tasks"],
    correctAnswerIndex: 2,
    category: "Advanced",
  ),

  
  Question(
    question: "What is the purpose of the ViewModelProvider in Android?",
    options: ["A. To manage user authentication", "B. To handle database operations", "C. To store UI-related data", "D. To perform network requests"],
    correctAnswerIndex: 2,
    category: "Advanced",
  ),

  Question(
    question: "What is the purpose of the WorkManager in Android?",
    options: ["A. To handle network requests", "B. To manage background tasks", "C. To navigate between screens", "D. To encrypt data"],
    correctAnswerIndex: 1,
    category: "Advanced",
  ),

  Question(
    question: "What is the purpose of the Room library in Android?",
    options: ["A. To handle UI layout", "B. To perform network requests", "C. To manage device permissions", "D. To handle database operations"],
    correctAnswerIndex: 3,
    category: "Advanced",
  )
];
