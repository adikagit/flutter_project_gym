import 'package:adigym/const.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class NeuTextFiled extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final bool autofocus;
  const NeuTextFiled({
    Key? key,
    this.hint,
    this.controller,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.autofocus = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClayContainer(
          color: boxColor,
          borderRadius: 25,
          depth: -30,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: appPadding, vertical: 5),
            child: TextField(
              keyboardType: keyboardType,
              textAlign: textAlign,
              controller: controller,
              style: const TextStyle(fontSize: 18),
              autofocus: autofocus,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                  ),
                  border: InputBorder.none,
                  fillColor: black),
            ),
          ),
        ),
      ],
    );
  }
}
