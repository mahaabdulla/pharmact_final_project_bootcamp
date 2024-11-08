import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/screens/drug_list.dart';

import '../../models/donation.dart';
import '../../veiwModel/druqRequestVM.dart';
import '../widgets/button.dart';

class CartScreen extends StatefulWidget {
  late List<Donation> donation;
   CartScreen({super.key,required this.donation});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DruqRequestVM dvm = DruqRequestVM();
 List<Map<String,int>> itemCart=[];
late List<int> userRequest;
 Map<String,int> reqDrug = {};
  @override
  Widget build(BuildContext context) {
     final List<ValueNotifier<int>> quantities = 
        List.generate(widget.donation.length, (index) => ValueNotifier(widget.donation[index].quantity!));////
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff08685a),
        centerTitle: true,
        title: const Text(
          'السلة',
          style: TextStyle(color: Colors.white, fontFamily: 'myfont'),
        ),
      ),
      body: Column(
        children: [
          Container(
             height: MediaQuery.of(context).size.height * 2 / 3,
            child: ListView.builder(
              itemCount:widget.donation.length,
              itemBuilder: (ctx, index) {
                reqDrug['drug_id']=widget.donation[index].id!;
                reqDrug['quantity']=widget.donation[index].quantity!;
                 itemCart.add(reqDrug);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                      leading: Image.asset('assets/icons/pharmacy(1).png'),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text('${ widget.donation[index].name}'),
                      ),
                      subtitle:/*ValueListenableBuilder<int>(
                        valueListenable: quantities[index],
                        builder: (context, quantity, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 17),
                            ),
                          );
                        },
                      ),*/
                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child:Text('${widget.donation[index].quantity}',style: TextStyle(fontSize: 17,),),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){
                              widget.donation[index].quantity=widget.donation[index].quantity! + 1;
                              print(widget.donation[index].quantity);
                               itemCart[index]={"drug_id":widget.donation[index].id!,"quantity":widget.donation[index].quantity!};
                           /*  setState(() {
                                
                              });*/
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 114, 190, 154),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              itemCart[index]={"drug_id":widget.donation[index].id!,"quantity":widget.donation[index].quantity!};
                               if(widget.donation[index].quantity==0)
                                widget.donation.removeAt(index);
                              /*setState(() {
                                
                              });*/
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 216, 216, 216),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                               widget.donation.removeAt(index);
                              setState(() {
                                
                              });
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
                              ),
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
           ButtonRounded(text:"ارسال", onTap:()async{
                     
                      await dvm.sendDrug(itemCart);
                        print(itemCart);
                       
                      if (dvm.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('حدث خطأ: ${dvm.errorMessage}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
                        );
                      }
                //   widget.donation.clear();
          })
        ],
      ),
    );
  }
}

/*class CartScreen extends StatelessWidget {
  final List<Donation> donation;
  CartScreen({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    // استخدام ValueNotifier لتتبع الكميات
    final List<ValueNotifier<int>> quantities = 
        List.generate(donation.length, (index) => ValueNotifier(donation[index].quantity!));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff08685a),
        centerTitle: true,
        title: const Text(
          'السلة',
          style: TextStyle(color: Colors.white, fontFamily: 'myfont'),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: ListView.builder(
              itemCount: donation.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                      leading: Image.asset('assets/icons/pharmacy(1).png'),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text('${donation[index].name}'),
                      ),
                      subtitle: ValueListenableBuilder<int>(
                        valueListenable: quantities[index],
                        builder: (context, quantity, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 17),
                            ),
                          );
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              quantities[index].value++;
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 114, 190, 154),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (quantities[index].value > 0) {
                                quantities[index].value--;
                              }
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 216, 216, 216),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // قم بإزالة العنصر من القائمة هنا إذا لزم الأمر
                            },
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
                              ),
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
             
            },
            child: Text("ارسال"),
          ),
        ],
      ),
    );
  }
}*/

