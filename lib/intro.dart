import 'package:Vorg/home.dart';
import 'helpers/colors.dart';
import 'helpers/strings.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: currentIndex != 2
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              PageView(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: <Widget>[
                  makePage(
                    image: 'assets/res/logo.png',
                    title: Strings.stepOneTitle,
                    content: Strings.stepOneContent,
                    reverse: false,
                  ),
                  makePage(
                    reverse: true,
                    image: 'assets/res/logo.png',
                    title: Strings.stepTwoTitle,
                    content: Strings.stepTwoContent,
                  ),
                  makePage(
                    image: 'assets/res/logo.png',
                    title: Strings.stepThreeTitle,
                    content: Strings.stepThreeContent,
                    reverse: false,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makePage(
      {required image,
      required title,
      required content,
      required bool reverse}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!reverse)
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(image),
                ),
                SizedBox(height: 30),
              ],
            ),
          Text(
            title,
            style: TextStyle(
              color: app_colors.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: app_colors.gray,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (reverse)
            Column(
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(image),
                ),
              ],
            ),
          if (currentIndex == 2)
            SizedBox(
              height: 50,
            ),
          // Added SizedBox to create space
          if (currentIndex == 2)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Finish'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: app_colors.secondary, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
