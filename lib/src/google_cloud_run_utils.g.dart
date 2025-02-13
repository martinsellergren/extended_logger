// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_cloud_run_utils.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudLogImpl _$$CloudLogImplFromJson(Map<String, dynamic> json) =>
    _$CloudLogImpl(
      severity: $enumDecode(_$SeverityEnumMap, json['severity']),
      message: json['message'] as String,
      trace: json['logging.googleapis.com/trace'] as String?,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      error: json['error'] as String?,
      stackTrace: json['stackTrace'] as String?,
    );

Map<String, dynamic> _$$CloudLogImplToJson(_$CloudLogImpl instance) =>
    <String, dynamic>{
      'severity': _$SeverityEnumMap[instance.severity]!,
      'message': instance.message,
      'logging.googleapis.com/trace': instance.trace,
      'labels': instance.labels,
      'error': instance.error,
      'stackTrace': instance.stackTrace,
    };

const _$SeverityEnumMap = {
  Severity.debug: 'DEBUG',
  Severity.info: 'INFO',
  Severity.notice: 'NOTICE',
  Severity.warning: 'WARNING',
  Severity.error: 'ERROR',
  Severity.critical: 'CRITICAL',
  Severity.alert: 'ALERT',
  Severity.emergency: 'EMERGENCY',
};
