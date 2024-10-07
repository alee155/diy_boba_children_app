import 'package:diy_boba/JuiceScreen/Banana.dart';
import 'package:diy_boba/JuiceScreen/Cholocate.dart';
import 'package:diy_boba/JuiceScreen/Gauva.dart';
import 'package:diy_boba/JuiceScreen/Grapes.dart';
import 'package:diy_boba/JuiceScreen/Mango.dart';
import 'package:diy_boba/JuiceScreen/MilkShake.dart';
import 'package:diy_boba/JuiceScreen/Mint.dart';
import 'package:diy_boba/JuiceScreen/Orange.dart';
import 'package:diy_boba/JuiceScreen/Strawberry.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF92F3FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.0,
                        color: const Color.fromARGB(255, 2, 53, 95),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 2, 53, 95),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Sora-VariableFont_wght.ttf',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 53, 95),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Drinks",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Sora-VariableFont_wght.ttf',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 53, 95),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoundedContainer(
                      color: Color(0xFF88BD21),
                      text: 'Mint',
                      secondText: 'Drink',
                      imagePath: 'assets/images/con1.png',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFFA77037),
                      imagePath: 'assets/images/con2.png',
                      text: 'Cholocate',
                      secondText: 'Drink',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFFFE8E00),
                      imagePath: 'assets/images/con3.png',
                      text: 'Orange',
                      secondText: 'Drink',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoundedContainer(
                      color: Color(0xFFCA8FBD),
                      text: 'Grapes',
                      secondText: 'Drink',
                      imagePath: 'assets/images/con4.png',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFFFFBE31),
                      imagePath: 'assets/images/con5.png',
                      text: 'Mango',
                      secondText: 'Drink',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFFFB7D8A),
                      imagePath: 'assets/images/con6.png',
                      text: 'Strawberry',
                      secondText: 'Drink',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoundedContainer(
                      color: Color(0xFFFFBE31),
                      text: 'Banana',
                      secondText: 'Drink',
                      imagePath: 'assets/images/con7.png',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFFEFB58B),
                      imagePath: 'assets/images/con8.png',
                      secondText: 'Drink',
                      text: 'MilkShake',
                    ),
                    SizedBox(width: 16.0),
                    RoundedContainer(
                      color: Color(0xFF9FB660),
                      imagePath: 'assets/images/con9.png',
                      secondText: 'Drink',
                      text: 'Gauva',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String text;
  final String secondText;

  const RoundedContainer({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.text,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding page based on the text
        _navigateToDetailsPage(context, text);
      },
      child: Container(
        width: 150.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        child: Stack(
          children: [
            // Positioned widget to place the First Text in the top-left corner
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Anton-Regular.ttf',
                  // fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            // Positioned widget to place the Image in the bottom-right corner
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
              ),
            ),
            // Positioned widget to place the Second Text below the First Text
            Positioned(
              top: 40.0,
              left: 10.0,
              child: Text(
                secondText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'Anton-Regular.ttf',
                  // fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, String category) {
    // Create a mapping of categories to their respective pages
    Map<String, WidgetBuilder> pages = {
      'Mint': (_) => const Mint(),
      'Cholocate': (_) => const Cholocate(),
      'Orange': (_) => const Orange(),
      'Grapes': (_) => const Grapes(),
      'Mango': (_) => const Mango(),
      'Strawberry': (_) => const Strawberry(),
      'Banana': (_) => const Banana(),
      'MilkShake': (_) => const MilkShake(),
      'Gauva': (_) => const Gauva(),
    };

    // Navigate to the corresponding page
    Navigator.push(
      context,
      MaterialPageRoute(builder: pages[text]!),
    );
  }
}

class DrinkDetailsPage extends StatelessWidget {
  final String category;

  const DrinkDetailsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text('Details for $category'),
      ),
    );
  }
}
