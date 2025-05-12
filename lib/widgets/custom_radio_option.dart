import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomRadioOption extends StatelessWidget {
  final String text;
  final bool selected;

  const CustomRadioOption({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? AppColors.lightPurple : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? Colors.white : AppColors.darkText,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.darkText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
