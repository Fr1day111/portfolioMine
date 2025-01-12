import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/views/skill_views.dart';

import '../utils/app_text_styles.dart';
import '../utils/app_texts.dart';

class MobileAboutMe extends StatelessWidget {
  const MobileAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: 900,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me:',
                    style: MyTextStyle.subHeadingStyleMobile,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AspectRatio(
                    aspectRatio: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/mee.webp'))),
                    ).animate().fadeIn().moveX(duration: 500.ms, begin: -200),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    MyTexts.aboutMeText,
                    style: MyTextStyle.aboutUsStyleMobile,
                  ).animate().fadeIn().moveX(duration: 500.ms, begin: 200),
                  MySkillsView(),
                ],
              ),
            )),
      ),
    );
  }
}
