import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/feedCardImage.dart';

import '../feedDetailScreen.dart';

class FeedCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;
  final bool localImage;

  FeedCardWidget({required this.title, required this.description, required this.images, this.localImage = false});

  @override
  _FeedCardWidgetState createState() => _FeedCardWidgetState(
      title: title, description: description, images: images, localImage: localImage);
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  final String title;
  final String description;
  final List<String> images;
  final bool localImage;
  List<Widget> carouselImages = [];

  _FeedCardWidgetState(
      {required this.title, required this.description, required this.images, required this.localImage}) {
    for (var element in images) {
      carouselImages.add(
        FeedCardImage(image: element, localImage: localImage),
      );
    }
  }

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FeedDetailScreen(
                        title: title,
                        description: description,
                        images: images,
                      )));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 5,
          margin:
              const EdgeInsets.only(right: 15, left: 15, bottom: 7.5, top: 7.5),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CarouselSlider(
                  items: carouselImages,
                  carouselController: controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: carouselImages.length > 1,
                    onPageChanged: (index, reason) {},
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 16, right: 5),
                child: ListTile(
                  title: Text(title),
                  subtitle: Text(description),
                  trailing: Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.reply,
                        color: Color(0xFFFF918A),
                      ),
                    ),
                    Icon(
                      Icons.send,
                      color: Color(0xFFFF918A),
                    ),
                  ], mainAxisSize: MainAxisSize.min),
                ),
              ),
            ],
          ),
        ));
  }
}
