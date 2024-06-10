import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:ui';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:umsonst_app_2/feed.dart';
import 'package:umsonst_app_2/model/api/api.dart';
import 'package:umsonst_app_2/onboard/onboard_carousel.dart';
import 'add.dart';
import 'chat.dart';
import 'menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await SentryFlutter.init(
          (options) {
        options.dsn = 'https://<code>@sentry.goeke.it/4';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const UmsonstApp()),
    );
  });
}

class UmsonstApp extends StatelessWidget {
  const UmsonstApp({Key? key}) : super(key: key);

  static const String _title = 'Umsonst APP';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
        title: _title,
        home: Scaffold(
          body: OnboardCarousel(),
        ));
  }
}

class MyWelcomeWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _namePerson = '';
  String _emailPerson = '';
  String _passwordPerson = '';
  LoginResponse Temp_change = LoginResponse(uid: "");

  Future _sigupUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var json = jsonEncode(<String, String>{
        'username': _namePerson,
        'email': _emailPerson,
        'password': _passwordPerson
      });
      final response = await http.post(
        Uri.parse('http://api.localhost.local:5000/v1/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json,
      );

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.

        Temp_change = LoginResponse.fromJson(jsonDecode(response.body));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyMainWidget()),
              (r) => false,
        );
      }
      if (response.statusCode == 400) {
        return ErrorResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        print(json);
        throw Exception('Failed to create album.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Hey, sag uns wie du heist 🥺';
              }
              _namePerson = value;
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'E-Mail',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bitte sag uns deine E-Mail Adresse';
              }
              _emailPerson = value;
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (value.length < 8) {
                return 'Passwort muss 8 Stellig sein';
              }
              _passwordPerson = value;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () => _sigupUser(context),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyMainWidget extends StatefulWidget {
  const MyMainWidget({Key? key}) : super(key: key);

  @override
  State<MyMainWidget> createState() => _MyMainWidget();
}

class _MyMainWidget extends State<MyMainWidget> {
  int _navBarIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    FeedWidget(),
    MyAddWidget(),
    MyChatSelectWidget(),
    const MyChatWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text(
            'umsonstApp',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Kalam',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF918A),
            ),
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
              child: Container(
                color: Colors.white10,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xB3FFFFFF),
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
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_navBarIndex),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) {
          print(val);
          setState(() => {_navBarIndex = val});
        },
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBorderRadius: 50,
        borderRadius: 50,
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFFF918A),
        unselectedItemColor: const Color(0xFFFF918A),
        selectedBackgroundColor: Colors.transparent,
        currentIndex: _navBarIndex,
        items: [
          FloatingNavbarItem(
              customWidget:
              const Icon(Icons.search, size: 35, color: Color(0xFFFF918A))),
          FloatingNavbarItem(
              customWidget: const Icon(Icons.add_circle,
                  size: 35, color: Color(0xFFFF918A))),
          FloatingNavbarItem(
              customWidget: const Icon(Icons.chat_bubble,
                  size: 35, color: Color(0xFFFF918A))),
        ],
      ),
    );
  }
}