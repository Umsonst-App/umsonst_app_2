import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';

import 'components/feedCardImageWithBorder.dart';
import 'menu.dart';

class FeedDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;
  List<Widget> carouselImages = [];
  CarouselController controller = CarouselController();

  FeedDetailScreen(
      {required this.title,
      required this.description,
      required this.images,
      Key? key})
      : super(key: key) {
    for (var element in images) {
      carouselImages.add(
        FeedCardImageWidthBorder(image: element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf1f1f1),
      appBar: AppBar(
          title: const Text(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFFF918A)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainMenuWidget()));
              },
            )
          ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: CarouselSlider(
                          items: carouselImages,
                          carouselController: controller,
                          options: CarouselOptions(
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {},
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 25, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.place,
                                color: Color(0xFFFF918A),
                                size: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  "Siegen",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text(
                                  "HANDLICH",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.info,
                                size: 32,
                                color: Color(0xFFFF918A),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 35, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'Kalam',
                            height: 1,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF918A),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 25, left: 35, right: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Color(0xFF432F28),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                OnboardButton(
                    onPressed: () {},
                    child: const Text(
                      "Nachricht senden",
                      style: TextStyle(color: Color(0xFF432F28)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
