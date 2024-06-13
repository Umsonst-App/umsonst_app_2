import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'components/onboard_input.dart';

class DevModeScreenWidget extends StatelessWidget {
  final _controller = TextEditingController();

  DevModeScreenWidget({Key? key}) : super(key: key) {
      getCurrentServerAddress();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev Mode"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OnboardInput(
                label: 'Server address:',
                validator: (String? value) {},
                controller: _controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: OnboardButton(
                    onPressed: () => saveServerAddress(),
                    child: const Text("Save")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> saveServerAddress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("SERVER_ADDRESS", _controller.text.toString());
  }

  Future<void> getCurrentServerAddress() async {
    final prefs = await SharedPreferences.getInstance();
    String? address = prefs.getString("SERVER_ADDRESS");
    if(address != null) {
      print(address);
      _controller.text = address;
    }else{
      _controller.text = "http://.umsonstapp.de";
    }
  }
}
