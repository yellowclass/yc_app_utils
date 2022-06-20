import 'package:yc_app_utils/models/validation/base_validation.model.dart';

class StringValidation extends BaseValidation<String> {
  StringValidation({
    required String value,
    required String msg,
  }) : super(value: value, msg: msg);

  StringValidation.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
