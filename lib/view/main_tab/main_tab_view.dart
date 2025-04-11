import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/states/main_tab/main_tab_state.dart';
import 'package:foodie/states/menu/menu_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/home/home_view.dart';
import 'package:foodie/view/menu/menu_view.dart';
import 'package:foodie/view/more/more_view.dart';
import 'package:foodie/view/offer/offer_view.dart';
import 'package:foodie/view/profile/profile_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainTabState>(
      create: (context) => MainTabState(),
      child: Consumer<MainTabState>(
        builder: (context, mainTab, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageStorage(
              bucket: mainTab.pageStorageBucket,
              child: mainTab.selectedPageView),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (mainTab.selectedTab != 2) {
                mainTab.setSelectedTab(2);
                mainTab.setPageView(
                  const HomeView(),
                );
              }
            },
            shape: const CircleBorder(),
            backgroundColor: mainTab.selectedTab == 2
                ? FColor.secondary
                : FColor.placeHolder,
            splashColor: FColor.primaryText,
            child: SvgPicture.asset(
              iconHome,
              height: 30,
              width: 30,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 61,
            color: FColor.textField,
            shadowColor: FColor.black,
            surfaceTintColor: FColor.secondary,
            shape: const CircularNotchedRectangle(),
            elevation: 1,
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabButton(
                  onTap: () {
                    if (mainTab.selectedTab != 0) {
                      mainTab.setSelectedTab(0);
                      mainTab.setPageView(ChangeNotifierProvider(
                        create: (context) => MenuState(),
                        child: const MenuView(),
                      ));
                    }
                  },
                  tabName: 'Menu',
                  imageAsset: tabMenu,
                  isSelected: mainTab.selectedTab == 0,
                ),
                TabButton(
                  onTap: () {
                    if (mainTab.selectedTab != 1) {
                      mainTab.setSelectedTab(1);
                      mainTab.setPageView(const OfferView());
                    }
                  },
                  tabName: 'Offers',
                  imageAsset: tabOffer,
                  isSelected: mainTab.selectedTab == 1,
                ),
                const Gap(10),
                TabButton(
                  onTap: () {
                    if (mainTab.selectedTab != 3) {
                      mainTab.setSelectedTab(3);
                      mainTab.setPageView(const ProfileView());
                    }
                  },
                  tabName: 'Profile',
                  imageAsset: tabProfile,
                  isSelected: mainTab.selectedTab == 3,
                ),
                TabButton(
                  onTap: () {
                    if (mainTab.selectedTab != 4) {
                      mainTab.setSelectedTab(4);
                      mainTab.setPageView(const MoreView());
                    }
                  },
                  tabName: 'More',
                  imageAsset: tabMore,
                  isSelected: mainTab.selectedTab == 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.onTap,
    required this.tabName,
    required this.imageAsset,
    this.isSelected = false,
  });

  final VoidCallback onTap;
  final String tabName;
  final String imageAsset;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            height: 20,
            fit: BoxFit.cover,
            color: isSelected ? FColor.primary : FColor.placeHolder,
          ),
          const Gap(3),
          Text(
            tabName,
            style: TextStyle(
              color: isSelected ? FColor.primary : FColor.placeHolder,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
