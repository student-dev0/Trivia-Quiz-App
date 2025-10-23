import 'package:flutter/material.dart';
import 'package:trivia_quiz/Utils/questions_options.dart';
import 'package:trivia_quiz/screens/result_screen.dart';
import 'package:trivia_quiz/widgets/time_countdown.dart';
import 'package:trivia_quiz/widgets/options_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreenState extends StatefulWidget {
  const QuizScreenState({super.key});

  @override
  State<QuizScreenState> createState() => _QuizScreenStateState();
}

class _QuizScreenStateState extends State<QuizScreenState> {
  int currentQuestion = 0;
  Map<int, String> userAnswers = {};

  void selectedAnswer(String answer) {
    setState(() {
      userAnswers[currentQuestion] = answer;
    });
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
    }
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pushReplacement(
        context, // Consider passing quiz results to ResultScreen
        MaterialPageRoute(
          builder: (_) =>
              ResultScreen(questions: questions, userAnswers: userAnswers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final current =
        questions[currentQuestion]; // Corrected access to the questions list
    final screenFontSize =
        MediaQuery.of(context).size.width * 0.05; //  The Font size for question

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.only(left: 12, top: 4, bottom: 4, right: 4),
          decoration: BoxDecoration(
            color: Color(0xFFBCA4E3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Icon(Icons.av_timer_outlined),
                TimeCountdown(
                  key: ValueKey(currentQuestion),
                  seconds: 20,
                  onTimeUp: nextQuestion,
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.1 * (currentQuestion + 1),
              backgroundColor: Colors.grey.shade200,
              color: Colors.deepPurpleAccent,
              minHeight: 4,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Question ${currentQuestion + 1} of ${questions.length}",
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              current.question,
              style: GoogleFonts.quicksand(
                fontSize: screenFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            ...List.generate(current.options.length, (index) {
              final option = current.options[index];
              return OptionsWidget(
                option: option,
                isSelected: userAnswers[currentQuestion] == option,
                onTap: () => selectedAnswer(option),
              );
            }),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: previousQuestion,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: nextQuestion,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
