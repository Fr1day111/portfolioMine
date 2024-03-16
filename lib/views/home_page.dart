
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';
import 'package:portfolio/view_mobile/mobile_home_page.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/journeyTimeLine.dart';
import 'package:portfolio/views/landing_view.dart';
import 'package:portfolio/views/project_view.dart';
import 'package:portfolio/views/skill_views.dart';
import 'package:portfolio/widgets/appbar_buttons.dart';
import 'package:portfolio/widgets/sidebar.dart';
import 'package:portfolio/widgets/view_breaker.dart';

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
    return ViewWrapper(
        mobileView: (constrains) => const MobileHomePage(),
        webView: (constrains) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            toolbarHeight: 100,
            title: Padding(
              padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08,top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.2,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                      child: Text('Sudip Shrestha',style: MyTextStyle.headingStyle,))),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
                child:  FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyTabBar(pixel: pixel,)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Home',style: MyTextStyle.appBarStyle,),
                  //     Text('About Me',style: MyTextStyle.appBarStyle,),
                  //     Text('Journey',style: MyTextStyle.appBarStyle,),
                  //     Text('Projects',style: MyTextStyle.appBarStyle,),
                  //     Text('Contact Me',style: MyTextStyle.appBarStyle,),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
          backgroundColor: MyColors.backgroundColor,
          body: SingleChildScrollView(
            controller: scrollController,
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
                )
              ],
            ),
          ),
        )
    );
  }
}
