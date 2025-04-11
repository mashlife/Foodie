import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/home/home_state.dart';
import 'package:foodie/view/home/widgets/cell_category.dart';
import 'package:foodie/view/home/widgets/cell_most_popular_resturant.dart';
import 'package:foodie/view/home/widgets/cell_recent.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/view/home/widgets/location_selection.dart';
import 'package:foodie/view/home/widgets/cell_popular_resturant.dart';
import 'package:foodie/view/home/widgets/row_view_all_title.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70,
        body: ChangeNotifierProvider<HomeState>(
          create: (BuildContext context) => HomeState(),
          child: Consumer<HomeState>(
            builder: (context, homeState, child) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FoodieHeaderWithCart(
                        header: 'Good Morning, Mushfiqr!'),
                    const Gap(10),
                    const LocationHome(),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FoodieTextfield(
                        controller: homeState.searchFoodController,
                        hintText: 'Search Food',
                        hintFontStyle: FontStyle.normal,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 130,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeState.category.length,
                          separatorBuilder: (context, index) => const Gap(10),
                          itemBuilder: (context, index) {
                            final singleCategory = homeState.category[index];
                            return CategoryCellHome(
                                singleCategory: singleCategory);
                          },
                        ),
                      ),
                    ),
                    const Gap(15),
                    ViewAllTitleRow(
                      title: 'Popular Resturants',
                      onPressed: () {},
                    ),
                    const Gap(5),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeState.popularResturants.length,
                      separatorBuilder: (context, index) => const Gap(10),
                      itemBuilder: (context, index) {
                        final indPopularResturant =
                            homeState.popularResturants[index];
                        return PopularResturantCellHome(
                            indPopularResturant: indPopularResturant);
                      },
                    ),
                    const Gap(20),
                    ViewAllTitleRow(
                      title: 'Most Popular Resturants',
                      onPressed: () {},
                    ),
                    const Gap(5),
                    SizedBox(
                      height: 220,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: homeState.mostPopularResturants.length,
                          separatorBuilder: (context, index) => const Gap(10),
                          itemBuilder: (context, index) {
                            final indMostPopularResturant =
                                homeState.mostPopularResturants[index];
                            return MostPopularCellHome(
                                indMostPopularResturant:
                                    indMostPopularResturant);
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    ViewAllTitleRow(
                      title: 'Recent Items',
                      onPressed: () {},
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeState.recent.length,
                        separatorBuilder: (context, index) => const Gap(10),
                        itemBuilder: (context, index) {
                          final indRecent = homeState.recent[index];
                          return RecentCellHome(indRecent: indRecent);
                        },
                      ),
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
