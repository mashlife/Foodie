import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/menu/menu_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/menu/menu_item/menu_item_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.7,
              margin: const EdgeInsets.only(top: 125, bottom: 15, right: 15),
              decoration: BoxDecoration(
                color: FColor.primary.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5,
                      offset: Offset(-2, 2)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Consumer<MenuState>(
                builder: (context, menuState, child) => Column(
                  children: [
                    const FoodieHeaderWithCart(header: 'Menu'),
                    const Gap(10),
                    FoodieTextfield(
                      controller: menuState.searchController,
                      hintText: 'Search',
                      hintFontStyle: FontStyle.normal,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    const Gap(40),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuState.menu.length,
                      separatorBuilder: ((context, index) => const Gap(10)),
                      itemBuilder: (context, index) {
                        final indMenuOptions = menuState.menu[index];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) => MenuItemView(
                                      itemName: indMenuOptions["name"],
                                    ))),
                          ),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                height: 90,
                                width: size.width * 0.8,
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 15),
                                decoration: BoxDecoration(
                                  color: FColor.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 7,
                                      offset: Offset(0, -2),
                                    ),
                                    BoxShadow(
                                        color:
                                            FColor.highlight.withOpacity(0.5),
                                        blurRadius: 5,
                                        offset: const Offset(-2, 2)),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    indMenuOptions["image"],
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                  const Gap(25),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        indMenuOptions["name"],
                                        style: TextStyle(
                                          color: FColor.primaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(
                                        '${indMenuOptions["item_count"]} items',
                                        style: TextStyle(
                                          color: FColor.secondaryText,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                margin: const EdgeInsets.only(right: 2),
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
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
