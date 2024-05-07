import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'note4.dart';

class Note5 extends StatefulWidget {
  @override
  _NoteState5 createState() => _NoteState5();
}

class _NoteState5 extends State<Note5> {

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
                      'Выберите услугу',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1C1B19),
                        fontFamily: 'Inter',
                        height: 1,
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