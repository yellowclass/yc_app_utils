import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

enum CustomToastType { SUCCESS, ERROR, WARNING, ACTION }

class ToastData {
  V2StyledTextModel message;
  CustomToastType? toastType;
  String? source;
  V2StyledTextModel? toastActionText;
  V2ClickAction? toastClickAction;
  Alignment? alignmentPosition;
  ToastData({
    required this.message,
    this.toastType,
    this.source,
    this.toastActionText,
    this.toastClickAction,
    this.alignmentPosition,
  });

  ToastData copyWith({
    V2StyledTextModel? message,
    CustomToastType? toastType,
    String? source,
    V2StyledTextModel? toastActionText,
    V2ClickAction? toastClickAction,
    Alignment? alignmentPosition,
  }) {
    return ToastData(
      message: message ?? this.message,
      toastType: toastType ?? this.toastType,
      source: source ?? this.source,
      toastActionText: toastActionText ?? this.toastActionText,
      toastClickAction: toastClickAction ?? this.toastClickAction,
      alignmentPosition: alignmentPosition ?? this.alignmentPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'toastType': toastType,
      'source': source,
      'toastActionText': toastActionText,
      'toastClickAction': toastClickAction?.toMap(),
      'alignmentPosition': alignmentPosition,
    };
  }

  factory ToastData.fromMap(Map<String, dynamic> map) {
    return ToastData(
      message: V2StyledTextModel.fromMap(map['message']),
      toastType: CommonHelpers.enumFromString(
        CustomToastType.values,
        map["toastType"],
      ),
      source: map['source'],
      toastActionText: map['toastActionText'] != null
          ? V2StyledTextModel.fromMap(map['toastActionText'])
          : null,
      toastClickAction: map['toastClickAction'] != null
          ? V2ClickAction.fromMap(
              map['toastClickAction'],
            )
          : null,
      alignmentPosition: map['alignmentPosition'] != null
          ? CommonHelpers.getAlignmentFromList(
              List<String>.from(
                map['alignmentPosition'].map((e) => e.toString()),
              ),
            )
          : Alignment.bottomCenter,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToastData.fromJson(String source) =>
      ToastData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ToastData(message: $message, toastType: $toastType, source: $source, toastActionText: $toastActionText, toastClickAction: $toastClickAction, alignmentPosition: $alignmentPosition)';
  }

  @override
  bool operator ==(covariant ToastData other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.toastType == toastType &&
        other.source == source &&
        other.toastActionText == toastActionText &&
        other.toastClickAction == toastClickAction &&
        other.alignmentPosition == alignmentPosition;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        toastType.hashCode ^
        source.hashCode ^
        toastActionText.hashCode ^
        toastClickAction.hashCode ^
        alignmentPosition.hashCode;
  }
}
