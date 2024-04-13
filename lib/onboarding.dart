import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'register.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 4) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        currentPage++;
      });
    }
  }

  void completeOnboarding() async {

    _pageController.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.ease);

    // Здесь вы можете добавить код для сохранения состояния завершения онбординга
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyRegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 68, horizontal: 20),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    child: SvgPicture.asset('assets/close.svg'),
                    onTap: () {
                      completeOnboarding();
                    },
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                        (index) => buildDot(index: index),
                  ),
                ),
              ]
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                OnboardingPage(
                  title: 'Добро пожаловать!',
                  description: 'Данное приложение — полноценное медицинское пространство. С нами ваше взаимодействие с медициной станет легче и комфортнее.',
                ),
                OnboardingPage(
                  title: 'Мы объединились',
                  description: 'Мы — клиники «Легамед», «Диагности-ческий центр Легамед», «Доктор Заботик» создали совместное приложение, чтобы предоставлять вам максимальный спектр медицинских услуг',
                ),
                OnboardingPage(
                  title: 'Всё для здоровья',
                  description: 'У наших клиник разные направленности: лечение, диагностика и детская клиника. Максимум направлений, услуг и врачей, которые наконец помогут решить любую  вашу проблему со здоровьем.',
                ),
                OnboardingPage(
                  title: 'Лучшая организация',
                  description: 'Все ваши медицинские данные будут удобно и компактно организованы. Вы больше не сможете потерять даже самые старые результаты анализов, ибо все будет храниться здесь',
                ),
                OnboardingPage(
                  title: 'Онлайн-запись',
                  description: 'Больше никаких очередей за талончиками и звонков в регистратуру. А удобная онлайн-запись. Вы можете спокойно посмотреть всю информацию, ',
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffDD2006)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                  fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 48))
              ),
              onPressed: currentPage == 4 ? completeOnboarding : nextPage,
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
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 0),
      height: 5,
      width: (MediaQuery.of(context).size.width - 80) / 5,
      decoration: BoxDecoration(
        color: currentPage >= index ? Color.fromRGBO(221, 32, 6, 1) : Color.fromRGBO(28, 27, 25, 0.04),
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, fontFamily: 'Inter'),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
          ),
        ],
      ),
    );
  }
}