class Model {
  final String id;
  final String value;

  Model._({required this.id, required this.value});

  factory Model.fromJson(Map<String, dynamic> json) {
    return new Model._(
      id: json['id'],
      value: json['check_text'],
    );
  }
}
