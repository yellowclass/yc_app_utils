import 'package:yc_app_utils/models/models.import.dart';

class StyledRatingSlider with FormComponentUnion {
  String id;
  Validation? validation;
  int? defaultValue;
  List<V2StyledTextModel>? prefix;
  List<V2StyledTextModel>? suffix;
  List<RatingSliderLevel> levels;
  List<String> gradientColors;

  StyledRatingSlider({
    required this.id,
    this.validation,
    this.defaultValue,
    this.prefix,
    this.suffix,
    required this.levels,
    required this.gradientColors,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is StyledRatingSlider &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              validation == other.validation &&
              defaultValue == other.defaultValue &&
              prefix == other.prefix &&
              suffix == other.suffix &&
              levels == other.levels &&
              gradientColors == other.gradientColors);

  @override
  int get hashCode =>
      id.hashCode ^
      validation.hashCode ^
      defaultValue.hashCode ^
      prefix.hashCode ^
      suffix.hashCode ^
      levels.hashCode ^
      gradientColors.hashCode;

  @override
  String toString() {
    return 'StyledRatingSlider{' +
        ' id: $id,' +
        ' validation: $validation,' +
        ' defaultValue: $defaultValue,' +
        ' prefix: $prefix,' +
        ' suffix: $suffix,' +
        ' levels: $levels,' +
        ' gradientColors: $gradientColors,' +
        '}';
  }

  StyledRatingSlider copyWith({
    String? id,
    Validation? validation,
    int? defaultValue,
    List<V2StyledTextModel>? prefix,
    List<V2StyledTextModel>? suffix,
    List<RatingSliderLevel>? levels,
    List<String>? gradientColors,
  }) {
    return StyledRatingSlider(
      id: id ?? this.id,
      validation: validation ?? this.validation,
      defaultValue: defaultValue ?? this.defaultValue,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
      levels: levels ?? this.levels,
      gradientColors: gradientColors ?? this.gradientColors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'validation': this.validation,
      'defaultValue': this.defaultValue,
      'prefix': this.prefix,
      'suffix': this.suffix,
      'levels': this.levels,
      'gradientColors': this.gradientColors,
    };
  }

  factory StyledRatingSlider.fromMap(Map<String, dynamic> map) {
    return StyledRatingSlider(
      id: map['id'],
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      defaultValue: map['defaultValue'],
      prefix: map['prefix'] != null
          ? List<V2StyledTextModel>.from(
          map['prefix'].map((e) => V2StyledTextModel.fromMap(e)))
          : null,
      suffix: map['suffix'] != null
          ? List<V2StyledTextModel>.from(
          map['suffix'].map((e) => V2StyledTextModel.fromMap(e)))
          : null,
      levels: List<RatingSliderLevel>.from(
          map['levels'].map((e) => RatingSliderLevel.fromMap(e))),
      gradientColors: List<String>.from(map['gradientColors']),
    );
  }
}

class RatingSliderLevel {
  String id;
  V2StyledTextModel label;
  String? onSelectBgColor;

  RatingSliderLevel({
    required this.id,
    required this.label,
    this.onSelectBgColor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is RatingSliderLevel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              label == other.label &&
              onSelectBgColor == other.onSelectBgColor);

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ onSelectBgColor.hashCode;

  @override
  String toString() {
    return 'RatingSliderLevel{' +
        ' id: $id,' +
        ' label: $label,' +
        ' onSelectBgColor: $onSelectBgColor,' +
        '}';
  }

  RatingSliderLevel copyWith({
    String? id,
    V2StyledTextModel? label,
    String? onSelectBgColor,
  }) {
    return RatingSliderLevel(
      id: id ?? this.id,
      label: label ?? this.label,
      onSelectBgColor: onSelectBgColor ?? this.onSelectBgColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'label': this.label,
      'onSelectBgColor': this.onSelectBgColor,
    };
  }

  factory RatingSliderLevel.fromMap(Map<String, dynamic> map) {
    return RatingSliderLevel(
      id: map['id'],
      label: V2StyledTextModel.fromMap(map['label']),
      onSelectBgColor: map['onSelectBgColor'],
    );
  }
}
