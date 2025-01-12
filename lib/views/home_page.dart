import '../widgets/footer_text.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../view_mobile/mobile_home_page.dart';
import '../views/landing_view.dart';
import '../widgets/view_breaker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
        mobileView: (constrains) => const MobileHomePage(),
        webView: (constrains) => const Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: SingleChildScrollView(child: LandingView())),
                  FooterText()
                ],
              ),
            ));
  }
}
