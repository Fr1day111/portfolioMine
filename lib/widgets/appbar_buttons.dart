import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({required this.pixel,required this.scrollController,super.key});

  final double pixel;
  final ScrollController scrollController;

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>with TickerProviderStateMixin {
  final _tabs = const [
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Home',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('About Me',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Journey',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Project',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Contact Me',style: MyTextStyle.appBarStyle,)),),
  ];
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return SizedBox(
      width: width>=1100?width*0.4:width*0.5,
      child: TabBar(
        controller: TabController(length: 5, vsync: this,initialIndex: getIndex(widget.pixel)),
        tabs: _tabs,
        onTap: (index){
          widget.scrollController.animateTo(getOffset(index), duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
        },
        labelColor: MyColors.primaryColor,
        indicatorColor: MyColors.primaryColor,
        dividerColor: Colors.transparent,
        unselectedLabelColor: MyColors.secondaryColor,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

class MyTabBarMobile extends StatefulWidget {
  const MyTabBarMobile({required this.pixel,required this.scrollController,super.key});

  final double pixel;
  final ScrollController scrollController;

  @override
  State<MyTabBarMobile> createState() => _MyTabBarMobileState();
}

class _MyTabBarMobileState extends State<MyTabBarMobile>with TickerProviderStateMixin{
  final _tabs = const [
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Home',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('About Me',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Journey',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Project',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Contact Me',style: MyTextStyle.appBarStyle,)),),
  ];
  @override
  Widget build(BuildContext context) {
    //double width =MediaQuery.of(context).size.width;
    return TabBar(
      controller: TabController(length: 5, vsync: this,initialIndex: getIndex(widget.pixel)),
      tabs: _tabs,
      onTap: (index){
        widget.scrollController.animateTo(getOffset(index), duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
      labelColor: MyColors.primaryColor,
      indicatorColor: MyColors.primaryColor,
      dividerColor: Colors.transparent,
      unselectedLabelColor: MyColors.secondaryColor,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
int getIndex(double pixel){
  if(pixel < 400){
    return 0;
  }else if(pixel>400&&pixel<=1200){
    return 1;
  }else if(pixel>1200&&pixel<=1900){
    return 2;
  }else if(pixel>1900){
    return 3;
  }
  else{
    return 0;
  }
}
double getOffset(int index){
 switch(index){
   case 0:
     return 0;
   case 1:
     return 900;
   case 2:
     return 1900;
   case 3:
     return 2400;
   default:
     return 2400;
 }
}
