import 'dart:math';

import '../widgets/footer_text.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../view_mobile/mobile_aboutMe.dart';
import '../view_mobile/mobile_contact_me.dart';
import '../view_mobile/mobile_journey_view.dart';
import '../view_mobile/mobile_landing_view.dart';
import '../views/project_view.dart';
import '../views/skill_views.dart';
import '../widgets/appbar_buttons.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  double pixel = 0;
  List<GlobalKey> keys = List.generate(5, (index) => GlobalKey());
  final _tabs = const [
    Tab(
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Home',
            style: MyTextStyle.appBarStyle,
          )),
    ),
    Tab(
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'About Me',
            style: MyTextStyle.appBarStyle,
          )),
    ),
    Tab(
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Journey',
            style: MyTextStyle.appBarStyle,
          )),
    ),
    Tab(
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Project',
            style: MyTextStyle.appBarStyle,
          )),
    ),
    Tab(
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Contact Me',
            style: MyTextStyle.appBarStyle,
          )),
    ),
  ];

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        centerTitle: true,
        title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Sudip Shrestha',
                  style: MyTextStyle.headingStyle,
                ))),
        bottom: TabBar(
          controller: TabController(
              length: 5, vsync: this, initialIndex: getIndexMobile(pixel)),
          tabs: _tabs,
          onTap: (index) {
            scrollController.animateTo(getOffsetMobile(index),
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn);
          },
          labelColor: MyColors.primaryColor,
          indicatorColor: MyColors.primaryColor,
          dividerColor: Colors.transparent,
          unselectedLabelColor: MyColors.secondaryColor,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MobileLandingView(
                pixel: pixel,
                landingKey: keys[0],
              ),
              MobileAboutMe(
                pixels: pixel,
                aboutMeKey: keys[1],
              ),
              Column(
                children: [
                  MySkillsView(
                    pixel: pixel,
                    skillKey: keys[2],
                  ),
                  JourneyTimeLineMobile(
                    pixel: pixel,
                  ),
                ],
              ),
              ProjectView(
                pixels: pixel,
                isMobile: true,
                projectKey: keys[3],
              ),
              ContactMeMobileView(
                contactMeKey: keys[4],
              ),
              const FooterText()
            ],
          ),
        ),
      ),
    );
  }
}

int getIndex(double pixel) {
  if (pixel < 100) {
    return 0;
  } else if (pixel > 100 && pixel <= 1200) {
    return 1;
  } else if (pixel > 1200 && pixel <= 1900) {
    return 2;
  } else if (pixel > 1900) {
    return 3;
  } else {
    return 0;
  }
}

double getOffset(int index) {
  switch (index) {
    case 0:
      return 0;
    case 1:
      return 1000;
    case 2:
      return 1900;
    case 3:
      return 3000;
    case 4:
      return 4500;
    default:
      return 2400;
  }
}

double getOffsetMobile(int index) {
  switch (index) {
    case 0:
      return 0;
    case 1:
      return 750;
    case 2:
      return 1450;
    case 3:
      return 3000;
    case 4:
      return 5500;
    default:
      return 0;
  }
}
