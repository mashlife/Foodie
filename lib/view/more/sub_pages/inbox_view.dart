import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_padding_widget.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  List inboxArr = [
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
    },
    {
      "title": "MealMonkey Promotions",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
      "time": "6th July",
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
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: inboxArr.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(color: FColor.textField),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⚈',
                          style: TextStyle(
                            color: FColor.highlight,
                            fontSize: 20,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inboxArr[index]['title'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                inboxArr[index]['subtitle'],
                                maxLines: 2,
                                style: TextStyle(
                                  color: FColor.secondaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              inboxArr[index]['time'],
                              style: TextStyle(
                                color: FColor.secondaryText,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                print("starred message");
                              },
                              icon: Icon(
                                Icons.star_border_rounded,
                                color: FColor.highlight,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
