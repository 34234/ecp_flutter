
class ResponseData {
  ResponseData({
    this.state,
    this.message,
    this.data,
  });

  bool state;
  String message;
  dynamic data;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    state: json["State"],
    message: json["Message"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "State": state,
    "Message": message,
    "Data": data.toJson(),
  };
}

