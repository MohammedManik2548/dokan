import 'package:flutter/material.dart';

class AccountCustomTextField extends StatelessWidget {

  String hint;

  AccountCustomTextField({
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            // labelText: 'Email',
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFFA4A9AF),
                fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            // enabled: false,
          ),
        ),
      ),
    );
  }
}
