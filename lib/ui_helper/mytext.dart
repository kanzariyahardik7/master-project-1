import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextOverflow? textoverflow;
  final int? maxlines;
  final TextAlign? textalign;
  final double? fontsize;
  final Color color;
  final FontWeight? fontweight;
  final FontStyle? fontstyle;

  MyText(
      {required this.text,
      this.textoverflow,
      this.maxlines,
      this.textalign,
      this.fontsize,
      required this.color,
      this.fontweight,
      this.fontstyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: textoverflow,
        maxLines: maxlines,
        textAlign: textalign,
        style: GoogleFonts.lato(
          fontSize: fontsize,
          color: color,
          fontWeight: fontweight,
          fontStyle: fontstyle,
        ));
  }
}
