import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/click_action/click_action_redirection_type.enum.dart';
import 'package:yc_app_utils/models/click_action/event_data.model.dart';
import 'package:yc_app_utils/models/click_action/fb_event_data.model.dart';
import 'package:yc_app_utils/models/click_action/share_data.model.dart';
import 'package:yc_app_utils/models/click_action/toast_data.model.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';

class OneClickAction {
  V2ClickActionTypesEnum type;
  V2FunctionTypesEnum? functionType;
  String? url;
  EventData? eventData;
  ShareData? shareData;
  String? miscParams;
  V2ClickAction? toastClickAction;
  FBEventData? fbEventData;
  RedirectionTypeEnum? redirectionType;
  ToastData? toastData;
  V2ClickAction? onSuccess;
  V2ClickAction? onFailure;

  OneClickAction({
    required this.type,
    this.functionType,
    this.url,
    this.eventData,
    this.shareData,
    this.miscParams,
    this.toastClickAction,
    this.fbEventData,
    this.redirectionType,
    this.toastData,
    this.onFailure,
    this.onSuccess,
  });

  OneClickAction copyWith({
    V2ClickActionTypesEnum? type,
    V2FunctionTypesEnum? functionType,
    String? url,
    EventData? eventData,
    ShareData? shareData,
    String? miscParams,
    V2ClickAction? toastClickAction,
    FBEventData? fbEventData,
    RedirectionTypeEnum? redirectionType,
    ToastData? toastData,
    V2ClickAction? onSuccess,
    V2ClickAction? onFailure,
  }) {
    return OneClickAction(
      type: type ?? this.type,
      functionType: functionType ?? this.functionType,
      url: url ?? this.url,
      eventData: eventData ?? this.eventData,
      shareData: shareData ?? this.shareData,
      miscParams: miscParams ?? this.miscParams,
      toastClickAction: toastClickAction ?? this.toastClickAction,
      fbEventData: fbEventData ?? this.fbEventData,
      redirectionType: redirectionType ?? this.redirectionType,
      toastData: toastData ?? this.toastData,
      onFailure: onFailure ?? this.onFailure,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'functionType': functionType?.name,
      'url': url,
      'eventData': eventData?.toMap(),
      'shareData': shareData?.toMap(),
      'miscParams': miscParams,
      'toastClickAction': toastClickAction?.toMap(),
      'fbEventData': fbEventData?.toMap(),
      'redirectionType': redirectionType?.name,
      'toastData': toastData,
      'onFailure': onFailure,
      'onSuccess': onSuccess,
    };
  }

  factory OneClickAction.fromMap(Map<String, dynamic> map) {
    return OneClickAction(
      type: CommonHelpers.enumFromString(
        V2ClickActionTypesEnum.values,
        map['type'],
      )!,
      functionType: CommonHelpers.enumFromString(
        V2FunctionTypesEnum.values,
        map['functionType'],
      ),
      url: map['url'],
      eventData:
          map['eventData'] != null ? EventData.fromMap(map['eventData']) : null,
      shareData:
          map['shareData'] != null ? ShareData.fromMap(map['shareData']) : null,
      miscParams: map['miscParams'],
      toastClickAction: map['toastClickAction'] != null
          ? V2ClickAction.fromMap(map['toastClickAction'])
          : null,
      fbEventData: map['fbEventData'] != null
          ? FBEventData.fromMap(map['fbEventData'])
          : null,
      redirectionType: map['redirectionType'] != null
          ? CommonHelpers.enumFromString(
              RedirectionTypeEnum.values, map['redirectionType'])
          : null,
      toastData:
          map['toastData'] != null ? ToastData.fromMap(map['toastData']) : null,
      onSuccess: map['onSuccess'] != null
          ? V2ClickAction.fromMap(map['onSuccess'])
          : null,
      onFailure: map['onFailure'] != null
          ? V2ClickAction.fromMap(map['onFailure'])
          : null,
    );
  }
}

enum V2ClickActionTypesEnum {
  EXTERNAL_LINK,
  APP_LINK,
  SHARE,
  DEFAULT,
  APP_CUSTOM,
}

enum V2FunctionTypesEnum {
  OPEN_BOTTOM_SHEET,
  UPDATE_PROFILE_PICTURE,
  UPDATE_SCHOOL,
  UPDATE_CLASS,
  UPDATE_CITY,
  UPDATE_SKILLS,
  UPDATE_AGE,
  FOLLOW_PROFILE,
  REPORT_PROFILE,
  BLOCK_PROFILE,
  SYNC_CONTACTS,
  REDIRECT_AND_UPDATE_PROFILE_PICTURE,
  SHOW_TOAST,
  PROGRAM_ENROLLMENT,
  SUBMIT_FORM,
  UPDATE_PROFILE_DATA,
  MARK_CERTIFICATE_VIEWED,
  MUTE_UNMUTE,
  PLAY_PAUSE,
  DELETE_ACCOUNT,
  V2_OPEN_BOTTOM_SHEET,
  PLAY_AUDIO,
  OPEN_POPUP,
  NOTIFICATION_PERMISSION,
  REDEEM_STARS,
  GENERIC_API_CALL,
  UPDATE_PROFILE_PAGE,
  OPEN_USER_DETAILS_POPUP,
}
