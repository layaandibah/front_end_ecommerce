import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomItemImage extends StatelessWidget {
  final String imageUrl;
  final String itemid;

  const CustomItemImage({Key? key, required this.imageUrl, required this.itemid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: AppColor.wightpurble,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Hero(
        tag:itemid ,
        child: CachedNetworkImage(
          imageUrl:
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
