import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/states/more/sub_pages/payment_info_state.dart';
import 'package:foodie/test_screen.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/more/sub_pages/about_us.dart';
import 'package:foodie/view/more/sub_pages/inbox_view.dart';
import 'package:foodie/view/more/sub_pages/my_order.dart';
import 'package:foodie/view/more/sub_pages/notification_view.dart';
import 'package:foodie/view/more/sub_pages/payment_info.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final List moreList = [
      {
        "index": 1,
        "base": 0,
        "iconImg": mrPayment,
        "name": "Payment Details",
        "destination": ChangeNotifierProvider(
          create: (BuildContext context) => PaymentInfoState(),
          child: const PaymentInformation(),
        )
      },
      {
        "index": 2,
        "base": 0,
        "iconImg": mrOrders,
        "name": "My Orders",
        "destination": const MyOrderView()
      },
      {
        "index": 3,
        "base": 15,
        "iconImg": mrNotification,
        "name": "Notifications",
        "destination": const NotificationView(),
      },
      {
        "index": 4,
        "base": 0,
        "iconImg": mrInbox,
        "name": "Inbox",
        "destination": const InboxView(),
      },
      {
        "index": 5,
        "base": 0,
        "iconImg": mrAbout,
        "name": "About Us",
        "destination": const AboutUsView(),
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const FoodieHeaderWithCart(header: 'More'),
                  const Gap(15),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moreList.length,
                    separatorBuilder: (context, index) => const Gap(8),
                    itemBuilder: (context, index) {
                      final moreItem = moreList[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => moreItem["destination"])),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: FColor.textField,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: FColor.placeHolder,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  moreItem["iconImg"],
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  moreItem["name"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                moreItem["base"] > 0
                                    ? Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        width: 25,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.blueGrey,
                                              blurRadius: 7,
                                              offset: Offset(-1, 1),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          moreItem["base"].toString(),
                                          style: TextStyle(
                                            color: FColor.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            trailing: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: FColor.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 7,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                btnNext,
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
