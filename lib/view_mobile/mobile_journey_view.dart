import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';
import 'package:portfolio/utils/models.dart';
import 'package:timelines/timelines.dart';

class JourneyTimeLineMobile extends StatelessWidget {
  const JourneyTimeLineMobile({required this.pixel,super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Journey:',
              style: MyTextStyle.subHeadingStyle,
            ),
            const SizedBox(height: 50,),
            FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
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
                contentsBuilder: (context, index) => pixel>=1600?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Card(
                    color: MyColors.secondaryColor,
                    child: Center(
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.8,
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
                  ).animate(delay: Duration(milliseconds: 500*index),).fade().slideX(begin:2,duration: 500.ms),
                ):Container(),
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
