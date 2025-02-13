import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'google_cloud_run_utils.freezed.dart';
part 'google_cloud_run_utils.g.dart';

/// https://cloud.google.com/run/docs/logging#writing_structured_logs
void writeAStructuredContainerLogFromGoogleCloudRunServer(
    GoogleCloudRunLogEntry entry) {
  stdout.writeln(jsonEncode(entry));
}

@freezed
class GoogleCloudRunLogEntry with _$GoogleCloudRunLogEntry {
  const GoogleCloudRunLogEntry._();

  const factory GoogleCloudRunLogEntry({
    required Severity severity,
    required String message,
    @JsonKey(name: 'logging.googleapis.com/trace') String? trace,
    Map<String, String>? labels,
    String? error,
    String? stackTrace,
  }) = _CloudLog;

  factory GoogleCloudRunLogEntry.fromJson(Map<String, dynamic> json) =>
      _$GoogleCloudRunLogEntryFromJson(json);

  GoogleCloudRunLogEntry withTraceFromHeaders({
    required Map<String, String> headers,
    required String googleCloudProjectId,
  }) {
    final traceHeader = headers['X-Cloud-Trace-Context'];
    var trace = traceHeader?.split('/').first;
    return trace == null
        ? this
        : copyWith(
            trace: 'projects/$googleCloudProjectId/traces/$trace',
          );
  }
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Severity {
  debug,
  info,
  notice,
  warning,
  error,
  critical,
  alert,
  emergency,
}

extension LogLevelSeverity on Level {
  Severity get severity => switch (this) {
        Level.all => Severity.debug,
        // ignore: deprecated_member_use
        Level.verbose => Severity.debug,
        Level.trace => Severity.debug,
        Level.debug => Severity.debug,
        Level.info => Severity.info,
        Level.warning => Severity.warning,
        Level.error => Severity.error,
        // ignore: deprecated_member_use
        Level.wtf => Severity.emergency,
        Level.fatal => Severity.emergency,
        // ignore: deprecated_member_use
        Level.nothing => Severity.emergency,
        Level.off => Severity.emergency,
      };
}
