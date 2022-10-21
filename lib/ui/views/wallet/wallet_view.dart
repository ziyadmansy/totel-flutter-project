import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/color.dart';

import 'wallet_view_model.dart';

class WalletView extends ViewModelBuilderWidget<WalletViewModel> {
  const WalletView({super.key});

  @override
  Widget builder(
      BuildContext context, WalletViewModel viewModel, Widget? child) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            title: const Text("My Wallet"),
            expandedHeight: 200.0,
            flexibleSpace: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.walletGradientStart,
                    AppColors.walletGradientEnd
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Amount in wallet",
                          style: TextStyle(color: Colors.white)),
                      Text("\$1000",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.deepPurple.shade200,
                    ),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const PaymentOption()),
                        // );
                      },
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.food_bank_sharp,
                            color: Colors.white,
                          ),
                          Text("Withdraw",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            pinned: true,
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(52.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           AppColors.walletGradientStart,
            //           AppColors.walletGradientEnd
            //         ],
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisSize: MainAxisSize.max,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisSize: MainAxisSize.min,
            //           children: const [
            //             Text("Amount in wallet",
            //                 style: TextStyle(color: Colors.white)),
            //             Text("\$1000",
            //                 style:
            //                     TextStyle(color: Colors.white, fontSize: 30)),
            //           ],
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
            //             color: Colors.deepPurple.shade200,
            //           ),
            //           child: MaterialButton(
            //             elevation: 0,
            //             onPressed: () {
            //               // Navigator.push(
            //               //   context,
            //               //   MaterialPageRoute(builder: (context) => const PaymentOption()),
            //               // );
            //             },
            //             padding: EdgeInsets.all(10),
            //             child: Row(
            //               children: const [
            //                 Icon(
            //                   Icons.food_bank_sharp,
            //                   color: Colors.white,
            //                 ),
            //                 Text("Withdraw",
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                     )),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.walletGradientStart,
                    AppColors.walletGradientEnd
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21, vertical: 0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Payment History"),
                          Align(
                            child: Text("2022"),
                            alignment: Alignment.center,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text("Name"),
                    subtitle: Text("Date & time"),
                    trailing: Text(
                      "Price",
                      style: TextStyle(
                          color: index % 2 == 0 ? Colors.red : Colors.green),
                    ),
                  ),
                );
              },
              // 40 list items
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  @override
  WalletViewModel viewModelBuilder(BuildContext context) => WalletViewModel();
}
