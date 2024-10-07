import 'package:diy_boba/HomeScreen/HomeScreen.dart';
import 'package:diy_boba/Rating/show_rating_dialog.dart';
import 'package:diy_boba/Settingss/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyWelcomeScreen extends StatefulWidget {
  const MyWelcomeScreen({Key? key}) : super(key: key);

  @override
  _MyWelcomeScreenState createState() => _MyWelcomeScreenState();
}

class _MyWelcomeScreenState extends State<MyWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        RatingDialogManager.showRatingDialog(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Get Start.png'), // Use the first selected image
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              right: 10.0,
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Color(0xFF1E2742),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const MySettings()));
                },
              ),
            ),
            Positioned(
              top: 220.0,
              child: Image.asset(
                'assets/images/glass.png',
                width: 400.0,
                height: 470.0,
              ),
            ),
            Positioned(
              top: 685.0,
              left: 113.0,
              child: Image.asset(
                'assets/images/Ellipse.png',
                width: 150.0,
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 90.0,
              right: 90.0,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E2742),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
