import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'Product List',
          style: TextStyle(
            fontSize: 22.57,
            fontWeight: FontWeight.w700,
            color: Color(0xff222455),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.search,
              size: 22,
              color: Color(0xff222455),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
