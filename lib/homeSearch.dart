import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  TextEditingController _searchController = TextEditingController();
  List<String> _supportList = [
    'Запись',
    'Журнал записей',
    'Услуги',
    'Врачи',
    'Услуги/врачи',
    'История оплат',
    'Бонусы',
    'Медкарта',
    'Профиль',
    'Пароль',
    'Телемедицина',
    'Акции'
  ];

  List<String> _filteredSupportList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterSupportList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSupportList() {
    List<String> filtered = _supportList.where((support) {
      if (support.isNotEmpty) {
        return support.toLowerCase().contains(
            _searchController.text.toLowerCase());
      }
      return false;
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
                    width: screenWidth / 1.76,
                    child: Text(
                      'Общий поиск',
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
                      'Ищите разделы приложения, записи, услуги',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.left,
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
                      hintText: 'Что вам нужно найти?',
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
                                // Handle the onTap event here
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
                                  trailing: SvgPicture.asset('assets/RightArrow.svg', color: Color.fromRGBO(221, 32, 6, 1)),
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