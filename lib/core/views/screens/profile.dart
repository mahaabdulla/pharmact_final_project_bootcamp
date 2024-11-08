import 'package:flutter/material.dart';
import 'package:pharmcy/core/models/user.dart';
import 'package:pharmcy/core/veiwModel/usrtVm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/profile_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final TextEditingController bioController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff08685a),
      ),
      body: Consumer<UserVm>(
        builder: (context, userVm, child) {
          if (userVm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userVm.errorMessage != null) {
            return Center(
                child: Text(userVm.errorMessage!,
                    style: TextStyle(color: Colors.red)));
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    buildProfileHeader(userVm),////////////
                    const SizedBox(height: 30),
                    Text(
                      '${userVm.profileInfo['name']}',
                      style: TextStyle(fontFamily: 'myfont', fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ProfileWidget(
                      text: userVm.profileInfo['bio'] ?? 'لم يتم تحديد وصف',
                      controller: bioController,
                      icons: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    ProfileWidget(
                      text: userVm.profileInfo['phone'] ??
                          'لم يتم تحديد رقم',
                      icons: Icons.phone,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 20),
                    ProfileWidget(
                      text: userVm.profileInfo['city'] ?? 'لم يتم تحديد مدينة',
                      icons: Icons.home,
                      controller: cityController,
                    ),
                    const SizedBox(height: 50),
                    ButtonRounded(
                      width: 200,
                      text: 'تعديل',
                      onTap: () {
                        Navigator.pushNamed(context, '/updaeProfile');
                      },
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

  Widget buildProfileHeader(UserVm userVm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: userVm.profileInfo['avatar'] != null
              ? NetworkImage(userVm.profileInfo['avatar'])
              : AssetImage('assets/images/profile.png') as ImageProvider,
        ),
      ],
    );
  }
}

