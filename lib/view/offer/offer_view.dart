import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/services/resturant_service.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/view/home/widgets/cell_popular_resturant.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<IndividualResturantModel> getOffersList() {
      return context.read<ResturantServices>().offerResturant;
    }

    final offerList = getOffersList();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FoodieHeaderWithCart(header: 'Latest Offers'),
                const Gap(2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      "Find discounts, Offers special meals and more!",
                      style: TextStyle(
                        color: FColor.secondaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RoundedTextButton(
                    text: 'Check Offers',
                    onTap: () {},
                    fontSize: 12,
                  ),
                ),
                const Gap(20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: offerList.length,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) {
                    final indOffer = offerList[index];
                    return PopularResturantCellHome(
                        indPopularResturant: indOffer);
                  },
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
