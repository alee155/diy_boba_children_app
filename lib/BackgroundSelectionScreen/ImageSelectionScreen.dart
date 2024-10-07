import 'package:flutter/material.dart';

class ImageSelectionScreen extends StatefulWidget {
  const ImageSelectionScreen({super.key});

  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  List<String> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF92F3FF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
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
                ),
              ],
            ),
          ),
          Expanded(
            child: ImageGrid(
              images: const [
                'assets/images/bacgroundwallaper1.jpg',
                'assets/images/bacgroundwallaper2.jpg',
                'assets/images/bacgroundwallaper3.jpg',
                'assets/images/bacgroundwallaper4.jpg',
                'assets/images/bacgroundwallaper5.jpg',
                'assets/images/bacgroundwallaper6.jpg',
                'assets/images/bacgroundwallaper7.jpg',
                'assets/images/bacgroundwallaper8.jpg',
                'assets/images/bacgroundwallaper9.jpg',
                'assets/images/bacgroundwallaper10.jpg',
                'assets/images/bacgroundwallaper11.jpg',
                'assets/images/bacgroundwallaper12.jpg',
                'assets/images/bacgroundwallaper13.jpg',
                'assets/images/bacgroundwallaper14.jpg',
                'assets/images/bacgroundwallaper15.jpg',
              ],
              selectedImages: selectedImages,
              onImageSelected: (image) {
                setState(() {
                  if (selectedImages.contains(image)) {
                    selectedImages.remove(image);
                  } else {
                    selectedImages.add(image);
                  }
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              print("Selected Images: $selectedImages");
              Navigator.pop(context, selectedImages);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E2742),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<String> images;
  final List<String> selectedImages;
  final Function(String) onImageSelected;

  const ImageGrid({
    super.key,
    required this.images,
    required this.selectedImages,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final isSelected = selectedImages.contains(images[index]);
          return GestureDetector(
            onTap: () {
              // Clear the selectedImages list before adding the newly selected image
              selectedImages.clear();
              onImageSelected(images[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: isSelected ? Colors.yellow : Colors.black,
                  width: isSelected
                      ? 6.0
                      : 2.0, // Increase border size if selected
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
