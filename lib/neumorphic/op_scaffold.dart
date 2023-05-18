import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpScaffold extends StatelessWidget {
  final String appBarText;
  final Widget body;
  final String floatingActionButtonText;
  final VoidCallback floatingActionOnTapButton;
  const OpScaffold(
      {Key? key,
      required this.body,
      required this.appBarText,
      required this.floatingActionButtonText,
      required this.floatingActionOnTapButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey),
        ),
        title: Text(
          appBarText, //widget.status == 'add' ? 'Добавление' : 'Обновление',
          style: sub1,
        ),
        centerTitle: true,
      ),
      body: body,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.maxFinite,
        child: NeuButton(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          color: boxColor2,
          borderRadius: BorderRadius.circular(16),
          onTap: floatingActionOnTapButton,
          child: Text(
            floatingActionButtonText,
            style: sub2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
