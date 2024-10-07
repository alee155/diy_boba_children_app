import 'package:diy_boba/RotationScreens/GrapesRotationScreen.dart';
import 'package:flutter/material.dart';

import '../BackgroundSelectionScreen/ImageSelectionScreen.dart';

class Grapes extends StatefulWidget {
  const Grapes({Key? key}) : super(key: key);

  @override
  _GrapesState createState() => _GrapesState();
}

class _GrapesState extends State<Grapes> {
  List<String> selectedImageAssets = ['assets/images/sea.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedImageAssets
                      .first), // Use the first selected image
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 10.0,
            child: Container(
              height: 35,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3.0, // Adjust the border width
                  color: const Color.fromARGB(255, 2, 53, 95),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
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
          ),
          Positioned(
            top: 50.0,
            right: 2.0,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  final selectedImages = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageSelectionScreen()),
                  );

                  if (selectedImages != null &&
                      selectedImages is List<String> &&
                      selectedImages.isNotEmpty) {
                    setState(() {
                      selectedImageAssets = selectedImages;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1e2742),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'BG ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 220.0,
            right: 20,
            child: Image.asset(
              'assets/images/img3.png',
              width: 400.0,
              height: 470.0,
            ),
          ),
          Positioned(
            top: 600.0,
            right: 280,
            child: Image.asset(
              'assets/images/leaves.png',
              width: 130.0,
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 110.0,
            right: 110.0,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GrapesRotationScreen(
                        selectedImageAssets: selectedImageAssets,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFfcb721),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  side: const BorderSide(
                    color: Color(0xFFd67424),
                     width: 4.0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'D R I N K',
                      style: TextStyle(
                        fontSize: 18,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.0
                          ..color = Colors.white, // Set the color of the stroke
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'D R I N K',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 2, 53, 95),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
