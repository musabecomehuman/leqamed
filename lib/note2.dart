import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'note3.dart';

class Note2 extends StatefulWidget {
  @override
  _NoteState2 createState() => _NoteState2();
}

class _NoteState2 extends State<Note2> {

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
                      'Выберите клинику',
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
                      'Выберите клинику, подходящую под ваши потребности',
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
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _format = _format == 'Легамед' ? '' : 'Легамед';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: (_format == 'Легамед') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              value: _format == 'Легамед',
                              title: Row(
                                children: [
                                  SvgPicture.asset('assets/Location.svg', width: 24, height: 24),
                                  SizedBox(width: 4),
                                  Text(
                                    'Легамед',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Inter', color: Color.fromRGBO(28, 27, 25, 1)),
                                  ),
                                ],
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _format = value ? 'Легамед' : '';
                                  });
                                }
                              },
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: Color.fromRGBO(28, 27, 25, 1),
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          (_format == 'Легамед')
                              ? Padding(
                            padding: EdgeInsets.only(left: 16, right: 48, bottom: 4),
                            child: Text('Многопрофильный медицинский центр, специализация на лечении'),
                          )
                              : SizedBox(height: 0),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 48, bottom: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Чебоксары, Приволжский б-р, 1',
                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(144, 144, 142, 1)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _format = _format == 'ДЦ Легамед' ? '' : 'ДЦ Легамед';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (_format == 'ДЦ Легамед') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                value: _format == 'ДЦ Легамед',
                                title: Row(
                                  children: [
                                    SvgPicture.asset('assets/Location.svg', width: 24, height: 24),
                                    SizedBox(width: 4),
                                    Text(
                                      'ДЦ Легамед',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Inter', color: Color.fromRGBO(28, 27, 25, 1)),
                                    ),
                                  ],
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _format = value ? 'ДЦ Легамед' : '';
                                    });
                                  }
                                },
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: Color.fromRGBO(28, 27, 25, 1),
                                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              ),
                            ),
                            (_format == 'ДЦ Легамед')
                                ? Padding(
                              padding: EdgeInsets.only(left: 16, right: 48, bottom: 4),
                              child: Text('Диагностический центр, исследования здоровья на новейших аппаратах'),
                            )
                                : SizedBox(height: 0),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 48, bottom: 20),
                              child: Text(
                                'Чебоксары, ул. Гузовского 17А; пр-т Мира 37 Канаш, ул. Павлова 10А',
                                style: TextStyle(fontSize: 12, color: Color.fromRGBO(144, 144, 142, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _format = _format == 'Доктор Заботик' ? '' : 'Доктор Заботик';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (_format == 'Доктор Заботик') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                value: _format == 'Доктор Заботик',
                                title: Row(
                                  children: [
                                    SvgPicture.asset('assets/Location.svg', width: 24, height: 24),
                                    SizedBox(width: 4),
                                    Text(
                                      'Доктор Заботик',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Inter', color: Color.fromRGBO(28, 27, 25, 1)),
                                    ),
                                  ],
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _format = value ? 'Доктор Заботик' : '';
                                    });
                                  }
                                },
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: Color.fromRGBO(28, 27, 25, 1),
                                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              ),
                            ),
                            (_format == 'Доктор Заботик')
                                ? Padding(
                              padding: EdgeInsets.only(left: 16, right: 48, bottom: 4),
                              child: Text('Специализированная детская клиника с высококлассными специалистами'),
                            )
                                : SizedBox(height: 0),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 48, bottom: 20),
                              child: Text(
                                'Чебоксары, Приволжский бульвар 2; ул. Ленинского комсомола',
                                style: TextStyle(fontSize: 12, color: Color.fromRGBO(144, 144, 142, 1)),
                              ),
                            )
                          ],
                        ),
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
                                opacity: (_format.isNotEmpty) ? 1.0 : 0.5,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                    fixedSize: MaterialStateProperty.all(Size(screenWidth - 40, 48)),
                                  ),
                                  onPressed: () {
                                    if (_format.isNotEmpty) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Note3()));
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