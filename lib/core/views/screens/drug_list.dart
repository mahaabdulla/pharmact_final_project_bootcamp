import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy/core/veiwModel/categury_vm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/categurey_filter.dart';
import 'package:pharmcy/core/views/widgets/dotted_line.dart';
import 'package:pharmcy/core/views/widgets/image_list.dart';
import 'package:provider/provider.dart';

import '../../constant/api_url.dart';
import '../../models/catgury.dart';
import '../../models/donation.dart';
import '../../veiwModel/donationvm.dart';

class DrugList extends StatefulWidget {
    late Categury c;
   DrugList({super.key,required this.c});

  @override
  _DrugListState createState() => _DrugListState();
}
 DonationVM dvm = DonationVM();
Future<Uint8List?> convertXFileToBytes(XFile? xfile) async {
  if (xfile == null) return null;
  return await File(xfile.path).readAsBytes();
}
class _DrugListState extends State<DrugList> {
  String? selectedForm;
  int? selectedQuantity;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: const Color(0xff08685a),
        title: Text('قائمة الأدوية'),
         actions: [
          InkWell(
            child: Container(margin:EdgeInsets.symmetric(horizontal:15 ),
             child: Consumer<DonationVM>(builder:(ctx,d,child){
              return Container(margin:EdgeInsets.only(top:10),child: Badge(child:Icon(Icons.shopping_cart),label:Text("${DonationVM.cart.length}"),))  ;
             }) 
            ),
            onTap:(){
              Navigator.pushNamed(context, "/cart",arguments:DonationVM.cart);
            },
          )
        ],
      ),
      body: Column(
        children: [
        /*  Container( //shaw all category
            margin: EdgeInsets.all(8),
            height: 40,
            child: const CateguryFilter(),
          ),*/
          Expanded(
            child:FutureBuilder(future:dvm.getData(ApiUrls.approvedCategory),builder:(ctx,snapshot){
              print(snapshot.data);
        if(snapshot.connectionState==ConnectionState.done){
           List<Donation>? specificCategory =snapshot.data?.where((element) => element.category_id==widget.c.id).toList();
          //  print(specificCategory!.length);
          if(specificCategory!.length>0)
          {
            return ListView.builder(
                  itemCount: specificCategory.length,
                  itemBuilder: (ctx, index) {
                    final category = specificCategory[index];

                    return Container(
                      height: 280,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      category.name ?? 'غير معروف',
                                      style: TextStyle(fontFamily: 'myfont'),
                                    ),
                                    Wrap(children: [
                                      Text(
                                        category.type ?? 'Unnamed',
                                        style: TextStyle(fontFamily: 'myfont'),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 15, right: 10, left: 18),
                                  padding: EdgeInsets.only(top: 10),
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 134, 206, 189),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(category.image!.path),
                                 
                                  )

                              // ImageListDrug(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const DottedLine(),
                          const SizedBox(height: 5),
                          category.type=="ادوية"?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'شكل الدواء',
                                style: TextStyle(fontFamily: 'myfont'),
                              ),
                              Text('${category.shape}')
                            ],
                          )
                          :Container(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'الكمية',
                                style: TextStyle(fontFamily: 'myfont'),
                              ),
                              Text('${category.quantity}')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: ButtonRounded(
                              height: 20,
                              width: 50,
                              text: 'اضافة لسالة',
                              onTap: () {
                                dvm.addToCart(specificCategory![index]);
                               print(DonationVM.cart.length);
                               setState(() {
                                 
                               });
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
          }
          else
          {
            return Center(child: Container(child: Text("لا توجد تبرعات")));}

        }
       
        else
           {
            return Center(child: CircularProgressIndicator());
           }
      })
            
          ),
        ],
      ),
    );
  }
}
