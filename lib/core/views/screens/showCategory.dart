import 'package:flutter/material.dart';
import 'package:pharmcy/core/models/catgury.dart';
import 'package:pharmcy/core/models/donation.dart';
import 'package:provider/provider.dart';

import '../../constant/api_url.dart';
import '../../veiwModel/categury_vm.dart';
import '../../veiwModel/donationvm.dart';

/*class ShowCategory extends StatefulWidget {
  late Categury c;
   ShowCategory({super.key,required this.c});

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
   DonationVM dvm = DonationVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          InkWell(
            child: Container(margin:EdgeInsets.all(5),
             child: Consumer<DonationVM>(builder:(ctx,d,child){
              return Badge(child:Icon(Icons.shopping_cart),label:Text("${d.cart.length}"),)  ;
             }) 
            ),
            onTap:(){
              Navigator.pushNamed(context, "/cart2",arguments:dvm.cart);
            },
          )
        ],
      ),
      body:
      FutureBuilder(future:dvm.getData(ApiUrls.approvedCategory),builder:(ctx,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
           List<Donation>? specificCategory =snapshot.data?.where((element) => element.category_id==widget.c.id).toList();
          //  print(specificCategory!.length);
          if(specificCategory!.length>0)
          {
            return ListView.builder(
              itemCount:specificCategory!.length,
              itemBuilder: (context, index) {
                  return ListTile(
                  title: Text('Name: ${specificCategory![index].name}'),
                  subtitle: Column(
                    children: [
                      Text('Type: ${specificCategory![index].type}'),
                      Consumer(builder:(ctx,d,child){
                       return IconButton(onPressed: (){
                        dvm.addToCart(specificCategory![index]);
                        print(dvm.cart.length);
                       /* setState(() {

                    });*/
                      }, icon:Icon(Icons.add_shopping_cart));
                      })
                    ],
                  ),
                  trailing:Text('Quantity: ${specificCategory![index].quantity}'),
                );
              }
          );
          }
          else
          {print("kjjhhh");
            return Center(child: Container(child: Text("لا توجد تبرعات")));}

        }
       
        else
           {
            return CircularProgressIndicator();
           }
      })

      /* Consumer<DonationVM>(
        builder: (context,DVM, child) {
          if (DVM.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (DVM.errorMessage != null) {
            return Center(child: Text(DVM.errorMessage!));
          }

          return InkWell(
            child: ListView.builder(
              itemCount:DVM.donations.length,
              itemBuilder: (context, index) {
                final donation = DVM.donations[index];
                return ListTile(
                  title: Text('Name: ${donation.name!}'),
                  subtitle: Text('Type: ${donation.type}'),
                  trailing:Text('Quantity: ${donation.quantity}'),
                );
              },
            ),
           
          );
        },
      ), */
    );
  }
}*/