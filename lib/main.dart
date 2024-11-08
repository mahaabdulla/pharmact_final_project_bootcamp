import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/core/veiwModel/usrtVm.dart';
import 'package:pharmcy/generated/l10n.dart';
import 'package:pharmcy/helper/route.dart';
import 'package:provider/provider.dart';

import 'core/veiwModel/categury_vm.dart';

void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserVm>(create: (ctx) => UserVm()),
        ChangeNotifierProvider<DonationVM>(create: (ctx) => DonationVM()),
        ChangeNotifierProvider<CateguryVM>(create: (ctx) => CateguryVM()),
      ],
      child: MaterialApp(
        
       locale: const Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}

