import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  children: List.generate(
                      150 ~/ 5,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : const Color.fromARGB(255, 245, 243, 243),
                              height: 2,
                            ),
                          )),
                );
  }
}