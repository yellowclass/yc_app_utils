class BaseValidation<T> {
  late T value;
  late String msg;

  BaseValidation({
    required this.value,
    required this.msg,
  });

  BaseValidation<T> copyWith({
    T? value,
    String? msg,
  }) {
    return BaseValidation<T>(
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

  BaseValidation.fromMap(Map<String, dynamic> map) {
    value = map['value'];
    msg = map['msg'];
  }
}
