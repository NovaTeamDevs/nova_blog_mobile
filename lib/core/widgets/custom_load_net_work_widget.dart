import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomLoadNetWorkWidget extends StatelessWidget {
  const CustomLoadNetWorkWidget({super.key, required this.imageUrl, this.fit = BoxFit.fill,this.radius = 12.0});
  final String imageUrl;
  final BoxFit fit;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => SizedBox(
          height: 12,
            width: 12,
            child: CircularProgressIndicator()),
      ),
    );
  }
}
