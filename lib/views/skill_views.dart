import 'package:flutter/material.dart';
import 'package:portfolio/utils/models.dart';

class MySkillsView extends StatelessWidget {
  const MySkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mySkills.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            Skills skill = mySkills[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(skill.photoPath,height: 300,), Text(skill.title)],
              ),
            );
          }),
    );
  }
}
