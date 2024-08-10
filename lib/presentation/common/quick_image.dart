import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class QuickImage<T> extends StatelessWidget {
  const QuickImage({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.fit,
    this.backgroundColor,
    this.color,
    this.loaderIconSize,
    this.errorUrl,
    this.radius,
    this.loaderWidget,
    this.padding,
  });

  final double? height;
  final double? width;
  final Size? loaderIconSize;
  final Color? backgroundColor;
  final Color? color;
  final Widget? loaderWidget;
  final T url;
  final BoxFit? fit;
  final BorderRadiusGeometry? radius;
  final String? errorUrl;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {



    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Container(
        color: backgroundColor,
        height: height,
        width: width,
        padding: padding,
        child: _buildImage(context),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (url is File) {
      return Image.file(
        url as File,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    } else if(url is IconData) {
      return Icon(url as IconData);
    }else{
      return url.toString().toLowerCase().endsWith("svg")
          ? _buildSvgImage(context)
          : _buildCachedNetworkImage(context);
    }
  }

  Widget _buildSvgImage(BuildContext context) {
    return url.toString().contains("http")
        ? SvgPicture.network(
            url.toString(),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          )
        : SvgPicture.asset(
            url.toString(),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          );
  }

  Widget _buildCachedNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      progressIndicatorBuilder: (context, child, progress) =>
          loaderWidget ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      cacheKey: "$url",
      errorWidget: (context, str, dyn) => _buildErrorWidget(context),
      imageUrl: url.toString(),
      width: width,
      height: height,
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    try {
      if (errorUrl != null) {
        return errorUrl!.contains("svg")
            ? SvgPicture.asset(
                errorUrl!,
                height: height,
                width: width,
                fit: fit ?? BoxFit.cover,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              )
            : Image.asset(
                errorUrl!,
                fit: fit ?? BoxFit.cover,
                width: width,
                height: height,
              );
      }
      return const Placeholder(
        child: Text(" For custom error image \n use [errorUrl:'assets_url']"),
      );
    } catch (e) {
      rethrow;
    }
  }
}
