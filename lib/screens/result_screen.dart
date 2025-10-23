import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz/Utils/questions_options.dart';
import 'package:trivia_quiz/widgets/quiz_screen_state.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, String> userAnswers;

  const ResultScreen({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final screenFontSize = MediaQuery.of(context).size.width * 0.05;
    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.restart_alt, size: 30,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => QuizScreenState()),
            );
          },
        ),
        title: Text("Quiz Result"),
        actions: [],
      ),

      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswer = userAnswers[index];
          final isCorrect =
              userAnswer ==
              question.correctAnswer; // Can be null if no answer was selected
          return Card(
            color:const Color.fromARGB(255, 154, 95, 180),
            margin: EdgeInsets.all(12),
            child: ListTile(
              title: Text(
                question.question,
                style: GoogleFonts.quicksand(
                  fontSize: screenFontSize,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Your answer: ${userAnswer ?? 'Not Answered'}",
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Correct answer: ${question.correctAnswer}",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Your Score : $score / ${questions.length}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
