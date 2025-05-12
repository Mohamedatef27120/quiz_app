import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_radio_option.dart';
import 'question_multi_screen.dart';
import 'start_screen.dart';

class QuestionSingleScreen extends StatefulWidget {
  const QuestionSingleScreen({super.key});

  @override
  State<QuestionSingleScreen> createState() => _QuestionSingleScreenState();
}

class _QuestionSingleScreenState extends State<QuestionSingleScreen> {
  int selectedIndex = 0;

  final List<String> options = [
    'Strongly satisfied',
    'Satisfied',
    'Neutral',
    'Not satisfied',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Question 1',
                style: TextStyle(color: AppColors.darkText),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'How would you describe your level of satisfaction with the healthcare system?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ...List.generate(
              options.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: CustomRadioOption(
                  text: options[index],
                  selected: selectedIndex == index,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QuestionMultiScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
