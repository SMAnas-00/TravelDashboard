class HealthModel {
  final String icon;
  final String value;
  final String title;

  const HealthModel({required this.icon, required this.title, required this.value});

  factory HealthModel.fromJson(Map<String, dynamic> json) {
    return HealthModel(
      icon: json['icon'],
      title: json['title'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'value': value,
    };
  }
}