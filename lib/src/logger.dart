import 'dart:io';

import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

import 'config.dart';
import 'log_level.dart';

typedef LogLocally = Function(
  LogLevel level,
  String message,
  Object? error,
  StackTrace? stackTrace,
);

class ExtendedLogger {
  final LogLocally logLocally;

  /// Skip initial logger.dart-entries in stacktraces.
  final bool skipLoggerLines;

  AdditionalLogConfig? additionalConfig;

  ExtendedLogger(
      {required this.logLocally,
      this.skipLoggerLines = true,
      AdditionalLogConfig? additionalConfig});

  void log(LogLevel level, String message,
      {Object? error, StackTrace? stackTrace}) {
    final currentTrace = Trace.current();
    final currentLine = currentTrace.logLine();
    stackTrace ??=
        level.index <= LogLevel.verbose.index ? StackTrace.empty : currentTrace;
    stackTrace = stackTrace == StackTrace.empty
        ? StackTrace.empty
        : skipLoggerLines
            ? Trace.from(stackTrace).terse.skipLoggerLines()
            : Trace.from(stackTrace).terse;
    final metadata = additionalConfig?.getMetadata?.call();
    message = [
      if (currentLine != null) 'at $currentLine',
      '${level.name.toUpperCase()}, ${DateTime.now()}',
      ...metadata?.entries.map((e) => '${e.key}: ${e.value}') ?? <String>[],
      message.toString(),
    ].join('\n');
    if (additionalConfig?.shouldLogLocally?.call(level) ?? true) {
      logLocally(level, message, error, stackTrace);
    }
    if (additionalConfig?.shouldLogRemotely?.call(level) ?? false) {
      _logRemotely(level, message, error, stackTrace);
    }
  }

  Future<void> _logRemotely(LogLevel level, String message, Object? error,
      StackTrace stackTrace) async {
    try {
      await additionalConfig?.logRemotely
          ?.call(level, message, error, stackTrace);
    } catch (e, s) {
      logLocally(LogLevel.warning, 'Failed to log remotely', e, s);
    }
  }

  void v(String message, {Object? error, StackTrace? stackTrace}) =>
      log(LogLevel.verbose, message, error: error, stackTrace: stackTrace);
  void d(String message, {Object? error, StackTrace? stackTrace}) =>
      log(LogLevel.debug, message, error: error, stackTrace: stackTrace);
  void i(String message, {Object? error, StackTrace? stackTrace}) =>
      log(LogLevel.info, message, error: error, stackTrace: stackTrace);
  void w(String message, {Object? error, StackTrace? stackTrace}) =>
      log(LogLevel.warning, message, error: error, stackTrace: stackTrace);
  void e(String message, {Object? error, StackTrace? stackTrace}) =>
      log(LogLevel.error, message, error: error, stackTrace: stackTrace);

  /// Use when an api call fails.
  /// If no internet connection is available then log as info.
  /// If an internet connection is available then log as error.
  void eApi(String message, {Object? error, StackTrace? stackTrace}) {
    final isConnected = additionalConfig?.isConnectedToInternet?.call();
    final level = error is SocketException
        ? LogLevel.info
        : isConnected == null
            ? LogLevel.error
            : isConnected
                ? LogLevel.error
                : LogLevel.info;
    log(
      level,
      [
        if (isConnected == false) '(no network connection is available)',
        message,
      ].join('\n'),
      error: error,
      stackTrace: stackTrace,
    );
  }
}

extension on Trace {
  String? logLine() {
    final str = PrettyPrinter().formatStackTrace(this, null);
    return str?.split('\n').firstWhere((e) => !e.contains('logger.dart'));
  }

  Trace skipLoggerLines() {
    final i =
        frames.lastIndexWhere((e) => e.toString().contains('logger.dart'));
    return Trace(frames.skip(i + 1));
  }
}
