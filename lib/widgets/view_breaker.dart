import 'package:flutter/material.dart';

class ViewsBreaker {
  static const double mobileViewMaxWidth = 786;
}

class ViewWrapper extends StatelessWidget {
  const ViewWrapper({
    super.key,
    required this.mobileView,
    required this.webView,
  });

  final Function(BoxConstraints constraints) mobileView;
  final Function(BoxConstraints constraints) webView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ViewsBreaker.mobileViewMaxWidth) {
          return mobileView(constraints);
        } else {
          return webView(constraints);
        }
      },
    );
  }
}