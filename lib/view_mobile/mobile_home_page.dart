
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/view_mobile/mobile_aboutMe.dart';
import 'package:portfolio/view_mobile/mobile_landing_view.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/journeyTimeLine.dart';
import 'package:portfolio/views/landing_view.dart';
import 'package:portfolio/views/project_view.dart';
import 'package:portfolio/views/skill_views.dart';
import 'package:portfolio/widgets/sidebar.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
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
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MobileLandingView(
                pixel: pixel,
              ),
              MobileAboutMe(
                pixels: pixel,
              ),
              MySkillsView(
                pixel: pixel,
              ),
              JourneyTimeLine(pixel: pixel,),
              ProjectView(
                pixels: pixel,
                isMobile: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
