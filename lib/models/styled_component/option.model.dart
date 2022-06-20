class Option {
  String label;
  String value;

  Option({
    required this.label,
    required this.value,
  });

  Option copyWith({
    String? label,
    String? value,
  }) {
    return Option(
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

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      label: map['label'] ?? '',
      value: map['value'] ?? '',
    );
  }
}
