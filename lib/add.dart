import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umsonst_app_2/checkPost.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/components/onboard_input.dart';
import 'components/dropdown.dart';
import 'components/tabbar_button.dart';

enum SelectPhotoEnum { takePhoto, choosePhoto }

class MyAddWidget extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final List<String> _selectedPhotos = [];
  String _title = '';
  String _description = '';

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _selectedPhotos.add(photo.path.toString());
    }
  }

  Future<void> _choosePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      _selectedPhotos.add(photo.path.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 115),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: TabbarButtonWidget("Angebote", "Gesuche")),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 15),
                    child: Column(
                      children: [
                        PopupMenuButton(
                          icon: const Icon(
                            Icons.cloud_upload,
                            color: Color(0xFFFFD38A),
                          ),
                          iconSize: 100,
                          onSelected: (SelectPhotoEnum result) {
                            _onPressSelectPhoto(result);
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SelectPhotoEnum>>[
                            const PopupMenuItem<SelectPhotoEnum>(
                              value: SelectPhotoEnum.takePhoto,
                              child: Text('Foto machen'),
                            ),
                            const PopupMenuItem(
                              value: SelectPhotoEnum.choosePhoto,
                              child: Text('Foto auswählen'),
                            ),
                          ],
                        ),
                        const Text('Upload Picture'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: OnboardInput(
                      label: 'Titel',
                      initialValue: _title,
                      onChange: (value) {_title = value;},
                      validator: (String? value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: OnboardInput(
                      label: 'Ort',
                      validator: (String? value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: OnboardInput(
                      initialValue: _description,
                      onChange: (value) {_description = value;},
                      label: 'Beschreibung',
                      validator: (String? value) {},
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Kategorie"),
                          ),
                          Dropdown(values: [
                            "Elektronik",
                            "Hilfe",
                            "Klamotten",
                            "Krimskrams",
                            "Möbel",
                            "Spielzeug",
                            "Werkzeug",
                            "Wissen"
                          ]),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Transport"),
                          ),
                          Dropdown(values: [
                            "Hosentasche",
                            "Rucksack",
                            "Auto",
                            "LKW"
                          ]),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 120),
                    child: OnboardButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckPostWidget(title: _title, description: _description, images: _selectedPhotos)));
                      },
                      child: const Text(
                        'Teilen',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  void _onPressSelectPhoto(SelectPhotoEnum result) {
    if (result == SelectPhotoEnum.takePhoto) {
      _takePhoto();
      return;
    }
    if (result == SelectPhotoEnum.choosePhoto) {
      _choosePhoto();
      return;
    }
  }
}
