class SummaryModel {
  final int b1;
  final int b2;
  final int b3;
  final int b4;
  final int b5;
  final int b6;
  final int b7;
  final int b8;

  SummaryModel({required this.b1, required this.b2, required this.b3, required this.b4, required this.b5, required this.b6, required this.b7, required this.b8});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      b1: json["perfect"],
      b2: json["getaflight"],
      b3: json["valiamo"],
      b4: json["getaCruise"],
      b5: json["clickaHoliday"],
      b6: json["callforUmrah"],
      b7: json["PHTravel"],
      b8: json["getaflightUSA"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "perfect": b1,
      "getaflight": b2,
      "valiamo": b3,
      "getaCruise": b4,
      "clickaHoliday": b5,
      "callforUmrah": b6,
      "PHTravel": b7,
      "getaflightUSA": b8,

    };
  }
}
