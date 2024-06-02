import 'package:flutter/material.dart';

class GradientFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Gradient gradient;

  const GradientFloatingActionButton({
    required this.onPressed,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.5),
        //     spreadRadius: 2,
        //     blurRadius: 5,
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: CircleBorder(),
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
          iconSize: 28.0,
        ),
      ),
    );
  }
}