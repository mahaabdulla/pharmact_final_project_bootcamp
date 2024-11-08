// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget widget;
  MyWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 170,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 76, 175, 157),
        // image: DecorationImage(
        //     image: AssetImage('assets/images/virtical_image.jpeg'),
        //     fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: widget,
    );
  }
}
