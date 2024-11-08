import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../veiwModel/categury_vm.dart';

class AppGridList extends StatelessWidget {
  const AppGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CateguryVM>( 
      builder: (BuildContext context, ctg, child) {
        if (ctg.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (ctg.errorMessage != null) {
            return Center(child: Text(ctg.errorMessage!));
          } 
        return SingleChildScrollView(
            child: SizedBox(
                height: 260,
                child: GridView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: ctg.allCategury.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      height: 108,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/drugList',arguments:ctg.allCategury[index]);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 201, 222, 216),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                height: 80,
                                width: 100,
                                child:
                                 ctg.allCategury[index].image != null? Image.network(ctg.allCategury[index].image!):Image.asset('assets/icons/medication.png')
                                 
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ctg.allCategury[index].name ?? 'Unnamed',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontFamily: 'myfont', fontSize: 12
                                // fontWeight: FontWeight.bold
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                )));
      },
    );
  }
}
