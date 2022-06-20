import 'package:yc_app_utils/models/validation/base_validation.model.dart';

class BooleanValidation extends BaseValidation<bool> {
  BooleanValidation({
    required bool value,
    required String msg,
  }) : super(value: value, msg: msg);

  BooleanValidation.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
