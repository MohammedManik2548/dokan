import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dokan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black45,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        // shape: BeveledRectangleBorder(
        //     // borderRadius: BorderRadius.circular(20.0),
        //     // side: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid)
        //     ),
        // mini: true,
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 80,
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.home,
                color: Color(0xff6E7FAA),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: Icon(
                Icons.shopping_cart,
                color: Color(0xff6E7FAA),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Icon(
                Icons.favorite,
                color: Color(0xff6E7FAA),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.settings,
                color: Color(0xff6E7FAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
