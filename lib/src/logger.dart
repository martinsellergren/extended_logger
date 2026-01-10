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

  /// Maximum number of stack trace frames to include.
  final int maxStackTraceFrames;

  /// Use raw stack traces without any filtration.
  final bool useRawStackTraces;

  AdditionalLogConfig? additionalConfig;

  ExtendedLogger({
    required this.logLocally,
    this.skipLoggerLines = true,
    this.maxStackTraceFrames = 50,
    this.useRawStackTraces = false,
    AdditionalLogConfig? additionalConfig,
  });

  void log(LogLevel level, String message,
      {Object? error, StackTrace? stackTrace}) {
    final currentTrace = Trace.current();
    final currentLine = currentTrace.logLine();
    stackTrace ??=
        level.index <= LogLevel.verbose.index ? StackTrace.empty : currentTrace;
    if (stackTrace != StackTrace.empty) {
      var trace = Trace.from(stackTrace);
      if (!useRawStackTraces) {
        trace = trace.terseFixed(maxStackTraceFrames);
      }
      if (skipLoggerLines) {
        trace = trace.skipLoggerLines();
      }
      if (useRawStackTraces) {
        trace = Trace(trace.frames.take(maxStackTraceFrames));
      }
      stackTrace = trace;
    }
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

  // stack_trace's terse is limited and often fails all together on flutter web
  Trace terseFixed(int maxFrames) {
    final folded = foldFrames((frame) {
      if (frame.isCore) return true;
      final lib = frame.library;
      if (frame.package == 'flutter') return true;
      if (frame.package == 'provider') return true;
      if (frame.package == 'nested') return true;
      if (lib.contains('dart-sdk/lib/')) return true;
      if (lib.startsWith('lib/_engine/')) return true;
      if (lib.startsWith('package:flutter/')) return true;
      if (lib.startsWith('package:nested/')) return true;
      if (lib.startsWith('package:logger/')) return true;
      if (lib.startsWith('package:talker/')) return true;
      if (lib.startsWith('package:talker_flutter/')) return true;
      return false;
    }, terse: true);
    return Trace(folded.frames.take(maxFrames));
  }
}
