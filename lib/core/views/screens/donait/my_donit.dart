import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/donit_list.dart';

import '../../../constant/api_url.dart';
import '../../../models/donation.dart';
import '../../../veiwModel/donationvm.dart';

class MyDonit extends StatelessWidget {
   MyDonit({super.key});
  DonationVM dvm = DonationVM();
  int usernum = int.parse(storageHelper.readKey("id"));
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 225, 210),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff08685a),
          title: Text('تبرعاتي'),
        ),
        body: FutureBuilder(future:dvm.getmydonation(ApiUrls.userDonation ),builder:(ctx,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          // List<Donation>? userDA =snapshot.data?.where((element) => element.userId==usernum).toList();
          if(snapshot.data != null)
          {  return ListView.builder(
          itemCount:snapshot.data!.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                   leading:Image.network(snapshot.data![index].image!.path),
                  // Image.asset('assets/icons/pharmacy(1).png'),
                  title: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text('${ snapshot.data![index].name}'),
                      ),
                  subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child:Text('${snapshot.data![index].quantity}',style: TextStyle(fontSize: 17,),),
                      ),
                  trailing: 
    snapshot.data![index].status== 'pending'
      ? Text("قيد الانتظار")
      : snapshot.data![index].status == 'approved'
        ? Text("مقبول")
        : Text("مرفوض"), 
              ),
            )
            );
          },
        );
          }
          else
          return Center(child: Container(child: Text("لا توجد تبرعات"),width: 100,height: 100,color: Colors.blue,));

        }
        else
           {
            return Center(child: CircularProgressIndicator());
           }
      })

       
          //child: DonitList(),
         
        
      ),
    );
  }
}
