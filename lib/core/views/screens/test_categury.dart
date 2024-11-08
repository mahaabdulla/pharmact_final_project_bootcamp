import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/categury_vm.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/navbar.dart';
import 'package:provider/provider.dart';


class CateguryView extends StatelessWidget {
  @override
  String imagePath = 'image:catehories/blood_presor.jpg';
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Categories'),
       
      ),
      body: Consumer<CateguryVM>(
        builder: (context, categuryVM, child) {
          if (categuryVM.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (categuryVM.errorMessage != null) {
            return Center(child: Text(categuryVM.errorMessage!));
          } 
          return InkWell(
            child: ListView.builder(
              itemCount: categuryVM.allCategury.length,
              itemBuilder: (context, index) {
                final category = categuryVM.allCategury[index];
                return ListTile(
                  leading: (category.image?.isNotEmpty ?? false)
                      ? Image.network(category.image!,
                          width: 50, height: 50, fit: BoxFit.cover)
                      : const Icon(Icons.image_not_supported),
                      //title: Text(' ${category.type}')
                  title: Text(category.name ?? 'Unnamed'),
                  //subtitle: Text('Type: ${category.type}'),
                  trailing:IconButton(
                    onPressed:(){ Navigator.pushNamed(context,'/showCategory',arguments: categuryVM.allCategury[index]);}, 
                    icon:Icon(Icons.more)),
                );
              },
            ),
           
          );
        },
      ),
    );
  }
}
