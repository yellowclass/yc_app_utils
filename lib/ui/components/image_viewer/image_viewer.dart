import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class ImageViewer extends StatelessWidget {
  final List<String> images;
  final int defaultSelectedIndex;
  final String? defaultImageKey;
  final ValueChanged<String>? onDownloadClick;
  final Widget? downloadIcon;
  late int _currentIndex = 0;

  ImageViewer({
    required this.images,
    this.defaultSelectedIndex = 0,
    this.defaultImageKey,
    this.onDownloadClick,
    this.downloadIcon,
    Key? key,
  }) : super(key: key) {
    _currentIndex = defaultSelectedIndex;
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
      floatingActionButton: onDownloadClick == null
          ? null
          : FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.cGREEN_TEXT,
              child: downloadIcon ?? const Icon(Icons.download_outlined),
              onPressed: () => onDownloadClick!.call(images[_currentIndex]),
            ),
      body: SizedBox(
        height: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: defaultSelectedIndex,
              height: double.infinity,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, changeReason) {
                _currentIndex = index;
              }),
          items: List<Widget>.generate(images.length, buildChild),
        ),
      ),
    );
  }

  Widget buildChild(int index) {
    Widget img = CachedNetworkImage(
      imageUrl: images[index],
      fit: BoxFit.contain,
    );
    if (index == defaultSelectedIndex && defaultImageKey != null) {
      return Hero(tag: defaultImageKey!, child: img);
    } else {
      return img;
    }
  }
}
