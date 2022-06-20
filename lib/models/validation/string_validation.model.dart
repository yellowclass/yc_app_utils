class StringValidation {
  String value;
  String msg;

  StringValidation({
    required this.value,
    required this.msg,
  });

  StringValidation copyWith({
    String? value,
    String? msg,
  }) {
    return StringValidation(
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

  factory StringValidation.fromMap(Map<String, dynamic> map) {
    return StringValidation(
      value: map['value'] ?? '',
      msg: map['msg'] ?? '',
    );
  }
}
