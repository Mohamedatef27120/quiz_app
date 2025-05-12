import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox_option.dart';
import 'thank_you_screen.dart';
import 'question_single_screen.dart';

class QuestionMultiScreen extends StatefulWidget {
  const QuestionMultiScreen({super.key});

  @override
  State<QuestionMultiScreen> createState() => _QuestionMultiScreenState();
}

class _QuestionMultiScreenState extends State<QuestionMultiScreen> {
  final List<String> options = ['Vitamin D3', 'Vitamin B', 'Zinc', 'Magnesium'];
  final List<bool> selectedStates = [true, false, true, false];

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
                'Question 3',
                style: TextStyle(color: AppColors.darkText),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'What vitamins do you take?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ...List.generate(
              options.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStates[index] = !selectedStates[index];
                  });
                },
                child: CustomCheckboxOption(
                  text: options[index],
                  selected: selectedStates[index],
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
                          builder: (_) => const ThankYouScreen(),
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
