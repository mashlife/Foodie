import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_padding_widget.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {
      "title": "Your order has been picked up",
      "time": "Now",
    },
    {
      "title": "Your order has been delivered",
      "time": "1h ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1h ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "3h ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "3h ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "1d ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1d ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "1d ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1d ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "1d ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1d ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "1d ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1d ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "1d ago",
    },
    {
      "title": "Your order has been picked up",
      "time": "1d ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodieHeaderWithCart(
                header: 'Notifications',
                enableBackButton: true,
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Gap(20),
              FpHorizontal(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationArr.length,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Text(
                          '⚈',
                          style: TextStyle(
                            color: FColor.highlight,
                            fontSize: 20,
                          ),
                        ),
                        title: Text(
                          notificationArr[index]['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          notificationArr[index]['time'],
                          style: TextStyle(
                            color: FColor.secondaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
