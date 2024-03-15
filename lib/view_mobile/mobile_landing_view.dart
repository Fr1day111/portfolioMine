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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 1000,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  //height: 700,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello,\nI am Sudip Shrestha',
                            style: MyTextStyle.headingStyle),
                        Text(
                          'Computer Engineer | Flutter Developer',
                          style: MyTextStyle.subHeadingStyle,
                        )
                      ],
                    ).animate(
                      delay: 500.ms,
                    ).fadeIn(delay: 500.ms).moveY(),
                  ),
                ),
                // SizedBox(
                //     height: MediaQuery.of(context).size.width*0.1
                // ),
              ],
            )),
      ),
    );
  }
}
