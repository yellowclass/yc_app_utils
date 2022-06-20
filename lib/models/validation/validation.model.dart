import 'package:yc_app_utils/models/validation/boolean_validation.model.dart';
import 'package:yc_app_utils/models/validation/int_validation.model.dart';
import 'package:yc_app_utils/models/validation/string_validation.model.dart';

class Validation {
  BooleanValidation? isRequired;
  IntValidation? min;
  IntValidation? max;
  IntValidation? minLength;
  IntValidation? maxLength;
  StringValidation? pattern;

  Validation({
    this.isRequired,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.pattern,
  });

  Validation copyWith({
    BooleanValidation? isRequired,
    IntValidation? min,
    IntValidation? max,
    IntValidation? minLength,
    IntValidation? maxLength,
    StringValidation? pattern,
  }) {
    return Validation(
      isRequired: isRequired ?? this.isRequired,
      min: min ?? this.min,
      max: max ?? this.max,
      minLength: minLength ?? this.minLength,
      maxLength: maxLength ?? this.maxLength,
      pattern: pattern ?? this.pattern,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isRequired': isRequired?.toMap(),
      'min': min?.toMap(),
      'max': max?.toMap(),
      'minLength': minLength?.toMap(),
      'maxLength': maxLength?.toMap(),
      'pattern': pattern?.toMap(),
    };
  }

  factory Validation.fromMap(Map<String, dynamic> map) {
    return Validation(
      isRequired: map['isRequired'] != null
          ? BooleanValidation.fromMap(map['isRequired'])
          : null,
      min: map['min'] != null ? IntValidation.fromMap(map['min']) : null,
      max: map['max'] != null ? IntValidation.fromMap(map['max']) : null,
      minLength: map['minLength'] != null
          ? IntValidation.fromMap(map['minLength'])
          : null,
      maxLength: map['maxLength'] != null
          ? IntValidation.fromMap(map['maxLength'])
          : null,
      pattern: map['pattern'] != null
          ? StringValidation.fromMap(map['pattern'])
          : null,
    );
  }
}
