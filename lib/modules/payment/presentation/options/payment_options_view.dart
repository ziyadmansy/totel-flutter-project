import 'dart:io';

import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class PaymentOptionsView extends ViewModelWidget<PaymentViewModel> {
  const PaymentOptionsView({super.key});

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Payment Options"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: AppColors.soap, thickness: 1),
            // card
            ListTile(
              onTap: viewModel.onAddCard,
              leading: Image(
                image: R.svg.ic_credit_card(width: 22, height: 17),
              ),
              title: Text(
                "Card(Credit/Debit)",
                style: AppStyle.of(context).b4M.wCChineseBlack,
              ),
              subtitle: Text(
                "Pay using your credit or debit card",
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.chineseBlack,
              ),
            ),
            Divider(color: AppColors.soap, thickness: 1),
            // Net banking
            ListTile(
              onTap: viewModel.onBank,
              leading: Image(
                image: R.svg.ic_bank(width: 20, height: 20),
              ),
              title: Text(
                "Net Banking",
                style: AppStyle.of(context).b4M.wCChineseBlack,
              ),
              subtitle: Text(
                "Pay using any of 47 supported banks",
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.chineseBlack,
              ),
            ),
            Divider(color: AppColors.soap, thickness: 1),
            // wallet
            ListTile(
              onTap: viewModel.onWallet,
              leading: Image(
                image: R.svg.ic_wallet(width: 20, height: 20),
                color: AppColors.chineseBlack,
              ),
              title: Text(
                "Wallet",
                style: AppStyle.of(context).b4M.wCChineseBlack,
              ),
              subtitle: Text(
                "Venmo, Apple Pay available",
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.chineseBlack,
              ),
            ),
            Divider(color: AppColors.soap, thickness: 1),
            // apple pay
            ListTile(
              onTap: viewModel.onPlatformPay,
              leading: Image(image: R.image.img_apple_pay()),
              title: Text(
                Platform.isAndroid ? 'Google Pay' : "Apple Pay",
                style: AppStyle.of(context).b4M.wCChineseBlack,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.chineseBlack,
              ),
            ),
            Divider(color: AppColors.soap, thickness: 1),
            // venmo
            ListTile(
              onTap: viewModel.onVenom,
              leading: Image(image: R.image.img_venmo()),
              title: Text(
                "Venmo",
                style: AppStyle.of(context).b4M.wCChineseBlack,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.chineseBlack,
              ),
            ),
            Divider(color: AppColors.soap, thickness: 1),
          ],
        ),
      ),
    );
  }
}
