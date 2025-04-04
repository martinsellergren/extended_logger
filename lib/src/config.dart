import 'dart:async';

import 'log_level.dart';

typedef LogRemotely = FutureOr<void> Function(
  LogLevel level,
  String message,
  Object? error,
  StackTrace? stackTrace,
);

class AdditionalLogConfig {
  final bool Function(LogLevel level)? shouldLogLocally;
  final bool Function(LogLevel level)? shouldLogRemotely;
  final LogRemotely? logRemotely;

  /// The metadata is included in the log message.
  final Map<String, String> Function()? getMetadata;

  /// This is used when calling logger.eApi() to determine the e.g log level.
  final bool? Function()? isConnectedToInternet;

  AdditionalLogConfig({
    this.shouldLogLocally,
    this.shouldLogRemotely,
    this.getMetadata,
    this.isConnectedToInternet,
    this.logRemotely,
  });
}
