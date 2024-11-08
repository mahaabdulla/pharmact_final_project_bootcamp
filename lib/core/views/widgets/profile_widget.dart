// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  TextEditingController controller;
  String text;
  IconData icons;
  ProfileWidget({
    Key? key,
    required this.controller,
    required this.text,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(fontFamily: 'myfont', fontSize: 20),
              prefixIcon: Icon(
                icons,
                color: const Color(0xff459b8e),
              ))));
  }
}
