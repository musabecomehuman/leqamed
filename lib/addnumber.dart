import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'support.dart';
import 'home.dart';

class AddNumber extends StatefulWidget {
  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {

  final numberController = TextEditingController();
  final countryController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  String _number = "";
  String _country = "Россия";

  List<String> _supportList = [
    'Австралия',
    'Австрия',
    'Азербайджан',
    'Россия',
  ];

  List<String> _filteredSupportList = [];

  @override
  void initState() {
    super.initState();
    _filteredSupportList = _supportList;
    _searchController.addListener(_filterSupportList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSupportList() {
    List<String> filtered = _supportList.where((support) {
      return support.toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();

    setState(() {
      _filteredSupportList = filtered;
    });
  }

  void _navigateToSupportScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support()),
    );
  }

  @override
  Widget build(BuildContext context) {
    countryController.text = _country;
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
                            'Телефон для связи',
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
                      'Последний шаг! Напишите свой актуальный номер телефона. Мы будем звонить вам для подтверждения записей',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 24),
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
                            bool isChanged = false;
                            DateTime? newSelectedDate;
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState) {
                                      return Padding (
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 24),
                                            Row(
                                              children: [
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
                                                  child: SvgPicture.asset('search.svg'),
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
                                                            countryController.text = _filteredSupportList[index];
                                                            _country = _filteredSupportList[index];
                                                            Navigator.pop(context);
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
                                                              trailing: SvgPicture.asset('assets/RightArrow.svg'),
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
                                        )
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
                              controller: countryController,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color.fromRGBO(28, 27, 25, 1), fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                        TextField(
                          cursorColor: Color(0xffDD2006),
                          controller: numberController,
                          onChanged: (value) {
                            setState(() {
                              _number = value;
                            });
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            prefixIcon: Container(
                              width: 18,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '+ 7',
                                    style: TextStyle(
                                      color: Color.fromRGBO(221, 32, 6, 1),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            hintText: 'Номер телефона',
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
                                      numberController.clear();
                                      setState(() {
                                        _number = '';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/clear_btn.svg',
                                      width: 20,
                                      height: 20,
                                      color: _number.isNotEmpty ? Color(0xff90908E) : Color(0xffFAF9F7),
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
                                if (1 == 1) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                }
                              },
                              child: Text(
                                'Создать аккаунт',
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
