import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width / 2,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0,3),
              color: Colors.grey.withOpacity(0.3)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
            child: Image.asset(
              'assets/images/person.jpg',
              height: 177,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 14),
          Container(
            margin: EdgeInsets.only(left: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Girls Stylish Dresses',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '150',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 12),
                Text('***'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
