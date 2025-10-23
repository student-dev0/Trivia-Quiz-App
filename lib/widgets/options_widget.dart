import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsWidget extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;
  const OptionsWidget({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenFontSizeO = MediaQuery.of(context).size.width * 0.04;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.05 : 1.0,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFEFF2F1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
              width: isSelected ? 0.8 : 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  option,
                  style: GoogleFonts.nunitoSans(fontSize: screenFontSizeO),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.deepPurpleAccent : Colors.grey,
                    width: 2,
                  ),
                  color: isSelected ? Colors.deepPurple : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
