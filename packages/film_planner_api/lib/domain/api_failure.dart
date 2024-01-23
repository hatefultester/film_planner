import 'package:flutter/cupertino.dart';

class ApiFailure {
  const ApiFailure({
    required this.statusCode,
    this.exception,
    this.stackTrace,
  });

  final int statusCode;
  final Exception? exception;
  final StackTrace? stackTrace;
}
