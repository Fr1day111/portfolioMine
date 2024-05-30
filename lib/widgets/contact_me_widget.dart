
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({required this.icon,required this.title,required this.detail,super.key});

  final IconData icon;
  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: MyColors.primaryColor,size: 70,),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: MyTextStyle.contactMeStyle,),
              Text(detail,style: MyTextStyle.contactMeSmallStyle,)
            ],
          ),
        ],
      ),
    );
  }
}
