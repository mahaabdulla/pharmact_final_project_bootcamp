import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pharmcy/core/models/donation.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/medica_textform.dart';
import 'package:provider/provider.dart';

import '../../../../helper/storage_helper.dart';

class DonationForm extends StatefulWidget {
  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  DateTime? selectedDate;
    String? selectedForm;
  final List<String> drugForms = [
    'حبوب',
    'شراب',
    'إبر',
    'قطر',
    'مرهم',
    'أشكال أخرى',
  ];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  StorageHelper storageHelper = StorageHelper.instance;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController shapeController = TextEditingController();

  final TextEditingController typeController = TextEditingController();

  final TextEditingController expireDateController = TextEditingController();
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
    String formattedDate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : 'لا يوجد تاريخ محدد';
    String usernum = storageHelper.readKey("id");
    return Scaffold(
      body: Consumer<DonationVM>(
        builder: (context, donationVM, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MedicaTextform(
                    medeicalController: nameController,
                    text: 'اسم الدواء',
                  ),
                  MedicaTextform(
                    medeicalController: quantityController,
                    text: 'الكمية',
                  ),
                  SizedBox(height: 10,),
                  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'شكل الدواء',
                                style: TextStyle(fontSize: 14,fontFamily: 'myfont',color: Color(0xff08685a)),
                              ),
                              Container(
                                decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 228, 228, 228),
                                ),
                                width: 200,
                                child: DropdownButton<String>(
                                  hint: const Text('اختر شكل الدواء'),
                                  value: selectedForm,
                                  items: drugForms.map((String form) {
                                    return DropdownMenuItem<String>(
                                      value: form,
                                      child: Text(form),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedForm = newValue;
                                     // print(selectedForm);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                            SizedBox(height: 10,),
                          
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('تاريخ انتهاء الصلاحية', style: TextStyle(fontSize: 14,fontFamily: 'myfont',color: Color(0xff08685a),),),
                        Text(selectedDate == null? '': '${formattedDate}' ),
            SizedBox(height: 20),
            ElevatedButton(
             style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 54, 152, 131), // لون الخلفية
              onPrimary: Colors.white, // لون النص
            ),
              onPressed: () => _selectDate(context),
              child: Text('اختر'),
            ),
                    ],),
                  SizedBox(height: 20),
                    InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2/3,
                      height: 250,
                      color: Color.fromARGB(255, 228, 228, 228),
                      child: fileimage == null
                                  ? Center(child: Text('لم يتم تحديد صورة'))
                                  : Image.file(File(fileimage!.path),fit: BoxFit.fill,),
                    ),
                    onTap:pickImage,
                  ),
                  
                  ButtonRounded(
                    onTap: () async {
                      print(usernum);
                      final donation = Donation(
                        name: nameController.text,
                        quantity:int.parse(quantityController.text) ,
                        shape: selectedForm,
                        type: "ادوية",
                        expireDate: formattedDate,
                        userId: int.parse(usernum),
                        image:image
                      );
           print(formattedDate);
                      await donationVM.sendDonation(donation);
 
                      if (donationVM.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('حدث خطأ: ${donationVM.errorMessage}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
                        );

                        nameController.clear();
                        quantityController.clear();
                        shapeController.clear();
                        typeController.clear();
                        expireDateController.clear();
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
    );
  }
}   

/*class DonationForm extends StatefulWidget {
  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  DateTime? selectedDate;
  String? selectedForm;
  final List<String> drugForms = [
    'حبوب',
    'شراب',
    'إبر',
    'قطر',
    'مرهم',
    'أشكال أخرى',
  ];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  StorageHelper storageHelper = StorageHelper.instance;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController shapeController = TextEditingController();

  final TextEditingController typeController = TextEditingController();

  final TextEditingController expireDateController = TextEditingController();
  String? selectedValue;
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
    String formattedDate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : 'لا يوجد تاريخ محدد';
    String usernum = storageHelper.readKey("id");
    return Scaffold(
      body: Consumer<DonationVM>(
        builder: (context, donationVM, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  MedicaTextform(
                    medeicalController: nameController,
                    text: 'اسم الدواء',
                  ),
                  MedicaTextform(
                    medeicalController: quantityController,
                    text: 'الكمية',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'شكل الدواء',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'myfont',
                            color: Color(0xff08685a)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 23),
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 235, 236, 236),
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                            hint: const Text(
                              'اختر شكل الدواء',
                            ),
                            value: selectedForm,
                            items: drugForms.map((String form) {
                              return DropdownMenuItem<String>(
                                value: form,
                                child: Text(form),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedForm = newValue;
                                // print(selectedForm);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          'نوع التبرع : ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 6, 137, 110)),
                        ),
                        // RadioButtonRow(),
                        Container(
                          width: 245,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 232, 232, 232),
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<String>(
                                value: 'Option1',
                                groupValue: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                              const Text('أدوية'),
                              Radio<String>(
                                value: 'Option2',
                                groupValue: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                              const Text('معدات طبية'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 60),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 234, 234),
                          borderRadius: BorderRadius.circular(20)),
                      width: 250,
                      height: 50,
                      child: fileimage == null
                          ? Center(child: Text('انقر لاختيار صورة'))
                          : Image.file(File(fileimage!.path)),
                    ),
                    onTap: pickImage,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //  DonationDate(),
                 
                  ButtonRounded(
                    onTap: () async {
                      print(usernum);
                      final donation = Donation(
                          name: nameController.text,
                          quantity: int.parse(quantityController.text),
                          shape: selectedForm,
                          type: selectedValue,
                          // expireDate: selectedDate,
                          userId: int.parse(usernum),
                          image: image);

                      await donationVM.sendDonation(donation);

                      if (donationVM.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('حدث خطأ: ${donationVM.errorMessage}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
                        );

                        nameController.clear();
                        quantityController.clear();
                        shapeController.clear();
                        typeController.clear();
                        expireDateController.clear();
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
    );
  }
}*/


