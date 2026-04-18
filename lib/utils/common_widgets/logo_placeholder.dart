import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final double? logoWidth;
  final double? logoHeight;
  final Color? backgroundColor;
  final Color? logoColor;

  const LogoPlaceholder({
    super.key,
    this.width,
    this.height,
    this.logoWidth = 80,
    this.logoHeight = 80,
    this.backgroundColor,
    this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      color: backgroundColor ?? Colors.grey[200],
      child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          color: logoColor ?? Colors.grey,
          width: logoWidth,
          height: logoHeight,
        ),
      ),
    );
  }
}
