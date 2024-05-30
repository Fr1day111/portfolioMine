import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/models.dart';

import '../utils/app_text_styles.dart';

class MySkillsView extends StatelessWidget {
  const MySkillsView({required this.pixel,super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9 ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Technologies I have expertise with:',
                style: MyTextStyle.subHeadingStyle,
              ),
            ),const SizedBox(height: 50,),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mySkills.length,
                gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200),
                itemBuilder: (context, index) {
                  Skills skill = mySkills[index];
                  return pixel>=1200?Animate(
                    delay: Duration(milliseconds: 100*index),
                    effects: [const FadeEffect(),SlideEffect(duration: 500.ms)],
                      child: Image.asset(
                    skill.photoPath,
                    height: 100,
                  )):Container();
                }),
          ],
        ),
      ),
    );
  }
}
