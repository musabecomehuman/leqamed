import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'login.dart';
import 'support.dart';

class Recovery extends StatefulWidget {
  @override
  _RecoveryState createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  bool _emailError = false;
  String _email = '';
  bool _emailValid = false;
  final emailController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _checkEmail(_email);
      }
    });
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _navigateToSupportScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 64),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _navigateToLoginScreen(context);
                          });
                        },
                        child: SvgPicture.asset('assets/LeftArrowBig.svg'),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            ' Вход',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color:Color(0xff1C1B19), fontFamily: 'Inter'),
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
                      'Восстановление пароля',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color:Color(0xff1C1B19), fontFamily: 'Inter'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 217,
                    child: Text(
                      'Чтобы восстановить забытый пароль, введите свою электронную почту в поле ниже',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(144, 144, 142, 0.52),
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 39),
                  Container(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      _emailError ? 'Такой почты не существует' : '',
                      style: TextStyle(color: Color(0xffDD2006), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          cursorColor: Color(0xffDD2006),
                          controller: emailController,
                          focusNode: focusNode,
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                              _emailError = false;
                            });
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            hintText: 'Электронная почта',
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
                                  Visibility(
                                    visible: _emailValid,
                                    child: SvgPicture.asset(
                                      'assets/ratio_btn.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      emailController.clear();
                                      setState(() {
                                        _email = '';
                                        _emailValid = false;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/clear_btn.svg',
                                      width: 20,
                                      height: 20,
                                      color: _email.isNotEmpty ? Color(0xff90908E) : Color(0xffFAF9F7),
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
                  SizedBox(height: 16),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Opacity(
                        opacity: (_emailValid && _emailValid) ? 1.0 : 0.5,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                              fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                          ),
                          onPressed: () {
                            // Handle registration button press
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _checkEmail(String email) {
    // Perform email validation
    if (email.isNotEmpty) {
      // Add your custom email validation logic here
      // For example, check if the email contains '@' and '.com'
      if (EmailValidator.validate(email)) {
        setState(() {
          _emailValid = true;
          _emailError = false;
        });
      } else {
        setState(() {
          _emailValid = false;
          _emailError = true;
        });
      }
    } else {
      setState(() {
        _emailValid = false;
      });
    }
  }
}