

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/journeyTimeLine.dart';
import 'package:portfolio/views/landing_view.dart';
import 'package:portfolio/views/project_view.dart';
import 'package:portfolio/views/skill_views.dart';
import 'package:portfolio/widgets/sidebar.dart';

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
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: MySideBar(pixels: pixel)),
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  // ProjectView(
                  //   pixels: pixel,
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
