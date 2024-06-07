import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({required this.pixel,required this.scrollController,required this.keys,super.key});

  final double pixel;
  final ScrollController scrollController;
  final List<GlobalKey> keys;

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>with TickerProviderStateMixin {
  int currentIndex= 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }
  void _handleScroll() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final double scrollOffsetY = widget.scrollController.offset + position.dy;

    setState(() {
      currentIndex = 0;
      for (int i = 0; i < widget.keys.length; i++) {
        final key = widget.keys[i];
        final renderBoxRed = key.currentContext?.findRenderObject() as RenderBox?;
        if (renderBoxRed != null) {
          final Offset widgetPosition = renderBoxRed.localToGlobal(Offset.zero);
          final double widgetHeight = renderBoxRed.size.height;
          if (scrollOffsetY >= widgetPosition.dy &&
              scrollOffsetY < widgetPosition.dy + widgetHeight) {
            currentIndex = i;
            break;
          }
        }
      }
    });
  }
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
      width: width>=1200?width*0.4:width*0.5,
      child: TabBar(
        controller: TabController(length: 5, vsync: this,initialIndex: width>=1900?getIndex(widget.pixel):getIndexTab(widget.pixel)),
        tabs: _tabs,
        onTap: (index){
          Scrollable.ensureVisible(widget.keys[index].currentContext!,duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
         // widget.scrollController.animateTo(getOffset(index,width), duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
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
  const MyTabBarMobile({required this.keys,required this.pixel,required this.scrollController,super.key});

  final double pixel;
  final ScrollController scrollController;
  final List<GlobalKey> keys;

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
    return TabBar(
      controller: TabController(length: 5, vsync: this,initialIndex: getIndex(widget.pixel)),
      tabs: _tabs,
      onTap: (index){
        Scrollable.ensureVisible(widget.keys[index].currentContext!,duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      //  widget.scrollController.animateTo(getOffsetMobile(index), duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
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
  }else if(pixel>1200&&pixel<=2500){
    return 2;
  }else if(pixel>2500&&pixel<=3200){
    return 3;
  }
  else if(pixel>3200){
    return 4;
  }
  else{
    return 0;
  }
}
int getIndexTab(double pixel){
  if(pixel < 700){
    return 0;
  }else if(pixel>700&&pixel<=1700){
    return 1;
  }else if(pixel>1700&&pixel<=2800){
    return 2;
  }else if(pixel>2800&&pixel<=3800){
    return 3;
  }
  else if(pixel>3800){
    return 4;
  }
  else{
    return 0;
  }
}
int getIndexMobile(double pixel){
  if(pixel < 400){
    return 0;
  }else if(pixel>400&&pixel<=1200){
    return 1;
  }else if(pixel>1200&&pixel<=2200){
    return 2;
  }else if(pixel>2200&&pixel<=4000){
    return 3;
  }
  else if(pixel>4000){
    return 4;
  }
  else{
    return 0;
  }
}