import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ca/ui/shared/ui_helpers.dart';

class RecurringButtons extends StatelessWidget {

  final String buttonTitle;
  final Color? color;
  final Color? circleColor;
  final Function(int x) onTap;
  final int index;

  const RecurringButtons({
    Key? key, required this.buttonTitle, this.color, required this.onTap, required this.index, this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(index),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              child: CircleAvatar(
                  backgroundColor:circleColor ?? Colors.white,
                  maxRadius: 8
              ),
              backgroundColor:Colors.black,
              maxRadius: 10,
            ),
            horizontalSpaceTiny,
            Text(
              buttonTitle,style:
            GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22
            ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: color??Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}