import 'package:yc_app_utils/yc_app_utils.dart';

typedef InnerClickAction = void Function(
  V2ClickAction clickAction,

  /// boolean to signify if the clickAction is submitting form
  bool shouldSubmitForm,
);
