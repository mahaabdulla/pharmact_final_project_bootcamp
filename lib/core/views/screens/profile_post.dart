

// تطبع بيانات المستخدم 
import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/usrtVm.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Consumer<UserVm>(
        builder: (context, userVm, child) {
          if (userVm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (userVm.errorMessage != null) {
            return Center(child: Text(userVm.errorMessage!));
          }
          return Column(
            children: [
              Text('name: ${userVm.profileInfo['name']}'),
              Text('bio: ${userVm.profileInfo['bio']}'),
              Text('Email: ${userVm.profileInfo['phone']}'),
              // Add more fields as needed
            ],
          );
        },
      ),
    );
  }
}
