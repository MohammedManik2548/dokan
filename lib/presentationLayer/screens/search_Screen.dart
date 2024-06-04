import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../businessLogicLayer/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController controller = SearchScreenController();
  SearchScreen({super.key});

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
            icon: const Icon(
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
            _buildFilterSort(context,width),
            SizedBox(height: 10),
            _buildAllProduct(height,width),
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

  Widget _buildFilterSort(BuildContext context,double width){
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
            InkWell(
              onTap: (){
                _bottomSheet(context);
              },
              child: Image.asset(
                'assets/images/filter.png',
                height: 13,
                width: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllProduct(double height, double width){
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
            // var item = controller.productList.value[i];
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
                    child: const Column(
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
      ),
    );
  }

  Future _bottomSheet(BuildContext context){
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        builder: (BuildContext context){
          return Container(
            decoration: const BoxDecoration(
                color:  Color(0xfff1f1f1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            width: MediaQuery.of(context).size.width,
            height: 424,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30,left: 22),
                  child: Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 17.36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      // value: controller.callCheckBox.value,
                      onChanged: (v){},
                      value: true,
                    ),
                    Text(
                        "Newest",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      // value: controller.callCheckBox.value,
                      onChanged: (v){},
                      value: false,
                    ),
                    Text(
                        "Oldest",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red[900],
                      // value: controller.callCheckBox.value,
                      onChanged: (v){},
                      value: false,
                    ),
                    Text(
                        "Price low > High",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red[900],
                      // value: controller.callCheckBox.value,
                      onChanged: (v){},
                      value: false,
                    ),
                    Text(
                        "Price high > Low",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red[900],
                      // value: controller.callCheckBox.value,
                      onChanged: (v){},
                      value: false,
                    ),
                    Text(
                        "Best selling",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 61,
                      width: 155.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff818995),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 61,
                      width: 155.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1ABC9C)
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }


}