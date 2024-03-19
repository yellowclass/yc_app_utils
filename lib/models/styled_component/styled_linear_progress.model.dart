import 'dart:convert';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledLinearProgress with StyledComponentUnion {
  int percentage;
  double? height;
  SectionBackground? activeBackground;
  SectionBackground? inactiveBackground;
  ImageModel? trailingIcon;
  CompletionBarThumb? thumb;
  V2StyledTextModel? trailingText;

  StyledLinearProgress({
    required this.percentage,
    this.height,
    this.activeBackground,
    this.inactiveBackground,
    this.trailingIcon,
    this.thumb,
    this.trailingText,
  });

  StyledLinearProgress copyWith({
    int? percentage,
    double? height,
    SectionBackground? activeBackground,
    SectionBackground? inactiveBackground,
    ImageModel? trailingIcon,
    CompletionBarThumb? thumb,
    V2StyledTextModel? trailingText,
  }) {
    return StyledLinearProgress(
      percentage: percentage ?? this.percentage,
      height: height ?? this.height,
      activeBackground: activeBackground ?? this.activeBackground,
      inactiveBackground: inactiveBackground ?? this.inactiveBackground,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      thumb: thumb ?? this.thumb,
      trailingText: trailingText ?? this.trailingText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percentage': percentage,
      'height': height,
      'activeBackground': activeBackground?.toMap(),
      'inactiveBackground': inactiveBackground?.toMap(),
      'trailingIcon': trailingIcon?.toMap(),
      'thumb': thumb?.toMap(),
      'trailingText': trailingText?.toMap(),
    };
  }

  factory StyledLinearProgress.fromMap(Map<String, dynamic> map) {
    return StyledLinearProgress(
      percentage: map['percentage'],
      height: map['height']?.toDouble(),
      activeBackground: map['activeBackground'] != null
          ? SectionBackground.fromMap(
              map['activeBackground'] as Map<String, dynamic>)
          : null,
      inactiveBackground: map['inactiveBackground'] != null
          ? SectionBackground.fromMap(
              map['inactiveBackground'] as Map<String, dynamic>)
          : null,
      trailingIcon: map['trailingIcon'] != null
          ? ImageModel.fromMap(map['trailingIcon'] as Map<String, dynamic>)
          : null,
      thumb: map['thumb'] != null
          ? CompletionBarThumb.fromMap(map['thumb'] as Map<String, dynamic>)
          : null,
      trailingText: map['trailingText'] != null
          ? V2StyledTextModel.fromMap(
              map['trailingText'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StyledLinearProgress.fromJson(String source) =>
      StyledLinearProgress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StyledLinearProgress(percentage: $percentage, height: $height, activeBackground: $activeBackground, inactiveBackground: $inactiveBackground, trailingIcon: $trailingIcon, thumb: $thumb, trailingText: $trailingText)';
  }

  @override
  bool operator ==(covariant StyledLinearProgress other) {
    if (identical(this, other)) return true;

    return other.percentage == percentage &&
        other.height == height &&
        other.activeBackground == activeBackground &&
        other.inactiveBackground == inactiveBackground &&
        other.trailingIcon == trailingIcon &&
        other.thumb == thumb &&
        other.trailingText == trailingText;
  }

  @override
  int get hashCode {
    return percentage.hashCode ^
        height.hashCode ^
        activeBackground.hashCode ^
        inactiveBackground.hashCode ^
        trailingIcon.hashCode ^
        thumb.hashCode ^
        trailingText.hashCode;
  }
}

class CompletionBarThumb {
  SectionBackground? background;
  V2StyledTextModel? text;
  String? imageUrl;

  CompletionBarThumb({
    this.background,
    this.text,
    this.imageUrl,
  });

  CompletionBarThumb copyWith({
    SectionBackground? background,
    V2StyledTextModel? text,
    String? imageUrl,
  }) {
    return CompletionBarThumb(
      background: background ?? this.background,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'background': background?.toMap(),
      'text': text?.toMap(),
      'imageUrl': imageUrl,
    };
  }

  factory CompletionBarThumb.fromMap(Map<String, dynamic> map) {
    return CompletionBarThumb(
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      text: map['text'] != null ? V2StyledTextModel.fromMap(map['text']) : null,
      imageUrl: map['imageUrl'],
    );
  }
}
