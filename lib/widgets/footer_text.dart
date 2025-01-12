import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';



class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Text(
          'Made with ♡ by Sudip Shrestha(Flutter Web)',
          style: MyTextStyle.aboutUsStyle,
        ),
      ),
    );
  }
}
