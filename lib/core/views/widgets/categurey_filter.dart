import 'package:flutter/material.dart';

class CateguryFilter extends StatelessWidget {
  const CateguryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 134, 206, 189),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 30,
              width: 80,
              alignment: Alignment.center,
              child: Text(
                'cat',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
