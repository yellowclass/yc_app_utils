import 'dart:convert';

class ClickAction {
  final String? clickActionType;
  final String? clickActionUrl;
  final String? shareText;
  final String? shareImageUrl;
  final String? bottomSheetId;
  final String? functionType;
  final ClickAction? nestedClickAction;
  final String? eventData;
  final Map<String, dynamic> stringifiedFunctionParams;

  ClickAction({
    this.stringifiedFunctionParams = const {},
    this.clickActionType,
    this.clickActionUrl,
    this.shareText,
    this.shareImageUrl,
    this.bottomSheetId,
    this.functionType,
    this.eventData,
    this.nestedClickAction,
  });

  factory ClickAction.fromMap(Map<String, dynamic> json) {
    return ClickAction(
      clickActionType: json['clickActionType'],
      clickActionUrl: json['clickActionUrl'],
      shareText: json['shareText'],
      shareImageUrl: json['shareImageUrl'],
      bottomSheetId: json['bottomSheetId'],
      functionType: json['functionType'],
      stringifiedFunctionParams: json['stringifiedFunctionParams'] == null
          ? {}
          : jsonDecode(json['stringifiedFunctionParams']),
      eventData: json['eventData'],
      nestedClickAction: json['nestedClickAction'] == null
          ? null
          : ClickAction.fromMap(json['nestedClickAction']),
    );
  }

  Map<String, dynamic> toMap() => {
        "clickActionType": clickActionType,
        "clickActionUrl": clickActionUrl,
        "shareText": shareText,
        "shareImageUrl": shareImageUrl,
        "bottomSheetId": bottomSheetId,
        "functionType": functionType,
        "stringifiedFunctionParams": const JsonEncoder.withIndent('  ')
            .convert(stringifiedFunctionParams),
        "eventData": eventData,
        "nestedClickAction": nestedClickAction,
      };
}
