import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:umsonst_app_2/components/dropdown.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/main.dart';

class OnboardingLocation extends StatelessWidget {

  const OnboardingLocation({Key? key})
      : super(key: key);

  Future<void> _showAlertDialog(context, Widget title, List<Widget> body,
      callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: ListBody(
              children: body,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                callback();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Position> _determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showAlertDialog(
          context,
          const Text("Error"),
          [const Text("Location services are disabled.")],
              () => {print("Enable location")});
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _showAlertDialog(
            context,
            const Text("Error"),
            [const Text("Location permissions are denied.")],
                () => {print("Enable location")});
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _showAlertDialog(
          context,
          const Text("Error"),
          [
            const Text(
                "Location permissions are permanently denied, we cannot request permissions. Go into settings and set permissions manually.")
          ],
              () => {print("Enable location")});
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                    height: 200,
                    width: 275,
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.place,
                      color: Color(0xFFFFD38A),
                      size: 100,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 48),
                child: Text(
                  'Mein Standort',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Kalam',
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF918A),
                  ),
                ),
              ),
              const Text(
                'Die umsonstApp wirkt in deinem Umfeld und verbindet dich mit anderen Menschen für’s Teilen.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6A6A6A),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: OnboardButton(
                  onPressed: () => {getCurrentLocation(context)},
                  child: const Text(
                    'Standort freigeben',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 72.0),
                child: const Text(
                  'oder wähl‘ deine Region',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6A6A6A),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Dropdown(values: [
                    "Baden-Württemberg",
                    "Bayern",
                    "Berlin",
                    "Brandenburg",
                    "Bremen",
                    "Hamburg",
                    "Hessen",
                    "Mecklenburg-Vorpommern",
                    "Niedersachsen",
                    "Nordrhein-Westfahlen",
                    "Rheinland-Pfalz",
                    "Saarland",
                    "Sachsen",
                    "Sachsen-Anhalt",
                    "Scleswig-Holstein",
                    "Thüringen"
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCurrentLocation(context) {
    _determinePosition(context).then((Position location) {
      print(location);
      _showAlertDialog(
          context,
          const Text("Location found:"),
          [
            Text("Longitude: ${location.longitude}"),
            Text("Latitude: ${location.latitude}"),
            Text("Altitude: ${location.altitude}"),
            Text("Accuracy: ${location.accuracy}"),
          ],
              () => {print("Enable location")}
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyMainWidget()),
      );
    });
  }
}
