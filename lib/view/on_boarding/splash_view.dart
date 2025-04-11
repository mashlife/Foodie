import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/view/auth/login_or_register.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginOrRegister()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'to login bg',
            child: Image.asset(
              splashBg,
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Hero(tag: 'to login logo', child: SvgPicture.asset(logo))
        ],
      ),
    );
  }
}
