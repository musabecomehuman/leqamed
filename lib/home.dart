import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFAF9F7),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight - 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Row(
                          children: [
                            Text(
                              'Клиники',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: Color.fromRGBO(28, 27, 25, 1),
                              ),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset('assets/DownArrow.svg'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: SvgPicture.asset('assets/search.svg'),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {

                            },
                            child: SvgPicture.asset('assets/notifications.svg'),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(image: AssetImage('assets/homeElement.png'), fit: BoxFit.cover),
                        ),
                        width: screenWidth,
                        height: 250,
                        child: Center(
                          child: Text('Element 1'),
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        height: 250,
                        color: Colors.green,
                        child: Center(
                          child: Text('Element 2'),
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        height: 250,
                        color: Colors.blue,
                        child: Center(
                          child: Text('Element 3'),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(221, 32, 6, 1),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.6, vertical: 22),
                          child: SvgPicture.asset('assets/Video.svg'),
                        )
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 72,
                        width: screenWidth - 118,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1.6, color: Color.fromRGBO(221, 32, 6, 1)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset('assets/telemedicine.svg'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset('assets/RightArrowBig.svg'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 163,
                        width: (screenWidth - 48.5) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 8.5),
                      Container(
                        height: 163,
                        width: (screenWidth - 48.5) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        height: 163,
                        width: (screenWidth - 48.5) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 8.5),
                      Container(
                        height: 163,
                        width: (screenWidth - 48.5) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SvgPicture.asset('assets/column.svg', width: screenWidth),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset('assets/home.svg'),
                        ),
                        SizedBox(width: (screenWidth - 280) / 4),
                        GestureDetector(
                          child: SvgPicture.asset('assets/note.svg'),
                        ),
                        SizedBox(width: (screenWidth - 280) / 4),
                        GestureDetector(
                          child: SvgPicture.asset('assets/newNote.svg'),
                        ),
                        SizedBox(width: (screenWidth - 280) / 4),
                        GestureDetector(
                          child: SvgPicture.asset('assets/heart.svg'),
                        ),
                        SizedBox(width: (screenWidth - 280) / 4),
                        GestureDetector(
                          child: SvgPicture.asset('assets/profile.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}