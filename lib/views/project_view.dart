import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/models.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({required this.pixels,this.isMobile ,super.key});

  final double pixels;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.9 ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Projects:',
            style: MyTextStyle.subHeadingStyle,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: isMobile==true?width * 0.9:width>=1500?width * 0.4:width*0.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: isMobile==true?1.5:1.1),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return pixels>=2500?Card(
                  color: MyColors.secondaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          child: Container(color:MyColors.primaryColor,child: Image.asset(projects[index].photoPath,fit: BoxFit.fill,)))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            InkWell(
                              onTap: (){
                                launchUrlString(projects[index].link);
                              },
                              child: const Text(
                                'View Project ->',
                                textAlign: TextAlign.start,
                                style: MyTextStyle.projectDetailStyleButton,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate(delay: Duration(milliseconds: 500*index)).fadeIn().slide(duration: 500.ms):Container();
              }),
        ],
      ),
    );
  }
}
