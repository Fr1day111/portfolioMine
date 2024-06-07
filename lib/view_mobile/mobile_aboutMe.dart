import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';


import '../utils/app_text_styles.dart';
import '../utils/app_texts.dart';

class MobileAboutMe extends StatelessWidget {
  const MobileAboutMe({required this.aboutMeKey,required this.pixels, super.key});

  final double pixels;
  final GlobalKey aboutMeKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
     // height: 900,
      child: Padding(
        key: aboutMeKey,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: pixels>=200?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/aboutPhoto.jpg'))),
            ).animate().fadeIn().moveX(duration: 500.ms,begin: -200),
           const SizedBox(height: 24,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Me',
                  style: MyTextStyle.subHeadingStyleMobile,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    MyTexts.aboutMeText,
                    style: MyTextStyle.aboutUsStyleMobile,
                  ),
                )
              ],
            ).animate().fadeIn().moveX(duration: 500.ms,begin: 200),
          ],
        ):Container(
        ),
      ),
    );
  }
}
