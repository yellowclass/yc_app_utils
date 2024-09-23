import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionStackModel extends BootstrapSectionUnion {
  List<BootstrapSectionLayerModel> layers;
  Alignment stackAlignment;

  BootstrapSectionStackModel({
    required this.layers,
    required this.stackAlignment,
  });

  Map<String, dynamic> toMap() {
    return {
      'layers': layers.map((x) => x.toMap()).toList(),
      'stackAlignment': stackAlignment.toString(),
    };
  }

  factory BootstrapSectionStackModel.fromMap(Map<String, dynamic> map) {
    return BootstrapSectionStackModel(
      layers: List<BootstrapSectionLayerModel>.from(
        map['layers']?.map((x) => BootstrapSectionLayerModel.fromMap(x)),
      ),
      stackAlignment: map['stackAlignment'] != null
          ? CommonHelpers.getAlignmentFromString(
              map['stackAlignment'],
            )
          : Alignment.center,
    );
  }
}
