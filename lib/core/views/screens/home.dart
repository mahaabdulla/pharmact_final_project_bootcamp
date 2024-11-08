import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/box_search.dart';
import 'package:pharmcy/core/views/widgets/drog_chip.dart';
import 'package:pharmcy/core/views/widgets/grade_view.dart';
import 'package:pharmcy/core/views/widgets/markiting.dart';
import 'package:pharmcy/core/views/widgets/navbar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor:    const Color.fromARGB(255, 201, 222, 216),
          actions: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                'الصفحة الرئيسة',
                style: TextStyle(
                  fontFamily: 'myfont',
                  fontSize: 25,
                  color: Colors.black
                ),
              ),
            ),
           
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  BoxSearch(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 300,
                      height: 150,
                      child: MarketingImages()),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الفئات و الأقسام',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'myfont',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //caytgurys
                  const AppGridList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
