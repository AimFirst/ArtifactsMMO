// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooldown_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CooldownSchema extends CooldownSchema {
  @override
  final int totalSeconds;
  @override
  final int remainingSeconds;
  @override
  final DateTime startedAt;
  @override
  final DateTime expiration;
  @override
  final ActionType reason;

  factory _$CooldownSchema([void Function(CooldownSchemaBuilder)? updates]) =>
      (new CooldownSchemaBuilder()..update(updates))._build();

  _$CooldownSchema._(
      {required this.totalSeconds,
      required this.remainingSeconds,
      required this.startedAt,
      required this.expiration,
      required this.reason})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalSeconds, r'CooldownSchema', 'totalSeconds');
    BuiltValueNullFieldError.checkNotNull(
        remainingSeconds, r'CooldownSchema', 'remainingSeconds');
    BuiltValueNullFieldError.checkNotNull(
        startedAt, r'CooldownSchema', 'startedAt');
    BuiltValueNullFieldError.checkNotNull(
        expiration, r'CooldownSchema', 'expiration');
    BuiltValueNullFieldError.checkNotNull(reason, r'CooldownSchema', 'reason');
  }

  @override
  CooldownSchema rebuild(void Function(CooldownSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CooldownSchemaBuilder toBuilder() =>
      new CooldownSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CooldownSchema &&
        totalSeconds == other.totalSeconds &&
        remainingSeconds == other.remainingSeconds &&
        startedAt == other.startedAt &&
        expiration == other.expiration &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalSeconds.hashCode);
    _$hash = $jc(_$hash, remainingSeconds.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, expiration.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CooldownSchema')
          ..add('totalSeconds', totalSeconds)
          ..add('remainingSeconds', remainingSeconds)
          ..add('startedAt', startedAt)
          ..add('expiration', expiration)
          ..add('reason', reason))
        .toString();
  }
}

class CooldownSchemaBuilder
    implements Builder<CooldownSchema, CooldownSchemaBuilder> {
  _$CooldownSchema? _$v;

  int? _totalSeconds;
  int? get totalSeconds => _$this._totalSeconds;
  set totalSeconds(int? totalSeconds) => _$this._totalSeconds = totalSeconds;

  int? _remainingSeconds;
  int? get remainingSeconds => _$this._remainingSeconds;
  set remainingSeconds(int? remainingSeconds) =>
      _$this._remainingSeconds = remainingSeconds;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  DateTime? _expiration;
  DateTime? get expiration => _$this._expiration;
  set expiration(DateTime? expiration) => _$this._expiration = expiration;

  ActionType? _reason;
  ActionType? get reason => _$this._reason;
  set reason(ActionType? reason) => _$this._reason = reason;

  CooldownSchemaBuilder() {
    CooldownSchema._defaults(this);
  }

  CooldownSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalSeconds = $v.totalSeconds;
      _remainingSeconds = $v.remainingSeconds;
      _startedAt = $v.startedAt;
      _expiration = $v.expiration;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CooldownSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CooldownSchema;
  }

  @override
  void update(void Function(CooldownSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CooldownSchema build() => _build();

  _$CooldownSchema _build() {
    final _$result = _$v ??
        new _$CooldownSchema._(
            totalSeconds: BuiltValueNullFieldError.checkNotNull(
                totalSeconds, r'CooldownSchema', 'totalSeconds'),
            remainingSeconds: BuiltValueNullFieldError.checkNotNull(
                remainingSeconds, r'CooldownSchema', 'remainingSeconds'),
            startedAt: BuiltValueNullFieldError.checkNotNull(
                startedAt, r'CooldownSchema', 'startedAt'),
            expiration: BuiltValueNullFieldError.checkNotNull(
                expiration, r'CooldownSchema', 'expiration'),
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'CooldownSchema', 'reason'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
