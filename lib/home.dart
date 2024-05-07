import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'homeSearch.dart';
import 'note.dart';

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
          child: SingleChildScrollView(
            child: Container(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSearch()));
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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 24),
                                        Row(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left:20)),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  'Телемедицина',
                                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color:Color(0xff1C1B19), fontFamily: 'Inter'),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: SvgPicture.asset('assets/close.svg'),
                                            ),
                                            Padding(padding: EdgeInsets.only(right: 20)),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                "В нашем приложении доступны онлайн-приёмы для каждой из клиник",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                    color: Color.fromRGBO(28, 27, 25, 1)
                                                ),
                                              ),
                                              SizedBox(height: 24),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Доступность и удобство",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Inter',
                                                      color: Color.fromRGBO(28, 27, 25, 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 12),
                                              Text(
                                                "Вы можете получить качественную медицинскую помощь, которая ничем не отличается от обычного визита в клинику, не выходя из дома.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                    color: Color.fromRGBO(28, 27, 25, 1)
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Text(
                                                "Вы можете получить качественную медицинскую помощь, которая ничем не отличается от обычного визита в клинику, не выходя из дома.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                    color: Color.fromRGBO(28, 27, 25, 1)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 34),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                                            ),
                                            onPressed: () {
                                              // on pressed
                                            },
                                            child: Text(
                                              'Записаться на онлайн-приём',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFAF9F7)
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                          );
                        },
                        child: Container(
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
                      )
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
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              child: SvgPicture.asset('assets/home.svg'),
            ),
            SizedBox(width: (screenWidth - 280) / 4),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Note()));
              },
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
    );
  }
}