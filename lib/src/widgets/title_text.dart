import 'package:flutter/material.dart';
import 'package:eccomerce/src/themes/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const TitleText(
      {Key? key, this.text, this.fontSize, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.mulish(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
