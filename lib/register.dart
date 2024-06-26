import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'support.dart';
import 'login.dart';
import 'regcheck.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
  runApp(MyApp(onboardingComplete: onboardingComplete));
}

class MyApp extends StatelessWidget {
  final bool onboardingComplete;

  const MyApp({Key? key, required this.onboardingComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onboardingComplete ? Scaffold(
        backgroundColor: Color(0xffFAF9F7),
        body: MyRegistrationScreen(),
      ) : OnboardingWrapper(),
    );
  }
}

class OnboardingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkFirstTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return OnboardingScreen();
          } else {
            return MyRegistrationScreen();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> _checkFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
    return !onboardingComplete;
  }
}


class MyRegistrationScreen extends StatefulWidget {
  @override
  _MyRegistrationScreenState createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
  bool _emailError = false;
  bool _passwordError = false;
  String _email = '';
  String _password = '';
  bool _passwordVisible = false;
  bool _emailValid = false;
  bool _passwordValid = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _checkEmail(_email);
        _checkPassword(_password);
      }
    });
  }

  void _navigateToSupportScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support()),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _navigateToRegCheckScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegCheck()),
    );
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
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            'Регистрация',
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
                    width: 217,
                    child: Text(
                      'Зарегистрируйтесь, чтобы записываться на приём, просматривать медкарту и вести семейный профиль.',
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
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          controller: passwordController,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                              _passwordError = false;
                            });
                            _checkPassword(_password);
                          },
                          cursorColor: Color(0xffDD2006),
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            hintText: 'Пароль',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(144, 144, 142, 0.52),
                              fontSize: 16,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            suffixText: _passwordError ? '(6+ символов)' : null,
                            suffixStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(221, 32, 6, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
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
                        opacity: (_emailValid && _passwordValid) ? 1.0 : 0.5,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                              fixedSize: MaterialStateProperty.all(Size(screenWidth, 48))
                          ),
                          onPressed: () {
                            if (_emailValid && _passwordValid) {
                              _navigateToRegCheckScreen(context);
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: OutlinedButton(
                              onPressed: () {
                                // Handle Google registration
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                  fixedSize: MaterialStateProperty.all(Size(screenWidth, 52)),
                                  side: MaterialStateProperty.all(BorderSide(width: 1.2, color: Color.fromRGBO(28, 27, 25, 0.12)))
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8),
                                    SvgPicture.asset('assets/google_icon.svg', width: 20),
                                    Text(
                                      '  Регистрация с Google',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(28, 27, 25, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: OutlinedButton(
                              onPressed: () {
                                // Handle Apple registration
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                  fixedSize: MaterialStateProperty.all(Size(screenWidth, 52)),
                                  side: MaterialStateProperty.all(BorderSide(width: 1.2, color: Color.fromRGBO(28, 27, 25, 0.12)))
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8),
                                    SvgPicture.asset('assets/apple_icon.svg', width: 20),
                                    Text(
                                      '  Регистрация с Apple',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(28, 27, 25, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: OutlinedButton(
                              onPressed: () {
                                _navigateToLoginScreen(context);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                  fixedSize: MaterialStateProperty.all(Size(screenWidth, 52)),
                                  side: MaterialStateProperty.all(BorderSide(width: 1.2, color: Color.fromRGBO(28, 27, 25, 0.12)))
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8),
                                    Text(
                                      'Уже есть аккаунт? Войти',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(28, 27, 25, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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

  void _checkPassword(String password) {
    // Perform password validation
    if (password.isNotEmpty) {
      // Check if the password is at least 6 characters long
      if (password.length >= 6) {
        setState(() {
          _passwordValid = true;
          _passwordError = false;
        });
      } else {
        setState(() {
          _passwordValid = false;
          _passwordError = true;
        });
      }
    } else {
      setState(() {
        _passwordValid = false;
      });
    }
  }
}