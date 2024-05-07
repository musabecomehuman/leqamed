import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

class Note4 extends StatefulWidget {
  @override
  _NoteState4 createState() => _NoteState4();
}

class _NoteState4 extends State<Note4> {

  bool _education = false;
  String _format = "Легамед";
  TextEditingController _formatController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  List<String> _supportList = [
    'Степанова Анна Александровна',
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

  List<String> times = ["12:00", "13:00", "14:00", "15:00", "16:00"];

  List<String> _filteredSupportList = [];

  DateRange? dateRange;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Выберите врача',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1C1B19),
                          fontFamily: 'Inter',
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              bool isChanged = false;
                              DateTime? newSelectedDate;
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
                                              SizedBox(height: 24),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        'Фильтр по дате',
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
                                                ],
                                              ),
                                              SizedBox(height: 12),
                                              Container(
                                                padding: EdgeInsets.only(right: 50),
                                                child: Text(
                                                  "Выберите желаемые даты посещения врача и мы предоставим свободных специалистов",
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 0.48), fontFamily: 'Inter'),
                                                ),
                                              ),
                                              SizedBox(height: 50),
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1.2, color: Color.fromRGBO(0, 0, 0, 0.12)),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  height: 329,
                                                  width: screenWidth,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 36),
                                                    alignment: Alignment.center,
                                                    child: DateRangePickerWidget(
                                                      onDateRangeChanged: (DateRange? datRange) {
                                                        dateRange = datRange;
                                                      },
                                                      doubleMonth: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 1.2, color: Color.fromRGBO(0, 0, 0, 0.48)),
                                                      borderRadius: BorderRadius.circular(6),
                                                    ),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),
                                                      child: Text(
                                                          (dateRange != null) ? (dateRange!.start.day.toString() + "/" + dateRange!.start.month.toString() + "/" + (dateRange!.start.year - 2000).toString()) : "--/--/--",
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 27, 25, 1), fontFamily: 'Inter', height: 1),
                                                      )
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 4,
                                                    width: 4,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(217, 217, 217, 1),
                                                      border: Border.all(width: 1.2, color: Color.fromRGBO(217, 217, 217, 1)),
                                                      borderRadius: BorderRadius.circular(100),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 4,
                                                    width: 4,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(217, 217, 217, 1),
                                                      border: Border.all(width: 1.2, color: Color.fromRGBO(217, 217, 217, 1)),
                                                      borderRadius: BorderRadius.circular(100),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 4,
                                                    width: 4,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(217, 217, 217, 1),
                                                      border: Border.all(width: 1.2, color: Color.fromRGBO(217, 217, 217, 1)),
                                                      borderRadius: BorderRadius.circular(100),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 1.2, color: Color.fromRGBO(0, 0, 0, 0.48)),
                                                      borderRadius: BorderRadius.circular(6),
                                                    ),
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),
                                                        child: Text(
                                                          (dateRange != null) ? (dateRange!.end.day.toString() + "/" + dateRange!.end.month.toString() + "/" + (dateRange!.end.year - 2000).toString()) : "--/--/--",
                                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 27, 25, 1), fontFamily: 'Inter', height: 1),
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                                                  child: Opacity(
                                                    opacity: (dateRange != null) ? 1 : 0.5,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                          fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                                                      ),
                                                      onPressed: () {
                                                        setState(() {

                                                        });
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
                                          ),
                                        );
                                      },
                                    );
                                  }
                              );
                            },
                            child: SvgPicture.asset('assets/Calendar.svg'),
                          )
                        ],
                      ),
                    ]
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
                                          Row(
                                            children: [
                                              SvgPicture.asset('assets/Location.svg'),
                                              SizedBox(width: 8),
                                              Text(
                                                'ДЦ Легамед',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff1C1B19),
                                                  fontFamily: 'Inter',
                                                  height: 1,
                                                ),
                                              ),
                                            ],
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
                                          'Выберите нужное отделение чтобы посмотреть врачей',
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
                                              _format = 'Все';
                                              _formatController.text = _format;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (_format == 'Все') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero, // Убираем внутренние отступы для ListTile
                                              title: CheckboxListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                                value: _format == 'Все',
                                                title: Row(
                                                  children: [
                                                    Expanded( // Расширяем виджет, чтобы текст мог быть обрезан при необходимости
                                                      child: Text(
                                                        'Все отделения',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Inter',
                                                            color: Color.fromRGBO(28, 27, 25, 1)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _format = value ? 'Все' : '';
                                                      _formatController.text = _format;
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
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 6),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _format = 'Гузовский';
                                              _formatController.text = _format;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (_format == 'Гузовский') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero, // Убираем внутренние отступы для ListTile
                                              title: CheckboxListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                                value: _format == 'Гузовский',
                                                title: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Location.svg',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Expanded( // Расширяем виджет, чтобы текст мог быть обрезан при необходимости
                                                      child: Text(
                                                        'Чебоксары, ул. Гузовского, 17А',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Inter',
                                                            color: Color.fromRGBO(28, 27, 25, 1)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _format = value ? 'Гузовский' : '';
                                                      _formatController.text = _format;
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
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 6),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _format = 'Мир';
                                              _formatController.text = _format;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (_format == 'Мир') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero, // Убираем внутренние отступы для ListTile
                                              title: CheckboxListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                                value: _format == 'Мир',
                                                title: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Location.svg',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Expanded( // Расширяем виджет, чтобы текст мог быть обрезан при необходимости
                                                      child: Text(
                                                        'Чебоксары, пр-т Мира, 37',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Inter',
                                                            color: Color.fromRGBO(28, 27, 25, 1)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _format = value ? 'Мир' : '';
                                                      _formatController.text = _format;
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
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 6),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _format = 'Павлов';
                                              _formatController.text = _format;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (_format == 'Павлов') ? Color.fromRGBO(28, 27, 25, 1) : Color.fromRGBO(28, 27, 25, 0.12),
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero, // Убираем внутренние отступы для ListTile
                                              title: CheckboxListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                                value: _format == 'Павлов',
                                                title: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Location.svg',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Expanded( // Расширяем виджет, чтобы текст мог быть обрезан при необходимости
                                                      child: Text(
                                                        'Канаш, ул. Павлова, 10А',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Inter',
                                                            color: Color.fromRGBO(28, 27, 25, 1)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _format = value ? 'Павлов' : '';
                                                      _formatController.text = _format;
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
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Padding(
                                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset('assets/female.svg'),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _filteredSupportList[index],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        height: 1,
                                                      ),
                                                      softWrap: true,
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'Акушер-гинеколог, 12 лет стажа',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w400,
                                                        color: Color.fromRGBO(28, 27, 25, 0.48),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 28),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    child: SvgPicture.asset('assets/close.svg'),
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
                                                                return SingleChildScrollView(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 24),
                                                                    child: Container (
                                                                      height: screenHeight * 0.85,
                                                                      child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            children: [
                                                                              SizedBox(height: 40),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: SvgPicture.asset('assets/close.svg'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 16),
                                                                              Center(
                                                                                child: SvgPicture.asset('assets/female.svg', width: 120, height: 120),
                                                                              ),
                                                                              SizedBox(height: 12),
                                                                              Column(
                                                                                children: [
                                                                                  Text(
                                                                                    _filteredSupportList[index],
                                                                                    style: TextStyle(
                                                                                        fontFamily: 'Inter',
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontSize: 20,
                                                                                        height: 2,
                                                                                        color: Color.fromRGBO(28, 27, 25, 1)
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                      "Акушер-гинеколог, 12 лет стажа",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Inter',
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontSize: 12,
                                                                                        height: 1.2,
                                                                                        color: Color.fromRGBO(144, 144, 142, 1),
                                                                                      )
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 16),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(width: 1.2, color: Color.fromRGBO(28, 27, 25, 0.12)),
                                                                                  borderRadius: BorderRadius.circular(6),
                                                                                ),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              SvgPicture.asset('assets/Location.svg'),
                                                                                              SizedBox(width: 4),
                                                                                              Text(
                                                                                                "Работает в Легамед",
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: 16,
                                                                                                  height: 1.6,
                                                                                                  color: Color.fromRGBO(28, 27, 25, 1),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(height: 4),
                                                                                          Row(
                                                                                              children: [
                                                                                                Text(
                                                                                                  "Чебоксары, Приволжский б-р, 1",
                                                                                                  style: TextStyle(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontWeight: FontWeight.w400,
                                                                                                    fontSize: 12,
                                                                                                    height: 1.2,
                                                                                                    color: Color.fromRGBO(144, 144, 142, 1),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                          SizedBox(height: 14),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              border: Border.all(width: 1.2, color: Color.fromRGBO(0, 0, 0, 0.05)),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 12),
                                                                                          Row(
                                                                                            children: [
                                                                                              SvgPicture.asset('assets/time_circle.svg'),
                                                                                              SizedBox(width: 4),
                                                                                              Text(
                                                                                                "Принимает пн-пт 8:00-19:00",
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: 16,
                                                                                                  height: 1.6,
                                                                                                  color: Color.fromRGBO(28, 27, 25, 1),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(height: 2),
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 36),
                                                                              Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                          "Ближайшие окна",
                                                                                          style: TextStyle(
                                                                                            fontFamily: 'Inter',
                                                                                            fontWeight: FontWeight.w400,
                                                                                            fontSize: 16,
                                                                                            height: 1.6,
                                                                                            color: Color.fromRGBO(28, 27, 25, 1),
                                                                                          )
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          SvgPicture.asset('assets/LeftArrowBig.svg'),
                                                                                          SizedBox(width: 8),
                                                                                          Text(
                                                                                            "13.02.04",
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'Inter',
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 16,
                                                                                              height: 1.6,
                                                                                              color: Color.fromRGBO(28, 27, 25, 1),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(width: 8),
                                                                                          SvgPicture.asset('assets/RightArrowBig.svg'),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(height: 16),
                                                                                  SizedBox(
                                                                                    height: 40, // Высота контейнера
                                                                                    child: ListView.builder(
                                                                                      scrollDirection: Axis.horizontal, // Прокручиваем в горизонтальном направлении
                                                                                      itemCount: times.length, // Количество элементов в списке
                                                                                      itemBuilder: (context, index) {
                                                                                        return Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                border: Border.all(width: 1.2, color: Color.fromRGBO(28, 27, 25, 0.12)),
                                                                                                borderRadius: BorderRadius.circular(4),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                                                                child: Text(
                                                                                                  times[index], // Время из массива
                                                                                                  style: TextStyle(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontWeight: FontWeight.w400,
                                                                                                      fontSize: 16,
                                                                                                      height: 1.6,
                                                                                                      color: Color.fromRGBO(28, 27, 25, 1)
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(width: 4),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 36),
                                                                                  GestureDetector(
                                                                                    child: (_education == false) ? Container(
                                                                                      height: 48,
                                                                                      decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(4),
                                                                                          border: Border.all(
                                                                                            color: Color.fromRGBO(28, 27, 25, 0.12),
                                                                                            width: 1.2,
                                                                                          )
                                                                                      ),
                                                                                      child: TextField(
                                                                                        enabled: false,
                                                                                        textAlign: TextAlign.left,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: "Образование",
                                                                                          hintStyle: TextStyle(color: Color.fromRGBO(28, 27, 25, 1), fontSize: 16, height: 1.6, fontWeight: FontWeight.w500, fontFamily: 'Inter'),
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
                                                                                    ) : SizedBox(height: 12),
                                                                                    onTap: () {
                                                                                      _education = true;
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ]
                                                                          ),
                                                                          SizedBox(height: 24),
                                                                          ElevatedButton(
                                                                            style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                                              fixedSize: MaterialStateProperty.all(Size(screenWidth - 40, 48)),
                                                                            ),
                                                                            onPressed: () {
                                                                              //onPressed
                                                                            },
                                                                            child: Text(
                                                                              'Записаться',
                                                                              style: TextStyle(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: Color(0xffFAF9F7)
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(height: 30),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            "Ближайшая дата 16.01.24",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color.fromRGBO(28, 27, 25, 1),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                                fixedSize: MaterialStateProperty.all(Size(screenWidth - 40, 48)),
                                              ),
                                              onPressed: () {
                                                //onPressed
                                              },
                                              child: Text(
                                                'Записаться',
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffFAF9F7)
                                                ),
                                              ),
                                            ),
                                          SizedBox(height: 16),
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