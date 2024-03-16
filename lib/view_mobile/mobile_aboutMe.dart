import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/app_text_styles.dart';

class MobileAboutMe extends StatelessWidget {
  const MobileAboutMe({required this.pixels, super.key});

  final double pixels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 900,
      child: Padding(
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
                  child: const Text(
                    'Sed tempus risus metus, eu gravida elit varius sit amet. Morbi eu nisl a quam luctus condimentum. Suspendisse quam leo, ultricies sed tincidunt vitae, porttitor quis erat. Nunc et nunc eget tellus fringilla congue pulvinar condimentum quam. Nunc volutpat quis sapien eget ullamcorper. Nulla ullamcorper maximus odio, sit amet auctor velit tincidunt vel. Integer sit amet feugiat tellus. Etiam pellentesque sed metus consequat posuere. Etiam in purus nulla.',
                    style: MyTextStyle.aboutUsStyleMobile,
                    maxLines: 5,
                  ),
                )
              ],
            ).animate().fadeIn().moveX(duration: 500.ms,begin: 200),
          ],
        ):Container(),
      ),
    );
  }
}
