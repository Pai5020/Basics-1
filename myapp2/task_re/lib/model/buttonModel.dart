class ButtonModel {
  final int? id;
  final String label;
  final int colorValue;

  ButtonModel({this.id, required this.label, required this.colorValue});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'colorValue': colorValue,
    };
  }
}
