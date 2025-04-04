import 'dart:developer' as d;
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

import 'config.dart';

class ExtendedLogger extends Logger {
  static final iosOptimizedLocalLogPrinter = PrefixPrinter(
    PrettyPrinter(
      errorMethodCount: 100,
      // colors aren't working on ios, https://github.com/SourceHorizon/logger?tab=readme-ov-file#colors
      colors: false,
    ),
  );

  final Logger _localLogger;
  AdditionalLogConfig? additionalConfig;

  ExtendedLogger(
      {LogPrinter? localLogPrinter, AdditionalLogConfig? additionalConfig})
      : _localLogger = Logger(
          printer: localLogPrinter,
          filter: ProductionFilter(),
        );

  @override
  void log(Level level, message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) async {
    final currentTrace = Trace.current();
    final currentLine = currentTrace.logLine();
    stackTrace ??= currentTrace;
    stackTrace = stackTrace == StackTrace.empty
        ? stackTrace
        : Trace.from(stackTrace).terse.skipLoggerLines();
    final metadata = additionalConfig?.getMetadata?.call();
    message = [
      if (currentLine != null) 'at $currentLine',
      '${level.name.toUpperCase()}, ${DateTime.now()}',
      ...metadata?.entries.map((e) => '${e.key}: ${e.value}') ?? <String>[],
      message.toString(),
    ].join('\n');
    if (additionalConfig?.shouldLogLocally?.call(level) ?? true) {
      _logLocally(level, message, error, stackTrace);
    }
    if (additionalConfig?.shouldLogRemotely?.call(level) ?? false) {
      _logRemotely(level, message, error, stackTrace);
    }
  }

  void _logLocally(
      Level level, String message, Object? error, StackTrace stackTrace) {
    if (message.length > 1000) {
      d.log(
        '***\n$message\n***',
        level: level.value,
        error: error,
        stackTrace: stackTrace == StackTrace.empty ? null : stackTrace,
      );
    } else {
      _localLogger.log(
        level,
        message,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _logRemotely(
      Level level, String message, Object? error, StackTrace stackTrace) async {
    try {
      await additionalConfig?.logRemotely
          ?.call(level, message, error, stackTrace);
    } catch (e, s) {
      _localLogger.w('Failed to log remotely', error: e, stackTrace: s);
    }
  }

  /// Use when an api call fails.
  /// If no internet connection is available then log as info.
  /// If an internet connection is available then log as error.
  void eApi(String message, {Object? error, StackTrace? stackTrace}) {
    final isConnected = additionalConfig?.isConnectedToInternet?.call();
    final level = error is SocketException
        ? Level.info
        : isConnected == null
            ? Level.error
            : isConnected
                ? Level.error
                : Level.info;
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
    return str?.split('\n').firstWhere((e) => !e.contains('___logger.dart'));
  }

  Trace skipLoggerLines() {
    final i =
        frames.lastIndexWhere((e) => e.toString().contains('___logger.dart'));
    return Trace(frames.skip(i + 1));
  }
}
