import 'package:diy_boba/WelcomeScreen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  final pages = [
    //White Page
    Container(
      color: const Color(0xFF92F3FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Text(
                    "Enjoye Drink",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Sora-VariableFont_wght.ttf',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 53, 95),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SkipButton(),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/hop.png",
              height: 300,
              width: 300, // Set the width as desired
            ),
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Enjoy quality brew",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "with the finest of",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Text(
                "flavours",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Sora-VariableFont_wght.ttf',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 53, 95),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'The best gain, the finest roast',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'the powerful flavor.',
                  style: TextStyle(
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontSize: 18,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    "Fun with Friends",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Sora-VariableFont_wght.ttf',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 53, 95),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SkipButton(),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/hop2.png",
              height: 300,
              width: 300, // Set the width as desired
            ),
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Enjoy quality brew",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "with the finest of",
                  style: TextStyle(
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Text(
                "flavours",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Sora-VariableFont_wght.ttf',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 53, 95),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'The best gain, the finest roast',
                  style: TextStyle(
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontSize: 18,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'the powerful flavor.',
                  style: TextStyle(
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontSize: 18,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    //Orange Page
    Container(
      color: const Color(0xFFe1492a),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    "Fun with Friends",
                    style: TextStyle(
                      fontFamily: 'Sora-VariableFont_wght.ttf',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SkipButton(),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/straw.png",
              height: 300,
              width: 300, // Set the width as desired
            ),
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Enjoy quality brew",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "with the finest of",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "flavours",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Sora-VariableFont_wght.ttf',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'The best gain, the finest roast',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'the powerful flavor.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: GoToHomeButton()),
            ],
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        fullTransitionValue: 300,
        slideIconWidget: Lottie.asset(
          'assets/images/animated_leftarrow.json',
          width: 64,
        ),
        positionSlideIcon: 0.5,
        enableLoop: false,
        waveType: WaveType.liquidReveal,
        onPageChangeCallback: (int page) {
          // Check if the last page is reached
          if (page == pages.length - 1) {
            // Show the "Get Started" button
            // You can customize this part according to your UI
            // For example, you might want to display a button at the bottom of the screen
            // or add a delay before showing the button to guide the user.
          }
        },
      ),
    );
  }
}

//Class for Go To Home Button
class GoToHomeButton extends StatelessWidget {
  const GoToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasSeenOnboardingScreen', true);
        bool updatedvalue = prefs.getBool('hasSeenOnboardingScreen') ?? false;
        print('hasSeenOnboardingScreen in onboarding screen $updatedvalue');
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const MyWelcomeScreen(),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: const Center(
            child: Text(
          'Start',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 2, 53, 95),
          ),
        )),
      ),
    );
  }
}

// Class for Skip Button
class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyWelcomeScreen()));
      },
      child: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
