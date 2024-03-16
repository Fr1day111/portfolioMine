import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';

class MobileLandingView extends StatelessWidget {
  const MobileLandingView({required this.pixel, super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ClipPolygon(
                  sides: 5,
                  borderRadius: 5.0,
                  rotate: 90.0,
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                    PolygonBoxShadow(
                        color: MyColors.primaryColor, elevation: 5.0)
                  ],
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.15),
                      child: Image.asset(
                        'assets/profilee.png',
                      ),
                    ),
                  ),
                ),
              ).animate().fadeIn().moveX(duration: 500.ms,begin: 200),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child:  Column(
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
                                  TypewriterAnimatedText('Sudip Shrestha',textStyle: MyTextStyle.headingStyleMobile,speed: const Duration(milliseconds: 100),cursor: '|'),
                                  TypewriterAnimatedText('सुदिप श्रेष्ठ',textStyle: MyTextStyle.headingStyleMobile,speed: const Duration(milliseconds: 100),cursor: '|'),
                                ]),
                          ],
                        ),
                        const Text(
                          'Computer Engineer | Flutter Developer',
                          style: MyTextStyle.subHeadingStyleMobile,
                        )
                      ],
                    ).animate(
                      delay: 500.ms,
                    ).fadeIn(delay: 500.ms).moveY(),
                  ),
                ),
              ),
              // SizedBox(
              //     height: MediaQuery.of(context).size.width*0.1
              // ),
            ],
          )),
    );
  }
}
