import 'package:logger/logger.dart';
import 'package:talker/talker.dart' as t;

import '../extended_logger.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
}

extension LogLevelSeverity on LogLevel {
  Severity get asGoogleCloudSeverity => switch (this) {
        LogLevel.verbose => Severity.debug,
        LogLevel.debug => Severity.debug,
        LogLevel.info => Severity.info,
        LogLevel.warning => Severity.warning,
        LogLevel.error => Severity.error,
      };
}

extension TalkerLogLevelX on LogLevel {
  t.LogLevel get asTalker => switch (this) {
        LogLevel.verbose => t.LogLevel.verbose,
        LogLevel.debug => t.LogLevel.debug,
        LogLevel.info => t.LogLevel.info,
        LogLevel.warning => t.LogLevel.warning,
        LogLevel.error => t.LogLevel.error,
      };
}

extension Logger on LogLevel {
  Level get asLogger => switch (this) {
        LogLevel.verbose => Level.trace,
        LogLevel.debug => Level.debug,
        LogLevel.info => Level.info,
        LogLevel.warning => Level.warning,
        LogLevel.error => Level.error,
      };
}
