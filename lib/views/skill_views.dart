import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/views/journeyTimeLine.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/models.dart';

import '../utils/app_text_styles.dart';

final skillsVisible = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class MySkillsView extends ConsumerStatefulWidget {
  const MySkillsView({super.key});

  @override
  ConsumerState<MySkillsView> createState() => _MySkillsViewState();
}

class _MySkillsViewState extends ConsumerState<MySkillsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Technologies I have expertise with:',
              style: MyTextStyle.subHeadingStyle,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          VisibilityDetector(
            key: const Key('Unique Key'),
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction > 0 &&
                  !ref.read(skillsVisible.notifier).state) {
                ref.read(skillsVisible.notifier).state = true;
              }
            },
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mySkills.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        MediaQuery.sizeOf(context).width * 0.2 > 200
                            ? 200
                            : MediaQuery.sizeOf(context).width * 0.2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  Skills skill = mySkills[index];
                  final isVisible = ref.watch(skillsVisible);
                  return Visibility(
                    visible: isVisible,
                    child: Animate(
                        delay: Duration(milliseconds: 100 * index),
                        effects: [
                          const FadeEffect(),
                          SlideEffect(duration: 500.ms),
                        ],
                        child: SkillItem(
                          skill: skill,
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatefulWidget {
  const SkillItem({required this.skill, super.key});

  final Skills skill;

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: Tooltip(
        message: widget.skill.title,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: isHover ? MyColors.primaryColor : MyColors.secondaryColor,
              borderRadius: isHover
                  ? BorderRadius.circular(100)
                  : BorderRadius.circular(20)),
          padding: const EdgeInsets.all(20),
          duration: const Duration(milliseconds: 200),
          child: Image.asset(
            widget.skill.photoPath,
          ),
        ),
      ),
    );
  }
}
