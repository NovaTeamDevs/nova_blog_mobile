import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomLoadNetWorkWidget extends StatelessWidget {
  const CustomLoadNetWorkWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.fill,
    this.radius = 12.0,
    this.imageWidth = double.infinity,
    this.imageHeight = 45
  });
  final String imageUrl;
  final BoxFit fit;
  final double radius,imageWidth,imageHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          placeholder: (context, url) => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
