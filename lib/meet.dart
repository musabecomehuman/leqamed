import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'support.dart';
import 'home.dart';

class Meet extends StatefulWidget {
  @override
  _MeetState createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  String _lastname = '';
  String _name = '';
  String _surname = '';
  String _sex = '';
  bool _isGenderSelected = false;
  DateTime _selectedDate = DateTime.now();

  final lastnameController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  void _navigateToSupportScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support()),
    );
  }

  // void _navigateToRegScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MyRegistrationScreen()),
  //   );
  // }

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
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            'Познакомимся?',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color:Color(0xff1C1B19), fontFamily: 'Inter'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _navigateToSupportScreen(context);
                          });
                        },
                        child: SvgPicture.asset('assets/support.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: Text(
                      'Нам будет проще взаимодействовать при записи на прием, если вы заполните поля ниже',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 48),
                  Center(
                    child: SvgPicture.asset('assets/addpic.svg', width: 80),
                  ),
                  SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          cursorColor: Color(0xffDD2006),
                          controller: lastnameController,
                          onChanged: (value) {
                            setState(() {
                              _lastname = value;
                            });
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            hintText: 'Фамилия',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(144, 144, 142, 0.52),
                              fontSize: 16,
                            ),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 12),
                              width: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      lastnameController.clear();
                                      setState(() {
                                        _lastname = '';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/clear_btn.svg',
                                      width: 20,
                                      height: 20,
                                      color: _lastname.isNotEmpty ? Color(0xff90908E) : Color(0xffFAF9F7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          cursorColor: Color(0xffDD2006),
                          controller: nameController,
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            hintText: 'Имя',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(144, 144, 142, 0.52),
                              fontSize: 16,
                            ),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 12),
                              width: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      nameController.clear();
                                      setState(() {
                                        _name = '';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/clear_btn.svg',
                                      width: 20,
                                      height: 20,
                                      color: _name.isNotEmpty ? Color(0xff90908E) : Color(0xffFAF9F7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          cursorColor: Color(0xffDD2006),
                          controller: surnameController,
                          onChanged: (value) {
                            setState(() {
                              _surname = value;
                            });
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            hintText: 'Отчество',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(144, 144, 142, 0.52),
                              fontSize: 16,
                            ),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 12),
                              width: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      surnameController.clear();
                                      setState(() {
                                        _surname = '';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/clear_btn.svg',
                                      width: 20,
                                      height: 20,
                                      color: _surname.isNotEmpty ? Color(0xff90908E) : Color(0xffFAF9F7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
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
                                                    'Укажите дату рождения',
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
                                          SizedBox(height: 50),
                                          Center(
                                            child: Container(
                                              height: 100,
                                              width: screenWidth,
                                              child: CupertinoDatePicker(
                                                initialDateTime: _selectedDate,
                                                onDateTimeChanged: (DateTime newDate) {
                                                  setState(() {
                                                    _selectedDate = newDate;
                                                  });
                                                },
                                                mode: CupertinoDatePickerMode.date,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 34),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                              child: Opacity(
                                                opacity: (1 == 1) ? 1.0 : 0.5,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                      fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Применить',
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xffFAF9F7)
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextField(
                              enabled: false,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                hintText: 'Дата рождения',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(144, 144, 142, 0.52),
                                  fontSize: 16,
                                ),
                                suffixIcon: Container(
                                  padding: EdgeInsets.only(right: 16, bottom: 12, top: 12),
                                  width: 24,
                                  height: 24,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/DownArrow.svg',
                                        width: 12,
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
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
                                                  'Укажите пол',
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
                                        Padding(
                                          padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 6),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: (_sex == 'Мужчина') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12), width: 1.2),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              leading: SvgPicture.asset('male.svg'),
                                              title: CheckboxListTile(
                                                value: _sex == 'Мужчина',
                                                title: Text('Мужчина'),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _sex = value ? 'Мужчина' : '';
                                                    });
                                                  }
                                                },
                                                controlAffinity: ListTileControlAffinity.trailing,
                                                activeColor: Color.fromRGBO(28, 27, 25, 1),
                                                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: (_sex == 'Женщина') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12), width: 1.2),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              leading: SvgPicture.asset('female.svg'),
                                              title: CheckboxListTile(
                                                value: _sex == 'Женщина',
                                                title: Text('Женщина'),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _sex = value ? 'Женщина' : '';
                                                    });
                                                  }
                                                },
                                                controlAffinity: ListTileControlAffinity.trailing,
                                                activeColor: Color.fromRGBO(28, 27, 25, 1),
                                                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 34),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                            child: Opacity(
                                              opacity: (_sex == 'Мужчина' || _sex == 'Женщина') ? 1.0 : 0.5,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                    fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                                                ),
                                                onPressed: () {
                                                  if (_sex == 'Мужчина' || _sex == 'Женщина') {
                                                    Navigator.pop(context);
                                                    _isGenderSelected = true;
                                                  }
                                                },
                                                child: Text(
                                                  'Применить',
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xffFAF9F7)
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextField(
                              enabled: false,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                hintText: 'Пол',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(144, 144, 142, 0.52),
                                  fontSize: 16,
                                ),
                                suffixIcon: Container(
                                  padding: EdgeInsets.only(right: 16, bottom: 12, top: 12),
                                  width: 24,
                                  height: 24,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/DownArrow.svg',
                                        width: 12,
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Opacity(
                            opacity: (1 == 1) ? 1.0 : 0.5,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                  fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
                        ],
                      ),
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