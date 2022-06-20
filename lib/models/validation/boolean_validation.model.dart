class BooleanValidation {
  bool value;
  String msg;

  BooleanValidation({
    required this.value,
    required this.msg,
  });

  BooleanValidation copyWith({
    bool? value,
    String? msg,
  }) {
    return BooleanValidation(
      value: value ?? this.value,
      msg: msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'msg': msg,
    };
  }

  factory BooleanValidation.fromMap(Map<String, dynamic> map) {
    return BooleanValidation(
      value: map['value'] ?? false,
      msg: map['msg'] ?? '',
    );
  }
}
