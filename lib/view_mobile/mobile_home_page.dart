import 'dart:math';

import 'package:web_smooth_scroll/web_smooth_scroll.dart';

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

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: MobileLandingView(),
      ),
    );
  }
}
