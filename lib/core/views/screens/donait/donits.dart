import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/medica_textform.dart';

class Donits extends StatefulWidget {
  Donits({super.key});

  @override
  _DonitsState createState() => _DonitsState();
}

class _DonitsState extends State<Donits> {
  final TextEditingController drugNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController formController = TextEditingController();
  
  String? imagePath;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagePath = image.path; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلب دواء')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MedicaTextform(
              medeicalController: drugNameController,
              text: 'اسم الدواء',
            ),
            MedicaTextform(
              medeicalController: quantityController,
              text: 'الكمية',
            ),
            MedicaTextform(
              medeicalController: formController,
              text: 'شكل العلاج',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(imagePath != null ? 'صورة مرفقة' : 'صورة العلاج'),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _pickImage,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: ButtonRounded(
                width: 180,
                height: 30,
                onTap: () {
              
                },
                text: 'اطلب ',
              ),
            )
          ],
        ),
      ),
    );
  }
}