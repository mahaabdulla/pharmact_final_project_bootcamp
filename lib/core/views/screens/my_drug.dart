import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/druqRequestVM.dart';

import '../../constant/api_url.dart';

class MyDrug extends StatelessWidget {
   MyDrug({super.key});
DruqRequestVM dvm = DruqRequestVM();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: const Color.fromARGB(255, 188, 225, 210),
        appBar: AppBar(
          backgroundColor: const Color(0xff08685a),
          centerTitle: true,
          title: const Text(
            'أدويتي',
            style: TextStyle(color: Colors.white, fontFamily: 'myfont'),
          ),
        ),
        body: FutureBuilder(future:dvm.getDrug(ApiUrls.userDrugs ),builder:(ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.done){

             if(snapshot.data != null)
             {
               return ListView.builder(
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
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 30),
                    child: Image.network('${snapshot.data![index].drug!.image!.path}')
                    //Text('${snapshot.data![index].drug!.image!.path}'),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('${snapshot.data![index].drug!.name}'),),
                    
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Column(//mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height:5,),
                         Text('${snapshot.data![index].quantity}',style: TextStyle(fontSize: 17,),),
                       
                      ],
                    ),
                  ),
                 trailing:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  snapshot.data![index].status== 'pending'
                    ? Text("قيد الانتظار",style:TextStyle(color:Colors.grey),)
                    : snapshot.data![index].status == 'approved'
                    ? Text("مقبول",style:TextStyle(color:Colors.green),)
                    : Text("مرفوض",style:TextStyle(color:Colors.red),), 
                    Text('${snapshot.data![index].createdAt!.substring(0,10)}')
                 ],)
                ),
              ),
            );
          },
        );
             }
             return Center(child: Container(child: Text("لا توجد تبرعات"),width: 100,height: 100,color: Colors.blue,));
          }
           else
           {
            return Center(child: CircularProgressIndicator());
           }
        }
        
      ),
      )
    );
  }
}
