import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy/core/models/donation.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/medica_textform.dart';
import 'package:provider/provider.dart';

class MedicalSupplies extends StatefulWidget {
  @override
  State<MedicalSupplies> createState() => _MedicalSuppliesState();
}

class _MedicalSuppliesState extends State<MedicalSupplies> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  File? fileimage;

  late XFile? image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
     image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
       fileimage = File(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String usernum = storageHelper.readKey("id");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<DonationVM>(
          builder: (context, donationVM, child) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MedicaTextform(
                      medeicalController: nameController,
                      text: 'اسم المعدات',
                    ),
                    MedicaTextform(
                      medeicalController: quantityController,
                      text: 'الكمية',
                    ),
                    SizedBox(height: 30),
                    ButtonRounded(
                      width: 140,
                      onTap: () async {
                        final donation = Donation(
                          name: nameController.text,
                          quantity: int.parse(quantityController.text),
                          userId: int.parse(usernum),
                          type: "معدات",
                          shape: "غير محدد",
                        );

                        await donationVM.sendDonation(donation);

                        if (donationVM.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'حدث خطأ: ${donationVM.errorMessage}')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
                          );

                          nameController.clear();
                          quantityController.clear();
                        }
                      },
                      text: 'إرسال الطلب',
                    ),
                    if (donationVM.isLoading) CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}











