import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isOn = false;

  // static Color onColor = const Color(0xFFFF103B);
  // static Color offColor = const Color(0xFFE9E9E9);
  static const imageOn = './images/heart_full.svg';
  static const imageOff = './images/heart_empty.svg';

  void toggle() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggle,
        child: SvgPicture.asset(
          isOn ? imageOn : imageOff,
        ));
  }
}
