class SummaryModel {
  final int totalCalls;
  final int answered;
  final int missed;

  SummaryModel({required this.totalCalls, required this.answered, required this.missed});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      totalCalls: json['t'],
      answered: json['a'],
      missed: json['m'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      't': totalCalls,
      'a': answered,
      'm': missed,
    };
  }
}
