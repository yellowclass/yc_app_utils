import 'package:yc_app_utils/models/validation/base_validation.model.dart';

class IntValidation extends BaseValidation<int> {
  IntValidation({
    required int value,
    required String msg,
  }) : super(value: value, msg: msg);

  IntValidation.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
