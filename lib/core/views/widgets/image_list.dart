import 'package:flutter/material.dart';

class ImageListDrug extends StatelessWidget {
  const ImageListDrug({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10),
      padding: EdgeInsets.only(top: 10),
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 134, 206, 189),
        borderRadius: BorderRadius.circular(10),
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(10),
      //   child: ColorFiltered(
      //     colorFilter: ColorFilter.mode(
      //       const Color.fromARGB(255, 127, 207, 199).withOpacity(0.5),
      //       BlendMode.srcOver,
      //     ),
      //     child: Image.asset(
      //       'assets/images/drug_grey.png',
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }
}
