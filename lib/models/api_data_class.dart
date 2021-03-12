class APIDataClass {
  String message;
  bool isSuccess;
  bool validation;
  dynamic data;

  APIDataClass({this.message, this.isSuccess, this.data, this.validation});

  factory APIDataClass.fromJson(Map<String, dynamic> json) {
    return APIDataClass(
      message: json['message'] as String,
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as String,
      validation: json['validation'] as bool,
    );
  }
}
