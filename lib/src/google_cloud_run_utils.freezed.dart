// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_cloud_run_utils.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GoogleCloudRunLogEntry _$GoogleCloudRunLogEntryFromJson(
    Map<String, dynamic> json) {
  return _CloudLog.fromJson(json);
}

/// @nodoc
mixin _$GoogleCloudRunLogEntry {
  Severity get severity;
  String get message;
  @JsonKey(name: 'logging.googleapis.com/trace')
  String? get trace;
  Map<String, String>? get labels;
  String? get error;
  String? get stackTrace;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoogleCloudRunLogEntryCopyWith<GoogleCloudRunLogEntry> get copyWith =>
      _$GoogleCloudRunLogEntryCopyWithImpl<GoogleCloudRunLogEntry>(
          this as GoogleCloudRunLogEntry, _$identity);

  /// Serializes this GoogleCloudRunLogEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoogleCloudRunLogEntry &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trace, trace) || other.trace == trace) &&
            const DeepCollectionEquality().equals(other.labels, labels) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, severity, message, trace,
      const DeepCollectionEquality().hash(labels), error, stackTrace);

  @override
  String toString() {
    return 'GoogleCloudRunLogEntry(severity: $severity, message: $message, trace: $trace, labels: $labels, error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $GoogleCloudRunLogEntryCopyWith<$Res> {
  factory $GoogleCloudRunLogEntryCopyWith(GoogleCloudRunLogEntry value,
          $Res Function(GoogleCloudRunLogEntry) _then) =
      _$GoogleCloudRunLogEntryCopyWithImpl;
  @useResult
  $Res call(
      {Severity severity,
      String message,
      @JsonKey(name: 'logging.googleapis.com/trace') String? trace,
      Map<String, String>? labels,
      String? error,
      String? stackTrace});
}

/// @nodoc
class _$GoogleCloudRunLogEntryCopyWithImpl<$Res>
    implements $GoogleCloudRunLogEntryCopyWith<$Res> {
  _$GoogleCloudRunLogEntryCopyWithImpl(this._self, this._then);

  final GoogleCloudRunLogEntry _self;
  final $Res Function(GoogleCloudRunLogEntry) _then;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severity = null,
    Object? message = null,
    Object? trace = freezed,
    Object? labels = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_self.copyWith(
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace: freezed == trace
          ? _self.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: freezed == labels
          ? _self.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CloudLog extends GoogleCloudRunLogEntry {
  const _CloudLog(
      {required this.severity,
      required this.message,
      @JsonKey(name: 'logging.googleapis.com/trace') this.trace,
      final Map<String, String>? labels,
      this.error,
      this.stackTrace})
      : _labels = labels,
        super._();
  factory _CloudLog.fromJson(Map<String, dynamic> json) =>
      _$CloudLogFromJson(json);

  @override
  final Severity severity;
  @override
  final String message;
  @override
  @JsonKey(name: 'logging.googleapis.com/trace')
  final String? trace;
  final Map<String, String>? _labels;
  @override
  Map<String, String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? error;
  @override
  final String? stackTrace;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CloudLogCopyWith<_CloudLog> get copyWith =>
      __$CloudLogCopyWithImpl<_CloudLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CloudLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CloudLog &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trace, trace) || other.trace == trace) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, severity, message, trace,
      const DeepCollectionEquality().hash(_labels), error, stackTrace);

  @override
  String toString() {
    return 'GoogleCloudRunLogEntry(severity: $severity, message: $message, trace: $trace, labels: $labels, error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$CloudLogCopyWith<$Res>
    implements $GoogleCloudRunLogEntryCopyWith<$Res> {
  factory _$CloudLogCopyWith(_CloudLog value, $Res Function(_CloudLog) _then) =
      __$CloudLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Severity severity,
      String message,
      @JsonKey(name: 'logging.googleapis.com/trace') String? trace,
      Map<String, String>? labels,
      String? error,
      String? stackTrace});
}

/// @nodoc
class __$CloudLogCopyWithImpl<$Res> implements _$CloudLogCopyWith<$Res> {
  __$CloudLogCopyWithImpl(this._self, this._then);

  final _CloudLog _self;
  final $Res Function(_CloudLog) _then;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? severity = null,
    Object? message = null,
    Object? trace = freezed,
    Object? labels = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_CloudLog(
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace: freezed == trace
          ? _self.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: freezed == labels
          ? _self._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
