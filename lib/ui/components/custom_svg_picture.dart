import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

final Map<String, String> _svgCache = {};

class CustomSvgPicture extends StatefulWidget {
  const CustomSvgPicture(
    this.url, {
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.errorWidget,
    this.placeholder = const SizedBox.shrink(),
    this.loadingWidget,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;
  final Widget? errorWidget;
  final Widget placeholder;
  final Widget? loadingWidget;

  @override
  _CustomSvgPictureState createState() => _CustomSvgPictureState();
}

class _CustomSvgPictureState extends State<CustomSvgPicture> {
  late Future<String> _svgFuture;
  String? _currentSvg;

  @override
  void initState() {
    super.initState();
    _svgFuture = _loadSvg(widget.url);
  }

  @override
  void didUpdateWidget(CustomSvgPicture oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      if (_svgCache.containsKey(widget.url)) {
        setState(() {
          _currentSvg = _svgCache[widget.url];
        });
        _svgFuture = Future.value(_svgCache[widget.url]);
      } else {
        _svgFuture = _loadSvg(widget.url);
      }
    }
  }

  Future<String> _loadSvg(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load SVG');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _svgFuture,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _currentSvg != null
              ? SvgPicture.string(
                  _currentSvg!,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                  alignment: widget.alignment,
                  color: widget.color,
                  placeholderBuilder: (_) => widget.placeholder,
                )
              : widget.placeholder;
        } else if (snapshot.hasError) {
          return widget.errorWidget ?? const SizedBox.shrink();
        } else {
          _currentSvg = snapshot.data;
          return SvgPicture.string(
            snapshot.data!,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            alignment: widget.alignment,
            color: widget.color,
            placeholderBuilder: (_) => widget.placeholder,
          );
        }
      },
    );
  }
}
