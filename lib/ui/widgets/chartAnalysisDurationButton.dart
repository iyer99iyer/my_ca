// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ca/ui/shared/styles.dart';

class ChartAnalysisDurationButton extends StatelessWidget {
  final String buttonTitle;
  final bool selected;
  final Function() onTap;

  const ChartAnalysisDurationButton({
    Key? key,
    required this.buttonTitle,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonTitle,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          color: selected ? kcPrimaryColor : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
