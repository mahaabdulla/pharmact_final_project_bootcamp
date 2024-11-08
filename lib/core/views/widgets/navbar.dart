import 'package:flutter/material.dart';

import '../../../helper/storage_helper.dart';

/*class NavBar extends StatelessWidget {
  NavBar({super.key});

  @override
  StorageHelper storageHelper = StorageHelper.instance;
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 54, 152, 131),
      //backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(storageHelper.readKey("name")),
            accountEmail: Text(storageHelper.readKey("email")),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: const BoxDecoration(
                
                ),
          ),
          ListTile(
            title: Text(
              'أدويتي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.medical_information, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/mydrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرع',
              style: TextStyle(color: Colors.white),
            ),
            leading:
                Icon(Icons.currency_exchange_outlined, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/addDrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرعاتي',
              style: TextStyle(color: Colors.white),
            ),
            leading:
                Icon(Icons.currency_exchange_outlined, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/mydonait');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'ملفي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.file_open, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تسجيل خروج',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.settings, color: Colors.white),
            onTap: () {
              storageHelper.removeAll();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/splash', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}*/
class NavBar extends StatelessWidget {
  NavBar({super.key});

  @override
  StorageHelper storageHelper = StorageHelper.instance;
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 54, 152, 131),
      //backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      surfaceTintColor:Colors.black,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(storageHelper.readKey("name")),
            accountEmail: Text(storageHelper.readKey("email")),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(
                //     'assets/images/virtical_image.jpeg',
                //   ),
                //   fit: BoxFit.fill,
                // ),
                ),
          ),
          ListTile(
            title: Text(
              'أدويتي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Image.asset('assets/icons/pharmacy(6).png'),
            onTap: () {
              Navigator.pushNamed(context, '/mydrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرع',
              style: TextStyle(color: Colors.white),
            ),
            leading: Image.asset('assets/icons/donation(1).png'),
            onTap: () {
              Navigator.pushNamed(context, '/addDrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرعاتي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Image.asset('assets/icons/donation-box.png'),
            onTap: () {
              Navigator.pushNamed(context, '/mydonait');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'الملف الشخصي',
              style: TextStyle(color: Colors.white),
            ),
            leading:
                Image.asset(height: 30, width: 30, 'assets/icons/edit.png'),
            // Image.asset(width: 50, height: 40, 'assets/icons/logout.png'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تسجيل خروج',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              storageHelper.removeAll();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/splash', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

