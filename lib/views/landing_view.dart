import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingView extends StatelessWidget {
  const LandingView({required this.pixel, super.key});

  final double pixel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello, I am Sudeep Shrestha',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text('Computer Engineer | Flutter Developer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      )),
    );
  }
}
