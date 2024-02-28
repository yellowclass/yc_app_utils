class AutocompleteInputModel {
  final String autocompleteType;
  final String input;
  String? miscParams;

  AutocompleteInputModel({
    required this.autocompleteType,
    required this.input,
    this.miscParams,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autocompleteType': autocompleteType,
      'input': input,
      'miscParams': miscParams,
    };
  }
}
