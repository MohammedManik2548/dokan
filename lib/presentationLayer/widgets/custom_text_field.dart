import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  String image;
  String hint;
  IconButton? icon;
  bool obscureText=false;
  TextEditingController controller;

  CustomTextField({
    required this.image,
    required this.hint,
    required this.controller,
    this.icon,
    required this.obscureText,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      width: double.infinity,
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
      child: Padding(
        padding: EdgeInsets.only(left: 23),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 19,
              height: 15,
              color: Color(0xFF7C8592),
            ),
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  // labelText: 'Email',
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFA4A9AF)
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: icon
                  // enabled: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
