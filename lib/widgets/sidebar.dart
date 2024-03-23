import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../utils/app_colors.dart';

class MySideBar extends StatefulWidget {
  const MySideBar({required this.pixels, super.key});

  final double pixels;

  @override
  State<MySideBar> createState() => _MySideBarState();
}

class _MySideBarState extends State<MySideBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.1,
      child: SidebarX(
        showToggleButton: false,
        theme: SidebarXTheme(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 50,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.secondaryColor),
            selectedIconTheme:
                const IconThemeData(color: MyColors.primaryColor, size: 35)),
        controller: SidebarXController(selectedIndex: getIndex(widget.pixels)),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.person, label: 'Search'),
          SidebarXItem(icon: Icons.work, label: 'Search'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
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
