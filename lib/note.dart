import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'note2.dart';

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

  String _format = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: SvgPicture.asset('assets/LeftArrowBig.svg'),
                      ),
                      Text('Запись на приём'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Отмена',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(221, 32, 6, 1),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: Text(
                      'Формат визита',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1C1B19),
                        fontFamily: 'Inter',
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  Container(
                    width: screenWidth / 1.48,
                    child: Text(
                      'Вы бы хотели прийти в клинику лично или созвониться с врачем онлайн?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 36, bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: (_format == 'Лично') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12), width: 1.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset('assets/male.svg'),
                            title: CheckboxListTile(
                              value: _format == 'Лично',
                              title: Text('Лично'),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _format = value ? 'Лично' : '';
                                  });
                                }
                              },
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: Color.fromRGBO(28, 27, 25, 1),
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          (_format == 'Лично') ?
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 48, bottom: 20),
                            child: Row(
                              children: [
                                Text('Классический приём в клинике'),
                              ],
                            )
                          ) : SizedBox(height: 0),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: (_format == 'Онлайн') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12), width: 1.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset('assets/Video.svg', color: (_format == 'Онлайн') ? Color.fromRGBO(221, 32, 6, 1) : Color.fromRGBO(221, 32, 6, 0.48)),
                            title: CheckboxListTile(
                              value: _format == 'Онлайн',
                              title: Text('Онлайн'),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _format = value ? 'Онлайн' : '';
                                  });
                                }
                              },
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: Color.fromRGBO(28, 27, 25, 1),
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          (_format == 'Онлайн') ?
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 48, bottom: 20),
                            child: Text('Видео-созвон с вашим врачём. Комфортная консультация из дома и любой точки страны. Мира!'),
                          ) : SizedBox(height: 0),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: Opacity(
                            opacity: (_format == 'Лично' || _format == 'Онлайн') ? 1.0 : 0.5,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                fixedSize: MaterialStateProperty.all(Size(screenWidth - 40, 48)),
                              ),
                              onPressed: () {
                                if (_format == 'Лично' || _format == 'Онлайн') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Note2()));
                                }
                              },
                              child: Text(
                                'Далее',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFAF9F7)
                                ),
                              ),
                            ),
                          )
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}