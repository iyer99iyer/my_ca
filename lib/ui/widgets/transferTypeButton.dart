import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferTypeButton extends StatelessWidget {

  final String svgPath;
  final double? height;
  final Color? color;
  final String name;
  final Function(String x) onTap;

  const TransferTypeButton({
    Key? key, required this.svgPath, this.height, required this.name, this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTap(name),
      child: Column(
        children: [
          Container(
            height: 34,
            width: 60,
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                height: height ?? 35.0,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Text(name,style: GoogleFonts.roboto(
              fontSize: 10, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}