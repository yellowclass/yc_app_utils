abstract class BaseValidation<T> {
  late T value;
  late String msg;

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
