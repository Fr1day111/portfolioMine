import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/landing_view.dart';
import 'package:portfolio/views/project_view.dart';
import 'package:portfolio/views/skill_views.dart';
import 'package:portfolio/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySideBar(pixels: pixel),
            SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LandingView(
                      pixel: pixel,
                    ),
                    AboutMe(
                      pixels: pixel,
                    ),
                    MySkillsView(),
                    ProjectView(
                      pixels: pixel,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
