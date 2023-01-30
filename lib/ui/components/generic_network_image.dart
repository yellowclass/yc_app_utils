import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenericNetworkImage extends StatelessWidget {
  const GenericNetworkImage(
    this.url, {
    this.width,
    this.height,
    this.isCircular = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.shouldCache = true,
    this.errorWidget,
    this.placeholder,
    this.loadingBuilder,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? width;
  final double? height;
  final bool isCircular;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;
  final bool shouldCache;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    bool shouldCache = getShouldCache;
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }

    final bool isSvg = Uri.parse(url).path.split(".").last == 'svg';

    Widget image = isSvg
        ? SvgPicture.network(
            url,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            color: color,
            placeholderBuilder:
                placeholder != null ? (_) => placeholder! : null,
          )
        : shouldCache
            ? CachedNetworkImage(
                imageUrl: url,
                width: width,
                height: height,
                fit: fit,
                alignment: alignment,
                httpHeaders: const {
                  "Accept": "image/webp,image/apng,image/*,*/*;q=0.8",
                },
                color: color,
                placeholder:
                    placeholder != null ? (_, __) => placeholder! : null,
                errorWidget:
                    errorWidget != null ? (_, __, ___) => errorWidget! : null,
              )
            : Image.network(
                url,
                headers: const {
                  "Accept": "image/webp,image/apng,image/*,*/*;q=0.8",
                },
                width: width,
                height: height,
                fit: fit,
                alignment: alignment,
                color: color,
                errorBuilder:
                    errorWidget != null ? (_, __, ___) => errorWidget! : null,
                loadingBuilder: loadingBuilder ??
                    (placeholder != null
                        ? (_, __, ___) => sizedPlaceHolder!
                        : null),
              );

    if (isCircular) {
      return ClipOval(
        child: image,
      );
    } else {
      return image;
    }
  }

  bool get getShouldCache {
    final qpm = Uri.parse(url).queryParameters;
    if (qpm['nc'] != null) {
      return !(int.tryParse(qpm['nc'].toString()) == 1);
    } else {
      return shouldCache;
    }
  }

  Widget? get sizedPlaceHolder {
    final qpm = Uri.parse(url).queryParameters;
    // if (qpm.containsKey("mW") && qpm.containsKey("mH")) {
    return SizedBox(
      width: int.tryParse(qpm["mW"] ?? "")?.toDouble(),
      height: int.tryParse(qpm["mH"] ?? "")?.toDouble(),
      child: placeholder,
    );
    // }
    // return placeholder;
  }
}
