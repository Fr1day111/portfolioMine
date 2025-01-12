import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/social_options.dart';

class MobileLandingView extends StatelessWidget {
  const MobileLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width*0.7,
            constraints: const BoxConstraints(minWidth: 200),
            child: ClipPolygon(
              sides: 5,
              borderRadius: 5.0,
              rotate: 90.0,
              boxShadows: [
                PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                PolygonBoxShadow(color: MyColors.primaryColor, elevation: 5.0)
              ],
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.08),
                  child: Image.asset(
                    'assets/profilee.png',
                  ),
                ),
              ),
            ),
          ).animate().fadeIn().moveX(duration: 500.ms, begin: 200),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hello, ',
                          style: MyTextStyle.headingStyleMobile),
                      Row(
                        children: [
                          const Text('I am ',
                              style: MyTextStyle.headingStyleMobile),
                          AnimatedTextKit(
                              pause: const Duration(seconds: 1),
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText('Sudip Shrestha',
                                    textStyle: MyTextStyle.headingStyleMobile,
                                    speed: const Duration(milliseconds: 100),
                                    cursor: '|'),
                                TypewriterAnimatedText('सुदिप श्रेष्ठ',
                                    textStyle: MyTextStyle.headingStyleMobile,
                                    speed: const Duration(milliseconds: 100),
                                    cursor: '|'),
                              ]),
                        ],
                      ),
                      const Text(
                        'Computer Engineer | Flutter Developer',
                        style: MyTextStyle.subHeadingStyleMobile,
                      )
                    ],
                  )
                      .animate(
                        delay: 500.ms,
                      )
                      .fadeIn(delay: 500.ms)
                      .moveX(),
                ),
              ),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const MySocials())
        ],
      ),
    );
  }
}
