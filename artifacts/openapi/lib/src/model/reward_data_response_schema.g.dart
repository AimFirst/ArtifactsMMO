// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_data_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RewardDataResponseSchema extends RewardDataResponseSchema {
  @override
  final RewardDataSchema data;

  factory _$RewardDataResponseSchema(
          [void Function(RewardDataResponseSchemaBuilder)? updates]) =>
      (new RewardDataResponseSchemaBuilder()..update(updates))._build();

  _$RewardDataResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'RewardDataResponseSchema', 'data');
  }

  @override
  RewardDataResponseSchema rebuild(
          void Function(RewardDataResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RewardDataResponseSchemaBuilder toBuilder() =>
      new RewardDataResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardDataResponseSchema && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RewardDataResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class RewardDataResponseSchemaBuilder
    implements
        Builder<RewardDataResponseSchema, RewardDataResponseSchemaBuilder> {
  _$RewardDataResponseSchema? _$v;

  RewardDataSchemaBuilder? _data;
  RewardDataSchemaBuilder get data =>
      _$this._data ??= new RewardDataSchemaBuilder();
  set data(RewardDataSchemaBuilder? data) => _$this._data = data;

  RewardDataResponseSchemaBuilder() {
    RewardDataResponseSchema._defaults(this);
  }

  RewardDataResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RewardDataResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RewardDataResponseSchema;
  }

  @override
  void update(void Function(RewardDataResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RewardDataResponseSchema build() => _build();

  _$RewardDataResponseSchema _build() {
    _$RewardDataResponseSchema _$result;
    try {
      _$result = _$v ?? new _$RewardDataResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RewardDataResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
