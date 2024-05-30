import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MySocials extends StatelessWidget {
  const MySocials({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyIcon(icon:FontAwesomeIcons.facebookF,socialLink: 'https://www.facebook.com/sudip.shrestha1111',),
          MyIcon(icon:FontAwesomeIcons.linkedinIn,socialLink: 'https://www.linkedin.com/in/sudip-shrestha-454876240/',),
          MyIcon(icon:FontAwesomeIcons.github,socialLink: 'https://github.com/Fr1day111',),
          MyIcon(icon:FontAwesomeIcons.discord,socialLink: 'https://discord.com/users/481757182644453377',)
        ],
      ).animate(delay: 500.ms).fadeIn(delay: 500.ms).slideX(),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({required this.icon,required this.socialLink,super.key});
  final IconData icon;
  final String socialLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          launchUrlString(socialLink);
        },
          child: Icon(icon,color: MyColors.primaryColor,size: 40,)),
    );
  }
}

