import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.label, required this.onTap, super.key});

  final String label;
  final Function onTap;

  // final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}