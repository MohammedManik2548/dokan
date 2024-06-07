import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {

  String text;
  Color containerColor;
  Function() onTap;

  CustomButton({
    required this.text,
    required this.containerColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 61,
        width: double.infinity,
        decoration:BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
