class IntValidation {
  int value;
  String msg;

  IntValidation({
    required this.value,
    required this.msg,
  });

  IntValidation copyWith({
    int? value,
    String? msg,
  }) {
    return IntValidation(
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

  factory IntValidation.fromMap(Map<String, dynamic> map) {
    return IntValidation(
      value: map['value']?.toInt() ?? 0,
      msg: map['msg'] ?? '',
    );
  }
}
