import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../businessLogicLayer/search_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../dataLayer/models/ProductModel.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController controller = SearchScreenController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.readJsonData();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: height,
        child: Column(
          children: [
            // const SizedBox(height: 64),
            Container(
              margin: const EdgeInsets.only(top: 64, right: 23),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Product List',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 22.57,
                      color: const Color(0xFF222455),
                    ),
                  ),
                  const SizedBox(width: 82),
                  Image.asset(
                    'assets/images/search.png',
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
            ),
            _buildFilterSort(context, width),
            const SizedBox(height: 10),
            Obx(() => Container(
              height: 535,
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 170),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.productList.value.length ?? 0,
                  itemBuilder: (c, i) {
                    // var item = controller.productList.value[i];
                    return Container(
                      width: width / 2,
                      // height: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 3),
                              color: Colors.grey.withOpacity(0.3))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 177,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              child: Image.network(
                                controller.productList![1].images![2]
                                    .src ??
                                    'https://maxipower.com.cn/public/images/images-empty.png',
                                height: 177,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            margin: const EdgeInsets.only(left: 19),
                            child: FittedBox(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.productList![i].name ??
                                        '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${controller.productList![i].regularPrice ?? '00'}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.grey,
                                          decoration: TextDecoration
                                              .lineThrough,
                                          decorationColor:
                                          Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '\$${controller.productList![i].price ?? ''}',
                                        style: const TextStyle(
                                            fontWeight:
                                            FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  RatingBar.builder(
                                      initialRating: 3,
                                      itemSize: 15,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) =>
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {}),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSort(BuildContext context, double width) {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 3),
              color: Colors.grey.withOpacity(0.3))
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
                const Text(
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
              onTap: () {
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

  Future _bottomSheet(BuildContext context) {
    controller.clearBox();
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            width: MediaQuery.of(context).size.width,
            height: 424,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 22),
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: 17.36,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xffFF708A),
                      side: const BorderSide(
                        color: Color(0xFFFF708A),
                        width: 2,
                      ),
                      onChanged: (v) {
                        if (controller.newestCheckBox.value == false) {
                          controller.newestCheckBox.value = true;
                          controller.oldestCheckBox.value = false;
                          controller.priceLowCheckBox.value = false;
                          controller.priceHighCheckBox.value = false;
                          controller.bestSellCheckBox.value= false;
                        } else {
                          controller.newestCheckBox.value = false;
                          // controller.oldestCheckBox.value = f;
                          // controller.priceLowCheckBox.value = true;
                          // controller.priceHighCheckBox.value = true;
                          // controller.bestSellCheckBox.value= true;
                        }
                      },
                      value: controller.newestCheckBox.value,
                    ),
                    const Text(
                      "Newest",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      side: const BorderSide(
                        color: Color(0xFFFF708A),
                        width: 2,
                      ),
                      onChanged: (v) {
                        if (controller.oldestCheckBox.value == false) {
                          controller.oldestCheckBox.value = true;
                          controller.newestCheckBox.value = false;
                          controller.priceLowCheckBox.value = false;
                          controller.priceHighCheckBox.value= false;
                          controller.bestSellCheckBox.value = false;

                        } else {
                          controller.oldestCheckBox.value = false;
                        }
                      },
                      value: controller.oldestCheckBox.value,
                    ),
                    const Text(
                      "Oldest",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      side: const BorderSide(
                        color: Color(0xFFFF708A),
                        width: 2,
                      ),
                      onChanged: (v) {
                        if (controller.priceLowCheckBox.value == false) {
                          controller.priceLowCheckBox.value = true;
                          controller.newestCheckBox.value = false;
                          controller.oldestCheckBox.value = false;
                          controller.priceHighCheckBox.value = false;
                          controller.bestSellCheckBox.value = false;
                        } else {
                          controller.priceLowCheckBox.value = false;
                        }
                      },
                      value: controller.priceLowCheckBox.value,
                    ),
                    const Text(
                      "Price low > High",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      side: const BorderSide(
                        color: Color(0xFFFF708A),
                        width: 2,
                      ),
                      onChanged: (v) {
                        if (controller.priceHighCheckBox.value == false) {
                          controller.priceHighCheckBox.value = true;
                          controller.newestCheckBox.value = false;
                          controller.oldestCheckBox.value = false;
                          controller.priceLowCheckBox.value = false;
                          controller.bestSellCheckBox.value = false;
                        } else {
                          controller.priceHighCheckBox.value = false;

                        }
                      },
                      value: controller.priceHighCheckBox.value,
                    ),
                    const Text(
                      "Price high > Low",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF708A),
                      side: const BorderSide(
                        color: Color(0xFFFF708A),
                        width: 2,
                      ),
                      onChanged: (v) {
                        if (controller.bestSellCheckBox.value == false) {
                          controller.bestSellCheckBox.value = true;
                          controller.newestCheckBox.value = false;
                          controller.oldestCheckBox.value = false;
                          controller.priceLowCheckBox.value = false;
                          controller.priceHighCheckBox.value = false;
                        } else {
                          controller.bestSellCheckBox.value = false;
                        }
                      },
                      value: controller.bestSellCheckBox.value,
                    ),
                    const Text(
                      "Best selling",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: ()=> Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 61,
                        width: 155.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border:
                          Border.all(color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xff818995),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.priceLowCheckBox.value == true) {
                          controller.sortByPriceAscending();
                        }else if(controller.priceHighCheckBox.value == true){
                          controller.sortByPriceDescending();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 61,
                        width: 155.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff1ABC9C)),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Apply',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
