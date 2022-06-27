class OptionModel {
  String label;
  String value;

  OptionModel({
    required this.label,
    required this.value,
  });

  OptionModel copyWith({
    String? label,
    String? value,
  }) {
    return OptionModel(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      label: map['label'] ?? '',
      value: map['value'] ?? '',
    );
  }
}
