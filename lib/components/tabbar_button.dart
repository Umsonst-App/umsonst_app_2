import 'package:flutter/material.dart';

class TabbarButtonWidget extends StatefulWidget {

  String firstButtonLabel;
  String secondButtonLabel;

  TabbarButtonWidget(this.firstButtonLabel, this.secondButtonLabel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TabbarButtonState(firstButtonLabel, secondButtonLabel);
  }
}

class TabbarButtonState extends State<TabbarButtonWidget> {
  String firstButtonLabel;
  String secondButtonLabel;
  TabbarButtonState(this.firstButtonLabel, this.secondButtonLabel);
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(160, 26)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(bottom: 16, top: 16, left: 40, right: 40),
                ),
                elevation: selectedIndex == 0 ? MaterialStateProperty.all(10) : MaterialStateProperty.all(1),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFFFD38A)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: Text(firstButtonLabel),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(160, 26)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(bottom: 16, top: 16, left: 40, right: 40),
                ),
                elevation: selectedIndex == 1 ? MaterialStateProperty.all(10) : MaterialStateProperty.all(1),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFFF918A)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Text(secondButtonLabel),
          ),
        ),
      ],
    );
  }
}

