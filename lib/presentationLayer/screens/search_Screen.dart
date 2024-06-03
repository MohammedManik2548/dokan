import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/product_card.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
        centerTitle: true,
        elevation: 0,
        actions: [
          // Container(
          //   alignment: Alignment.center,
          //   height: 22,
          //   width: 22,
          //   child: Icon(
          //       Icons.search,
          //     size: 14,
          //     color: Color(0xff222455),
          //   ),
          // ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.search,
              size: 22,
              color: Color(0xff222455),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFilterSort(width),
            SizedBox(height: 10),
            _buildAllProduct(height),
            // Container(
            //   padding: EdgeInsets.all(8.0),
            //   height: height,
            //     child: _buildAllProduct(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSort(double width){
    return Container(
      margin: EdgeInsets.only(top: 30,right: 20,left: 20),
      width: width,
      height: 60,
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
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Shape.png',
                  height: 16,
                  width: 15,
                ),
                SizedBox(width: 11),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xff818995),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 128),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sort by',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xff818995),
                  ),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff818995),
                )
              ],
            ),
            SizedBox(width: 22),
            Image.asset(
              'assets/images/filter.png',
              height: 13,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllProduct(double height){
    return Container(
      height: height,
      padding: EdgeInsets.all(20.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: (100 / 170),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          scrollDirection: Axis.vertical,
          itemCount: 30,
          itemBuilder: (c, i){
            return ProductCard();
          }
      ),
    );
  }


}