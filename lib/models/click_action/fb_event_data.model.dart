import 'dart:convert';

class FBEventData {
  String name;
  Map<String, dynamic>? parameters;

  FBEventData({
    required this.name,
    this.parameters,
  });

  FBEventData copyWith({
    String? name,
    Map<String, dynamic>? parameters,
  }) {
    return FBEventData(
      name: name ?? this.name,
      parameters: parameters ?? this.parameters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'parameters': parameters,
    };
  }

  factory FBEventData.fromMap(Map<String, dynamic> map) {
    return FBEventData(
      name: map['name'],
      parameters: jsonDecode(map['parameters'] ?? "{}"),
    );
  }
}
