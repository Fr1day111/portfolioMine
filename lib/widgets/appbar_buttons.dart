import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_text_styles.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({required this.pixel,super.key});

  final double pixel;

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>with TickerProviderStateMixin {
  // late TabController _tabController;
  final _tabs = const [
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Home',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('About Me',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Journey',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Project',style: MyTextStyle.appBarStyle,)),),
    Tab(icon: FittedBox(fit:BoxFit.scaleDown,child: Text('Contact Me',style: MyTextStyle.appBarStyle,)),),
  ];
   // @override
   // void initState() {
   //   int index = getIndex(widget.pixel);
   //   print(widget.pixel);
   //   _tabController = TabController(length: 5, vsync: this,initialIndex: index);
   //   super.initState();
   // }
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return SizedBox(
      width: width>=1100?width*0.4:width*0.5,
      child: TabBar(
        controller: TabController(length: 5, vsync: this,initialIndex: getIndex(widget.pixel)),
          tabs: _tabs,
        labelColor: MyColors.primaryColor,
        indicatorColor: MyColors.primaryColor,
        dividerColor: Colors.transparent,
        unselectedLabelColor: MyColors.secondaryColor,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

int getIndex(double pixel){
  if(pixel < 400){
    return 0;
  }else if(pixel>400&&pixel<=1200){
    return 1;
  }else if(pixel>1200){
    return 2;
  }else{
    return 0;
  }
}
