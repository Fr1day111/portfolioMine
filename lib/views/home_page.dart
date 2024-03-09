import 'package:flutter/material.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/landing_view.dart';
import 'package:portfolio/views/project_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  double pixel =0;
  @override
  void initState() {
    super.initState();
    scrollController =ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixel= scrollController.position.pixels;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            LandingView(pixel: pixel,),
           AboutMe(pixels: pixel,),
           ProjectView(pixels: pixel,)
          ],
        ),
      ),
    );
  }
}
