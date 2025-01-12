import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const SvgIcon({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      getSvg,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : const ColorFilter.mode(MyColors.primaryColor, BlendMode.srcIn),
      width: width??30,
      height: height??30,
      fit: fit ?? BoxFit.contain,
    );
  }

  String get getSvg => 'assets/svg_icons/$assetName.svg';
}
