import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {

  String image;
  Color containerColor;
  VoidCallback onTap;

  SmallButton({
    required this.image,
    required this.containerColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      width: 56,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0,3),
              color: Colors.grey.withOpacity(0.3)
          )
        ],
      ),
      child: Image.asset(
        image,
        width: 23,
        height: 23,
      ),
    );
  }
}
