import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/components/foodie_under_construction.dart';
import 'package:foodie/components/rows_resturant_review.dart';
import 'package:foodie/models/food_item.dart';
import 'package:foodie/states/menu/item_details/item_details_state.dart';
import 'package:foodie/states/menu/menu_item/menu_item_state.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/menu/item_details.dart/item_details_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({super.key, required this.itemName});

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider<MenuItemState>(
        create: (BuildContext context) => MenuItemState(),
        child: Consumer<MenuItemState>(
          builder: (context, itemState, child) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodieHeaderWithCart(
                    header: itemName,
                    enableBackButton: true,
                    onBackPressed: () {
                      Navigator.pop(context);
                      // Dispose MenuItemState here
                      // itemState.dispose();
                    },
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FoodieTextfield(
                      controller: itemState.itemSearchController,
                      hintText: 'Search Food',
                      hintFontStyle: FontStyle.normal,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const Gap(10),
                  switch (itemName) {
                    "Desserts" => ItemsListView(
                        items: itemState.menuDesserts,
                      ),
                    "Beverages" =>
                      ItemsListView(items: itemState.menuBeverages),
                    "Food" => ItemsListView(items: itemState.menuFoods),
                    "Promotions" => const FoodieUnderCons(),
                    // TODO: Handle this case.
                    String() => throw UnimplementedError(),
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
    required this.items,
  });

  final List<FoodItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      separatorBuilder: ((context, index) => const Gap(5)),
      itemBuilder: (context, index) {
        final indDessertItem = items[index];

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (BuildContext context) => ItemDetailsState(),
                        child: ItemDetailsView(item: indDessertItem))));
          },
          child: SizedBox(
            height: 200,
            child: Stack(
              children: [
                Image.asset(
                  indDessertItem.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.black26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        indDessertItem.name,
                        style: TextStyle(
                          color: FColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          ResturantReviewRow(
                              rate: indDessertItem.foodrating.toString()),
                          const Gap(5),
                          Text(
                            indDessertItem.resturant,
                            style: TextStyle(
                              color: FColor.white,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            '⚈',
                            style: TextStyle(
                              color: FColor.white,
                              fontSize: 8,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            indDessertItem.foodtype,
                            style: TextStyle(
                              color: FColor.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
