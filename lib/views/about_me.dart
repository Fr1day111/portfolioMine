import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/view_mobile/mobile_aboutMe.dart';
import 'package:portfolio/views/skill_views.dart';
import '../utils/app_text_styles.dart';

import '../utils/app_texts.dart';
import '../widgets/view_breaker.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
        mobileView: (constrains) => const MobileAboutMe(),
        webView: (constrains) => Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Me:',
                        style: MyTextStyle.subHeadingStyle,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            constraints: const BoxConstraints(
                              maxWidth: 800,
                            ),
                            child: Text(
                              MyTexts.aboutMeText,
                              style: MyTextStyle.aboutUsStyle,
                            )
                                .animate()
                                .fadeIn()
                                .moveX(duration: 500.ms, begin: 200),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            constraints:
                                const BoxConstraints(maxHeight: 400, maxWidth: 700),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/mee.webp'))),
                            )
                                .animate()
                                .fadeIn()
                                .moveX(duration: 500.ms, begin: -200),
                          ),
                        ],
                      ),
                      const MySkillsView()
                    ],
                  ),
                ),
              ),
            ));
  }
}
