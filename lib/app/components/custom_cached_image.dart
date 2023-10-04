import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder:(context, url, progress) => SpinKitCircle(
        color: color ?? theme.primaryColor,
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.no_photography_rounded,
          color: theme.iconTheme.color,
        ),
      ),
    );
  }
}