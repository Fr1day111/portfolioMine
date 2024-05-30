
import 'package:SudipShrestha/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../view_mobile/mobile_home_page.dart';
import '../views/about_me.dart';
import '../views/contact_me_view.dart';
import '../views/journeyTimeLine.dart';
import '../views/landing_view.dart';
import '../views/project_view.dart';
import '../views/skill_views.dart';
import '../widgets/appbar_buttons.dart';
import '../widgets/view_breaker.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  double pixel = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixel = scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ViewWrapper(
        mobileView: (constrains) => const MobileHomePage(),
        webView: (constrains) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            toolbarHeight: 100,
            title: Padding(
              padding:EdgeInsets.only(left: width>=1200?width*0.08:width*0.01,top: 20),
              child: SizedBox(
                width: width*0.2,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                      child: Text('Sudip Shrestha',style: MyTextStyle.headingStyle,))),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: width>=1200?width*0.08:width*0.01),
                child:  FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyTabBar(pixel: pixel,scrollController: scrollController,)
                ),
              )
            ],
          ),
          backgroundColor: MyColors.backgroundColor,
          body: WebSmoothScroll(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LandingView(
                    pixel: pixel,
                  ),
                  AboutMe(
                    pixels: pixel,
                  ),
                  MySkillsView(
                    pixel: pixel,
                  ),
                  JourneyTimeLine(pixel: pixel,),
                  ProjectView(
                    pixels: pixel,
                  ),
                  const ContactMeView(),
                  FooterText()
                ],
              ),
            ),
          ),
        )
    );
  }
}
