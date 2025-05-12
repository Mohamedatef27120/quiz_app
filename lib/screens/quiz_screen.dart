import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/questions.dart';
import '../models/question_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox_option.dart';
import '../widgets/custom_radio_option.dart';
import 'thank_you_screen.dart';
import '../widgets/app_background.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;

  int? selectedRadio;
  List<bool> selectedCheckbox = [];

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedRadio = null;
        selectedCheckbox =
            List.filled(questions[currentIndex].options.length, false);
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ThankYouScreen()),
      );
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedRadio = null;
        selectedCheckbox =
            List.filled(questions[currentIndex].options.length, false);
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    selectedCheckbox = List.filled(questions[0].options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Question ${currentIndex + 1}',
                    style: const TextStyle(color: AppColors.darkText),
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  question.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 30),

                ...List.generate(question.options.length, (index) {
                  if (question.type == QuestionType.single) {
                    return GestureDetector(
                      onTap: () =>
                          setState(() => selectedRadio = index),
                      child: CustomRadioOption(
                        text: question.options[index],
                        selected: selectedRadio == index,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () => setState(() =>
                      selectedCheckbox[index] = !selectedCheckbox[index]),
                      child: CustomCheckboxOption(
                        text: question.options[index],
                        selected: selectedCheckbox[index],
                      ),
                    );
                  }
                }),

                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child:
                      CustomButton(text: 'Back', onPressed: prevQuestion),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child:
                      CustomButton(text: 'Next', onPressed: nextQuestion),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
