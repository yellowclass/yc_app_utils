import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledImageWidget extends StatelessWidget {
  const StyledImageWidget({
    required this.styledImageData,
    Key? key,
  }) : super(key: key);

  final StyledImageModel styledImageData;

  @override
  Widget build(BuildContext context) {
    String url = styledImageData.url;
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }

    Uri parsedUri = Uri.parse(url);
    final bool isSvg = parsedUri.path.split(".").last == 'svg';
    Widget image = isSvg
        ? SvgPicture.network(
            url,
            fit: styledImageData.imageFit ?? BoxFit.contain,
            color: styledImageData.fillColor != null
                ? CommonHelpers.v2ColorFromHex(styledImageData.fillColor)
                : null,
          )
        : CachedNetworkImage(
            imageUrl: url,
            httpHeaders: const {
              "Accept": "image/webp,image/apng,image/*,*/*;q=0.8",
            },
            fit: styledImageData.imageFit,
            color: styledImageData.fillColor != null
                ? CommonHelpers.v2ColorFromHex(styledImageData.fillColor)
                : null,
            placeholder: (parsedUri.queryParameters['shimmerHeight'] != null &&
                    parsedUri.queryParameters['shimmerWidth'] != null)
                ? (_, __) => Shimmer.fromColors(
                      baseColor: AppColors.cBLACK_10,
                      highlightColor: AppColors.cWHITE_100,
                      child: Container(
                        height: double.tryParse(
                          parsedUri.queryParameters['shimmerHeight']!,
                        ),
                        width: double.tryParse(
                          parsedUri.queryParameters['shimmerWidth']!,
                        ),
                        color: AppColors.cBLACK_10,
                      ),
                    )
                : null,
          );
    return SizedBox(
      height: styledImageData.height,
      width: styledImageData.width,
      child: styledImageData.cropType == ImageCropTypes.CIRCLE
          ? ClipOval(
              child: image,
            )
          : ClipRRect(
              borderRadius: CommonHelpers.getBorderRadiusFromList(
                styledImageData.borderRadius,
              ),
              child: image,
            ),
    );
  }
}
