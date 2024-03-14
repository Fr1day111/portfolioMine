import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';
import 'package:portfolio/utils/models.dart';
import 'package:timelines/timelines.dart';

class JourneyTimeLine extends StatelessWidget {
  const JourneyTimeLine({required this.pixel,super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Academic Journey:',
              style: MyTextStyle.subHeadingStyle,
            ),
            const SizedBox(height: 50,),
            FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                  color: MyColors.secondaryColor,
                  indicatorTheme: const IndicatorThemeData(
                    size: 50,color: MyColors.primaryColor,
                  ),
                connectorTheme:const ConnectorThemeData(
                  thickness: 10,
                  space: 50,
                  color: MyColors.primaryColor
                )
              ),
              builder: TimelineTileBuilder.connectedFromStyle(
                firstConnectorStyle: ConnectorStyle.transparent,
                lastConnectorStyle: ConnectorStyle.transparent,
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) => pixel>=1600?Card(
                  color: MyColors.secondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                  child: Text(myAcademy[index].degree,style: MyTextStyle.academyStyle,)),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                  child: Text(myAcademy[index].name,style: MyTextStyle.academySmallStyle,)),
                            ],
                          )),
                    ),
                  ),
                ).animate(delay: Duration(milliseconds: 500*index),).fade().slideX(begin:(index%2==0)?2:-2,duration: 500.ms):Container(),
                connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                itemCount: myAcademy.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
