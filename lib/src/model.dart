import 'dart:async';

import 'package:logger/logger.dart';

typedef LogRemotely = FutureOr<void> Function(
  Level level,

  /// message also contains any metadata.
  String message,
  Object? error,
  StackTrace? stackTrace,
);

class AdditionalLogConfig {
  final bool Function(Level level)? shouldLogLocally;
  final bool Function(Level level)? shouldLogRemotely;
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
