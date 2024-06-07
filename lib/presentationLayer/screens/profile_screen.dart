import 'package:dokan/presentationLayer/widgets/account_custom_text_firld.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(top: 64,left: 22,right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Account',
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Color(0xFF222455),
                ),
              ),
              const SizedBox(height: 48),
              const CircleAvatar(
                radius: 60.0,
                backgroundImage:
                NetworkImage('https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 48),
              Text(
                'John Smith',
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'info@johnsmith.com',
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xFF535353),
                ),
              ),
              const SizedBox(height: 40),

              ///ExpansionTitle
              Container(
                height: 271,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: const Offset(2,3),
                        color: Colors.grey.withOpacity(0.3)
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionTile(
                        // expandedAlignment: Alignment.centerLeft,
                        childrenPadding: EdgeInsets.only(left: 23,right: 23),
                        // enabled: false,
                        title: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/personIcon.png',
                                width: 17,
                                height: 22,
                                color: Color(0xFF7C8592),
                              ),
                              const SizedBox(width: 17),
                              Text(
                                'Account',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.36,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA4A9AF),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          AccountCustomTextField(hint: 'youremail@xmail.com'),
                          const SizedBox(height: 21),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Full Name',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA4A9AF),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          AccountCustomTextField(hint: 'William Bennett'),
                          const SizedBox(height: 21),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Street Address',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA4A9AF),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          AccountCustomTextField(hint: '465 Nolan Causeway Suite 079'),
                          const SizedBox(height: 21),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Apt, Suite, Bldg (optional)',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA4A9AF),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          AccountCustomTextField(hint: 'Unit 512'),
                          const SizedBox(height: 21),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Zip Code',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA4A9AF),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 52,
                            width: 86,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.withOpacity(0.5)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                // labelText: 'Email',
                                hintText: '77017',
                                hintStyle: TextStyle(
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
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 135,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
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
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 135,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff1ABC9C)
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 43),
                        ],
                      ),
                      Container(
                        width: 286,
                        height: 2,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      ExpansionTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/lock.png',
                                width: 17,
                                height: 22,
                                color: Color(0xFF7C8592),
                              ),
                              const SizedBox(width: 17),
                              Text(
                                'Passwords',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.36,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [

                        ],
                      ),
                      Container(
                        width: 286,
                        height: 2,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      ExpansionTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/notification.png',
                                width: 17,
                                height: 22,
                                color: Color(0xFF7C8592),
                              ),
                              const SizedBox(width: 17),
                              Text(
                                'Notification',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.36,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [

                        ],
                      ),
                      Container(
                        width: 286,
                        height: 2,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      ExpansionTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/heart.png',
                                width: 17,
                                height: 22,
                                color: Color(0xFF7C8592),
                              ),
                              const SizedBox(width: 17),
                              Text(
                                'Wishlist (00)',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.36,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
