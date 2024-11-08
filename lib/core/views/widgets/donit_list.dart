import 'package:flutter/material.dart';

class DonitList extends StatelessWidget {
  const DonitList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ListView.builder(
        itemCount: 30,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: Image.asset('assets/images/pillsgrey.png'),
              title: Text(
                'اسم الدواء :',
                textDirection: TextDirection.rtl,
              ),
              subtitle: Text(
                'الكمية :',
              
              ),
              trailing: InkWell(
                  child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: Center(child: Text('الحاله')),
              )),
            ),
          );
        },
      ),
    );
  }
}
