import 'dart:core';

class ScannedCodeException implements Exception {
  final int code;
  final String message;
  final dynamic data;

  ScannedCodeException(this.code, this.message, [this.data]);

  @override
  String toString() {
    return '$code : $message : $data';
  }
}
