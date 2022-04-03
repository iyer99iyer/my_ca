import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeButton extends StatelessWidget {

  final String buttonName;
  final Color? color;
  final Function(int x) onTap;
  final int position;

  const TypeButton({
    Key? key, required this.buttonName, this.color, required this.onTap, required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(position),
      child: Container(
        height: 34,
        width: 90,
        child: Center(
          child: Text(buttonName,style: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}