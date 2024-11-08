import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/screens/donait/donation_form.dart';
import 'package:pharmcy/core/views/screens/donait/donits.dart';
import 'package:pharmcy/core/views/screens/donait/medeical_supplis.dart';
import 'package:pharmcy/core/views/screens/donait/my_donit.dart';

class AddDrug extends StatelessWidget {
  const AddDrug({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff08685a),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          centerTitle: true,
          title: const Text(
            'التبرعات',
            style: TextStyle(color: Colors.white, fontFamily: 'myfont'),
          ),
        ),
        body: DonationForm(),
         /*Column(children: [
          const TabBar(tabs: [
            Tab(
              text: 'معدات طبية',
              icon: Icon(
                Icons.medical_services,
                color: Color(0xff08685a),
              ),
            ),
            Tab(
              text: 'أدوية',
              icon: Icon(
                Icons.h_plus_mobiledata_sharp,
                color: Color(0xff08685a),
              ),
            )
          ]),
          Expanded(
            child: TabBarView(children: [
              MedicalSupplies(),
              DonationForm(),
            ]),
          )
        ]),*/
      ),
    );
  }
}
