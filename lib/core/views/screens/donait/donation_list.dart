import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:provider/provider.dart';

import '../../../constant/api_url.dart';

class DonationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DonationVM()..getData(ApiUrls.approvedCategory),
      child: Scaffold(
        appBar: AppBar(title: Text('قائمة التبرعات')),
        body: Consumer<DonationVM>(
          builder: (context, donationVM, child) {
            if (donationVM.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (donationVM.errorMessage != null) {
              return Center(child: Text(donationVM.errorMessage!));
            }
            return ListView.builder(
              itemCount: donationVM.donations.length,
              itemBuilder: (context, index) {
                final donation = donationVM.donations[index];
                return ListTile(
                  title: Text(donation.name ?? 'غير محدد'),
                  subtitle: Text('الكمية: ${donation.quantity}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}