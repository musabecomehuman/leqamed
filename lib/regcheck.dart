import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'support.dart';

class RegCheck extends StatefulWidget {
  @override
  _RegCheckState createState() => _RegCheckState();
}

class _RegCheckState extends State<RegCheck> {
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());

  void _navigateToSupportScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support()),
    );
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                  SizedBox(height: 80),
                  Container(
                    child: Text(
                      'Ваш код',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, fontFamily: 'Inter', color:Color(0xff1C1B19)),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      'Мы отправили проверочный код на вашу почту в целях безопасности',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return MyTextField(
                        index: index,
                        focusNode: _focusNodes[index],
                        controller: _controllers[index],
                      );
                    }),
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

class MyTextField extends StatefulWidget {
  final int index;
  final FocusNode focusNode;
  final TextEditingController controller;

  MyTextField({required this.index, required this.focusNode, required this.controller});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  Color borderColor = Color.fromRGBO(11, 13, 7, 0.12);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          decoration: null,
          cursorColor: Color(0xffDD2006),
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Inter', color: Color(0xff1C1B19)),
          maxLength: 1,
          onChanged: (value) {
            if (value.isNotEmpty) {
              widget.focusNode.nextFocus();
            }
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        borderColor = widget.focusNode.hasFocus ? Color(0xff1C1B19) : Color.fromRGBO(11, 13, 7, 0.12);
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(() {});
    super.dispose();
  }
}