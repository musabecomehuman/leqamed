import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'note4.dart';

class Note3 extends StatefulWidget {
  @override
  _NoteState3 createState() => _NoteState3();
}

class _NoteState3 extends State<Note3> {

  String _format = "Легамед";
  TextEditingController _formatController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  List<String> _supportList = [
    'Авторизация',
    'Пароль',
    'Данные для входа',
    'Профиль',
    'Запись',
    'Журнал записей',
    'Медкарта',
    'Транзакции',
    'Бонусы',
    'Контакты',
    'Не нашли решение?',
  ];

  List<String> _filteredSupportList = [];

  @override
  void initState() {
    super.initState();
    _filteredSupportList = _supportList;
    _formatController.text = _format;
    _searchController.addListener(_filterSupportList);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _filterSupportList() {
    List<String> filtered = _supportList.where((support) {
      return support.toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();

    setState(() {
      _filteredSupportList = filtered;
    });
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
                      'Лечебное      направление',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1C1B19),
                        fontFamily: 'Inter',
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: screenHeight * 0.85,
                                child: Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Container(
                                            child: Text(
                                              'Выберите клинику',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff1C1B19),
                                                fontFamily: 'Inter',
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/close.svg'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 13),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Выберите клинику, подходящую под ваши потребности',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(
                                              144, 144, 142, 0.52),
                                          fontFamily: 'Inter',
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 36,
                                          bottom: 6),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _format = 'Легамед';
                                            _formatController.text = _format;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (_format == 'Легамед')
                                                  ? Color.fromRGBO(
                                                  28, 27, 25, 1)
                                                  : Color.fromRGBO(
                                                  28, 27, 25, 0.12),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                6),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: CheckboxListTile(
                                                  contentPadding: EdgeInsets
                                                      .zero,
                                                  value: _format == 'Легамед',
                                                  title: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Location.svg',
                                                          width: 24,
                                                          height: 24),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        'Легамед',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                            fontFamily: 'Inter',
                                                            color: Color
                                                                .fromRGBO(
                                                                28, 27, 25, 1)),
                                                      ),
                                                    ],
                                                  ),
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        _format =
                                                        value ? 'Легамед' : '';
                                                        _formatController.text =
                                                            _format;
                                                      });
                                                    }
                                                  },
                                                  controlAffinity: ListTileControlAffinity
                                                      .trailing,
                                                  activeColor: Color.fromRGBO(
                                                      28, 27, 25, 1),
                                                  checkboxShape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(32)),
                                                ),
                                              ),
                                              (_format == 'Легамед')
                                                  ? Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 4),
                                                child: Text(
                                                    'Многопрофильный медицинский центр, специализация на лечении'),
                                              )
                                                  : SizedBox(height: 0),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 20),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Чебоксары, Приволжский б-р, 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromRGBO(
                                                              144, 144, 142,
                                                              1)),
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
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 6),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _format = 'ДЦ Легамед';
                                            _formatController.text = _format;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (_format == 'ДЦ Легамед')
                                                  ? Color.fromRGBO(
                                                  28, 27, 25, 1)
                                                  : Color.fromRGBO(
                                                  28, 27, 25, 0.12),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                6),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: CheckboxListTile(
                                                  contentPadding: EdgeInsets
                                                      .zero,
                                                  value: _format ==
                                                      'ДЦ Легамед',
                                                  title: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Location.svg',
                                                          width: 24,
                                                          height: 24),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        'ДЦ Легамед',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                            fontFamily: 'Inter',
                                                            color: Color
                                                                .fromRGBO(
                                                                28, 27, 25, 1)),
                                                      ),
                                                    ],
                                                  ),
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        _format =
                                                        value
                                                            ? 'ДЦ Легамед'
                                                            : '';
                                                        _formatController.text =
                                                            _format;
                                                      });
                                                    }
                                                  },
                                                  controlAffinity: ListTileControlAffinity
                                                      .trailing,
                                                  activeColor: Color.fromRGBO(
                                                      28, 27, 25, 1),
                                                  checkboxShape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(32)),
                                                ),
                                              ),
                                              (_format == 'ДЦ Легамед')
                                                  ? Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 4),
                                                child: Text(
                                                    'Диагностический центр, исследования здоровья на новейших аппаратах'),
                                              )
                                                  : SizedBox(height: 0),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 20),
                                                child: Text(
                                                  'Чебоксары, ул. Гузовского 17А; пр-т Мира 37 Канаш, ул. Павлова 10А',
                                                  style: TextStyle(fontSize: 12,
                                                      color: Color.fromRGBO(
                                                          144, 144, 142, 1)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 6),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _format = 'Доктор Заботик';
                                            _formatController.text = _format;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (_format ==
                                                  'Доктор Заботик')
                                                  ? Color.fromRGBO(
                                                  28, 27, 25, 1)
                                                  : Color.fromRGBO(
                                                  28, 27, 25, 0.12),
                                              width: 1.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                6),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: CheckboxListTile(
                                                  contentPadding: EdgeInsets
                                                      .zero,
                                                  value: _format ==
                                                      'Доктор Заботик',
                                                  title: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Location.svg',
                                                          width: 24,
                                                          height: 24),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        'Доктор Заботик',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                            fontFamily: 'Inter',
                                                            color: Color
                                                                .fromRGBO(
                                                                28, 27, 25, 1)),
                                                      ),
                                                    ],
                                                  ),
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        _format = value
                                                            ? 'Доктор Заботик'
                                                            : '';
                                                        _formatController.text =
                                                            _format;
                                                      });
                                                    }
                                                  },
                                                  controlAffinity: ListTileControlAffinity
                                                      .trailing,
                                                  activeColor: Color.fromRGBO(
                                                      28, 27, 25, 1),
                                                  checkboxShape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(32)),
                                                ),
                                              ),
                                              (_format == 'Доктор Заботик')
                                                  ? Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 4),
                                                child: Text(
                                                    'Специализированная детская клиника с высококлассными специалистами'),
                                              )
                                                  : SizedBox(height: 0),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 48,
                                                    bottom: 20),
                                                child: Text(
                                                  'Чебоксары, Приволжский бульвар 2; ул. Ленинского комсомола',
                                                  style: TextStyle(fontSize: 12,
                                                      color: Color.fromRGBO(
                                                          144, 144, 142, 1)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .end,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 24),
                                                child: Opacity(
                                                  opacity: (_format.isNotEmpty)
                                                      ? 1.0
                                                      : 0.5,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty
                                                          .all(Color(
                                                          0xffDD2006)),
                                                      shape: MaterialStateProperty
                                                          .all(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(
                                                                  6))),
                                                      fixedSize: MaterialStateProperty
                                                          .all(Size(
                                                          screenWidth - 40,
                                                          48)),
                                                    ),
                                                    onPressed: () {
                                                      if (_format.isNotEmpty) {
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Далее',
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          color: Color(
                                                              0xffFAF9F7)
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
                              );
                            }
                            );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Color.fromRGBO(28, 27, 25, 1),
                          width: 1.2,
                        )
                      ),
                      child: TextField(
                        enabled: false,
                        controller: _formatController,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Color.fromRGBO(28, 27, 25, 1), fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 12, left: 16, right: 4),
                            child: SvgPicture.asset('assets/Location.svg'),
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
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
                  SizedBox(height: 36),
                  TextField(
                    cursorColor: Color(0xffDD2006),
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(28, 27, 25, 0.04),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(left: 16, top: 9, bottom: 9, right: 6),
                        child: SvgPicture.asset('assets/search.svg'),
                      ),
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromRGBO(28, 27, 25, 0.48)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredSupportList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index != _filteredSupportList.length - 1) // Check if it's not the last item
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Note4()));
                                },
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Color.fromRGBO(28, 27, 25, 0.12), width: 1.2),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      _filteredSupportList[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    trailing: SvgPicture.asset('RightArrow.svg'),
                                  ),
                                ),
                              )
                            else // If it's the last item
                              InkWell(
                                onTap: () {
                                  // Handle the onTap event here
                                },
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Color.fromRGBO(221, 32, 6, 1), width: 1.6), // Set the border color to red
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      _filteredSupportList[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    trailing: SizedBox(
                                      width: 16,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('RightArrow.svg', color: Color.fromRGBO(221, 32, 6, 1)),
                                          SvgPicture.asset('RightArrow.svg', color: Color.fromRGBO(221, 32, 6, 1)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: 6), // Add space between list items here
                          ],
                        );
                      },
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