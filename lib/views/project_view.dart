import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';
import 'package:portfolio/utils/models.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({required this.pixels,this.isMobile ,super.key});

  final double pixels;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.9 ,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: isMobile==true?MediaQuery.of(context).size.width * 0.9:MediaQuery.of(context).size.width * 0.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return Card(
              color: MyColors.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      child: Image.asset('assets/aboutPhoto.jpg',fit: BoxFit.cover,))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit:BoxFit.scaleDown,
                          child: Text(
                            projects[index].name,
                            style: MyTextStyle.projectTitleStyle,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            projects[index].detail,
                            style: MyTextStyle.projectDetailStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
