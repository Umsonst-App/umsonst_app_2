import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';

class CameraScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  // Pick an image
  // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  // Capture a photo
  CameraScreen({Key? key}) : super(key: key);

  Future<void> takeFoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    print(photo);
  }

  Future<void> pickFoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    print(photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: OnboardButton(
                onPressed: takeFoto,
                child: const Text(
                  'Take Foto',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: OnboardButton(
                onPressed: pickFoto,
                child: const Text(
                  'Choose Foto',
                  style: TextStyle(
                    color: Colors.black,
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
