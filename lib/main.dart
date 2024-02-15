import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyRegistrationScreen(),
      ),
    );
  }
}

class MyRegistrationScreen extends StatefulWidget {
  @override
  _MyRegistrationScreenState createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
  bool _emailError = false;
  String _emailErrorText = '';
  String _email = '';
  bool _passwordVisible = false;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Регистрация',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color:Color(0xff1C1B19), fontFamily: 'Inter'),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Register to book an appointment, view medical card, and manage family profile',
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  controller: emailController,
                  focusNode: focusNode,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                      _emailError = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    labelText: 'Enter your email',
                    errorText: _emailError ? _emailErrorText : null,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        emailController.clear();
                        setState(() {
                          _email = '';
                          _emailValid = false;
                        });
                      },
                      child: Icon(
                        Icons.clear,
                        color: _email.isNotEmpty ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _checkEmail(_email);
                      });
                    },
                    child: Icon(
                      _emailValid ? Icons.check_circle : Icons.circle_outlined,
                      color: _emailValid ? Colors.green : Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              _emailError ? 'Invalid email address' : '',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                labelText: 'Enter your password',
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
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // Handle registration button press
              },
              child: Text('Next'),
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Handle Google registration
                  },
                  child: SvgPicture.asset('assets/google_icon.svg', width: 20),
                ),
                Text('  Регистрация с Google'),
              ],
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Handle Apple registration
                  },
                  child: SvgPicture.asset('assets/apple_icon.svg', width: 20),
                ),
                Text('  Регистрация с Apple'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle 'Already have an account? Login' press
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16),
              ),
            ),
          ),
        ],
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
          _emailErrorText = 'Please enter a valid email address';
        });
      }
    } else {
      setState(() {
        _emailValid = false;
      });
    }
  }
}