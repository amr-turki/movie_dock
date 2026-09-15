class ErrorModel {
  final int statusCode;
  final String statusMessage;
  //final bool success;

  ErrorModel({
    required this.statusCode,
    required this.statusMessage,
    //  required this.success,
  });
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      // success: jsonData["success"],
      statusMessage: jsonData["status_message"],
      statusCode: jsonData["status_code"],
    );
  }
}
