import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    required this.images,
    this.defaultSelectedIndex = 0,
    this.defaultImageKey,
    Key? key,
  }) : super(key: key);

  final List<String> images;
  final int defaultSelectedIndex;
  final String? defaultImageKey;

  Widget buildChild(int i, String imgUrl) {
    Widget img = CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.contain,
    );
    if (i == defaultSelectedIndex && defaultImageKey != null) {
      return Hero(tag: defaultImageKey!, child: img);
    } else {
      return img;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.cBLACK,
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: defaultSelectedIndex,
            height: double.infinity,
            enableInfiniteScroll: false,
            viewportFraction: 1,
          ),
          items: [
            for (var i = 0; i < images.length; i++)
              buildChild(
                i,
                images[i],
              ),
          ],
        ),
      ),
    );
  }
}
