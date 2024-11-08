//

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy/core/constant/api_url.dart';
import 'package:pharmcy/core/models/user.dart';
import 'package:pharmcy/core/veiwModel/usrtVm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/profile_widget.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  XFile? image;

  @override
  void initState() {
    super.initState();
    // Fetch user profile data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserVm>(context, listen: false).getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff08685a),
          title: Text(
            'تعديل الملف الشخصي',
            style: TextStyle(color: Colors.white),
          )),
      body: Consumer<UserVm>(
        builder: (context, userVm, child) {
          if (userVm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          cityController.text = userVm.profileInfo['city'] ?? '';
          phoneController.text = userVm.profileInfo['phone'] ?? '';
          bioController.text = userVm.profileInfo['bio'] ?? '';

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 70,
                    // ),
                    image != null
                        ? Image.file(File(image!.path), height: 150, width: 150)
                        : Text('لم يتم اختيار صورة'),
                    SizedBox(height: 20),
                    ButtonRounded(
                        width: 200,
                        text: 'اختر صورة',
                        onTap: () {
                          pickImage;
                        }),
                    SizedBox(height: 35),
                    ProfileWidget(
                      controller: bioController,
                      text: 'نبذة تعريفية',
                      icons: Icons.person,
                    ),
                    SizedBox(height: 20),
                    ProfileWidget(
                      controller: phoneController,
                      text: 'الهاتف',
                      icons: Icons.phone,
                    ),
                    SizedBox(height: 20),
                    ProfileWidget(
                      controller: cityController,
                      text: 'المدينة',
                      icons: Icons.home,
                    ),
                    SizedBox(height: 40),
                    ButtonRounded(
                      width: 200,
                      text: 'تعديل الملف الشخصي',
                      onTap: () async {
                       
                        Map<String, dynamic> prfileData={
                          "bio":bioController.text,
                          "phone":phoneController.text,
                          "city":cityController.text
                        };
                       
                        String? result = await userVm.updateProfile(prfileData, ApiUrls.postProfile).then((value){
                          if (value == "success") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Profile updated successfully!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(userVm.errorMessage ??
                                    'Error updating profile')),
                          );
                        }
                          
                        });
                        
                      },
                    ),
                    if (userVm.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          userVm.errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile;
    });
  }
}
