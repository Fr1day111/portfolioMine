import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/social_options.dart';

class LandingView extends StatelessWidget {
  const LandingView({required this.pixel, super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 900,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello,', style: MyTextStyle.headingStyle),
                  Row(
                    children: [
                      const Text('I am ', style: MyTextStyle.headingStyle),
                      AnimatedTextKit(
                          pause: const Duration(seconds: 1),
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText('Sudip Shrestha',
                                textStyle: MyTextStyle.headingStyle,
                                speed: const Duration(milliseconds: 100),
                                cursor: '|'),
                            TypewriterAnimatedText('सुदिप श्रेष्ठ',
                                textStyle: MyTextStyle.headingStyle,
                                speed: const Duration(milliseconds: 100),
                                cursor: '|'),
                          ]),
                    ],
                  ),
                  const Text(
                    'Computer Engineer | Flutter Developer',
                    style: MyTextStyle.subHeadingStyle,
                  ),
                  const MySocials()
                ],
              )
                  .animate(
                    delay: 500.ms,
                  )
                  .fadeIn(delay: 500.ms)
                  .moveX(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Animate(
            effects: [
              SlideEffect(duration: 500.ms),
              FadeEffect(duration: 500.ms),
            ],
            child: SizedBox(
              //height: 700,
              width: MediaQuery.of(context).size.width * 0.4,
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
                        top: MediaQuery.of(context).size.width * 0.05),
                    child: Image.asset(
                      'assets/profilee.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
