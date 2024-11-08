// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MedicaTextform extends StatelessWidget {
  String text;
  TextEditingController medeicalController = TextEditingController();

  MedicaTextform({
    Key? key,
    required this.medeicalController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'myfont',
              color: Color(0xff08685a),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: medeicalController,
              decoration: InputDecoration(
                hintText: text,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      // color: Color(0xff08685a),
                      color: const Color.fromARGB(255, 228, 228, 228)),
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: const Color.fromARGB(255, 235, 235, 235),
                filled: true,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      // color: Color(0xff08685a),
                      color: const Color.fromARGB(255, 228, 228, 228)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
