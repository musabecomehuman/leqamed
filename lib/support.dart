import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(221, 32, 6, 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Написать нам',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(250, 249, 247, 1),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: SvgPicture.asset('assets/edit_square.svg'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: screenWidth / 1.76,
                    child: Text(
                      'Возникли сложности?',
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
                      'Мы собрали для вас инструкции по всем разделам приложения на всевозможные темы:',
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
                            if (index != _filteredSupportList.length - 1) // Check if it's not the last item
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