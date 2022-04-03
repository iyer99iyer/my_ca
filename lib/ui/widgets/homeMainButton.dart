// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMainButton extends StatelessWidget {
  final String buttonTypeName;
  final String amount;
  final Color color;

  const HomeMainButton({
    Key? key,
    required this.buttonTypeName,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 63,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 110,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(width: 1.0),
            ),
            child: Center(
                child: Text(
              // buttonType
              buttonTypeName,
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w800),
            )),
          ),
          Center(
              child: Text(
            // Amount
            '₹' + amount,
            style:
                GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w600),
          )),
        ],
      ),
    );
  }
}