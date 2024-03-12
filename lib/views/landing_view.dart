import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';

class LandingView extends StatelessWidget {
  const LandingView({required this.pixel, super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 1000,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
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
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            SizedBox(
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
          ],
        )),
      ),
    );
  }
}
