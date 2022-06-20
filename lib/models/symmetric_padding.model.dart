import 'dart:convert';

class SymmetricPadding {
  final double horizontal;
  final double vertical;

  const SymmetricPadding({
    required this.horizontal,
    required this.vertical,
  });

  factory SymmetricPadding.fromMap(Map<String, dynamic> map) {
    return SymmetricPadding(
      horizontal: map['horizontal']?.toDouble() ?? 0.0,
      vertical: map['vertical']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'horizontal': horizontal,
      'vertical': vertical,
    };
  }

  SymmetricPadding copyWith({
    double? horizontal,
    double? vertical,
  }) {
    return SymmetricPadding(
      horizontal: horizontal ?? this.horizontal,
      vertical: vertical ?? this.vertical,
    );
  }

  String toJson() => json.encode(toMap());

  factory SymmetricPadding.fromJson(String source) =>
      SymmetricPadding.fromMap(json.decode(source));

  @override
  String toString() =>
      'SymmetricPadding(horizontal: $horizontal, vertical: $vertical)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SymmetricPadding &&
        other.horizontal == horizontal &&
        other.vertical == vertical;
  }

  @override
  int get hashCode => horizontal.hashCode ^ vertical.hashCode;
}
