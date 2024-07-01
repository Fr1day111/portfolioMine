import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_text_styles.dart';

import '../utils/app_texts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({required this.aboutMeKey,required this.pixels, super.key});

  final double pixels;
  final GlobalKey aboutMeKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: aboutMeKey,
      width: MediaQuery.of(context).size.width,
      height: 900,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Visibility(
          visible: pixels>=200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage('assets/aboutPhoto.jpg'))),
              ).animate().fadeIn().moveX(duration: 500.ms,begin: -200),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me',
                    style: MyTextStyle.subHeadingStyle,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:  Text(MyTexts.aboutMeText,
                      style: MyTextStyle.aboutUsStyle,
                      //maxLines: 5,
                    ),
                  )
                ],
              ).animate().fadeIn().moveX(duration: 500.ms,begin: 200),
            ],
          ),
        ),
      ),
    );
  }
}
