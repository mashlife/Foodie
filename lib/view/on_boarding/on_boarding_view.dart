import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/states/on_boarding/on_boarding_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/main_tab/main_tab_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            splashBg,
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          ChangeNotifierProvider<OnBoardingState>(
            create: ((context) => OnBoardingState()),
            child: Consumer<OnBoardingState>(
              builder: (context, onBoarding, child) => Stack(
                children: [
                  PageView.builder(
                    itemCount: onBoarding.onBoardingPages.length,
                    itemBuilder: ((context, index) {
                      final onPage = onBoarding.onBoardingPages[index];
                      return SinglePageOB(size: size, onPage: onPage);
                    }),
                    onPageChanged: (currentPage) {
                      onBoarding.changeSelectedPage(currentPage);
                    },
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: onBoarding.onBoardingPages.map((e) {
                        int index = onBoarding.onBoardingPages.indexOf(e);

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 6,
                          width: 12,
                          decoration: BoxDecoration(
                              color: index == onBoarding.selectedPage
                                  ? FColor.secondaryText
                                  : FColor.placeHolder,
                              borderRadius: BorderRadius.circular(10)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SinglePageOB extends StatelessWidget {
  const SinglePageOB({
    super.key,
    required this.size,
    required this.onPage,
  });

  final Size size;
  final dynamic onPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width * 0.9,
      height: size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            onPage["image"],
            width: size.width * 0.7,
            fit: BoxFit.contain,
          ),
          const Gap(30),
          Text(
            onPage["title"],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: FColor.primaryText,
            ),
          ),
          const Gap(20),
          Text(
            onPage["subtitle"],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: FColor.secondaryText,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          onPage["lastPage"] != null && onPage["lastPage"] == true
              ? Column(
                  children: [
                    const Gap(20),
                    RoundedIconButton(
                      onTap: () {
                        // Dispose OnBoardingState here after successful login

                        Provider.of<OnBoardingState>(context, listen: false)
                            .dispose();

                        //go to homepage
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainTabView()));
                      },
                      icon: Icons.arrow_forward_ios_rounded,
                    )
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}


//animation
//                           PageRouteBuilder(
//                               pageBuilder =
//                                   (context, animation, secondaryAnimation) =>
//                                       const Home(),
//                               transitionsBuilder = (context, animation,
//                                   secondaryAnimation, child) {
//                                 return FadeTransition(
//                                     opacity: animation, child: child);
//                               },
//                             ));
