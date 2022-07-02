import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageView extends StatelessWidget {
  const CachedNetworkImageView({
    required this.url,
    this.onTap,
    this.boxFit,
    this.errorWidget = const SizedBox(),
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final String url;
  final Function()? onTap;
  final BoxFit? boxFit;
  final Widget errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: url.isEmpty
          ? _buildErrorWidget()
          : CachedNetworkImage(
              imageUrl: url,
              fit: boxFit ?? BoxFit.cover,
              width: width,
              height: height,
              placeholder: (context, imageUrl) => Container(),
              errorWidget: (context, imageUrl, error) => _buildErrorWidget(),
            ),
    );
  }

  Widget _buildErrorWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: 10,
        width: 10,
        fit: BoxFit.contain,
      ),
    );
  }
}
