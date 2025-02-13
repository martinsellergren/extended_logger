// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_cloud_run_utils.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleCloudRunLogEntry _$GoogleCloudRunLogEntryFromJson(
    Map<String, dynamic> json) {
  return _CloudLog.fromJson(json);
}

/// @nodoc
mixin _$GoogleCloudRunLogEntry {
  Severity get severity => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'logging.googleapis.com/trace')
  String? get trace => throw _privateConstructorUsedError;
  Map<String, String>? get labels => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get stackTrace => throw _privateConstructorUsedError;

  /// Serializes this GoogleCloudRunLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleCloudRunLogEntryCopyWith<GoogleCloudRunLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleCloudRunLogEntryCopyWith<$Res> {
  factory $GoogleCloudRunLogEntryCopyWith(GoogleCloudRunLogEntry value,
          $Res Function(GoogleCloudRunLogEntry) then) =
      _$GoogleCloudRunLogEntryCopyWithImpl<$Res, GoogleCloudRunLogEntry>;
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
class _$GoogleCloudRunLogEntryCopyWithImpl<$Res,
        $Val extends GoogleCloudRunLogEntry>
    implements $GoogleCloudRunLogEntryCopyWith<$Res> {
  _$GoogleCloudRunLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace: freezed == trace
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudLogImplCopyWith<$Res>
    implements $GoogleCloudRunLogEntryCopyWith<$Res> {
  factory _$$CloudLogImplCopyWith(
          _$CloudLogImpl value, $Res Function(_$CloudLogImpl) then) =
      __$$CloudLogImplCopyWithImpl<$Res>;
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
class __$$CloudLogImplCopyWithImpl<$Res>
    extends _$GoogleCloudRunLogEntryCopyWithImpl<$Res, _$CloudLogImpl>
    implements _$$CloudLogImplCopyWith<$Res> {
  __$$CloudLogImplCopyWithImpl(
      _$CloudLogImpl _value, $Res Function(_$CloudLogImpl) _then)
      : super(_value, _then);

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
    return _then(_$CloudLogImpl(
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace: freezed == trace
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudLogImpl extends _CloudLog {
  const _$CloudLogImpl(
      {required this.severity,
      required this.message,
      @JsonKey(name: 'logging.googleapis.com/trace') this.trace,
      final Map<String, String>? labels,
      this.error,
      this.stackTrace})
      : _labels = labels,
        super._();

  factory _$CloudLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudLogImplFromJson(json);

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

  @override
  String toString() {
    return 'GoogleCloudRunLogEntry(severity: $severity, message: $message, trace: $trace, labels: $labels, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudLogImpl &&
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

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudLogImplCopyWith<_$CloudLogImpl> get copyWith =>
      __$$CloudLogImplCopyWithImpl<_$CloudLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudLogImplToJson(
      this,
    );
  }
}

abstract class _CloudLog extends GoogleCloudRunLogEntry {
  const factory _CloudLog(
      {required final Severity severity,
      required final String message,
      @JsonKey(name: 'logging.googleapis.com/trace') final String? trace,
      final Map<String, String>? labels,
      final String? error,
      final String? stackTrace}) = _$CloudLogImpl;
  const _CloudLog._() : super._();

  factory _CloudLog.fromJson(Map<String, dynamic> json) =
      _$CloudLogImpl.fromJson;

  @override
  Severity get severity;
  @override
  String get message;
  @override
  @JsonKey(name: 'logging.googleapis.com/trace')
  String? get trace;
  @override
  Map<String, String>? get labels;
  @override
  String? get error;
  @override
  String? get stackTrace;

  /// Create a copy of GoogleCloudRunLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloudLogImplCopyWith<_$CloudLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
