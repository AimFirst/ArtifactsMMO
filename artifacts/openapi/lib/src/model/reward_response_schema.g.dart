// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RewardResponseSchema extends RewardResponseSchema {
  @override
  final DropRateSchema data;

  factory _$RewardResponseSchema(
          [void Function(RewardResponseSchemaBuilder)? updates]) =>
      (new RewardResponseSchemaBuilder()..update(updates))._build();

  _$RewardResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'RewardResponseSchema', 'data');
  }

  @override
  RewardResponseSchema rebuild(
          void Function(RewardResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RewardResponseSchemaBuilder toBuilder() =>
      new RewardResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'RewardResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class RewardResponseSchemaBuilder
    implements Builder<RewardResponseSchema, RewardResponseSchemaBuilder> {
  _$RewardResponseSchema? _$v;

  DropRateSchemaBuilder? _data;
  DropRateSchemaBuilder get data =>
      _$this._data ??= new DropRateSchemaBuilder();
  set data(DropRateSchemaBuilder? data) => _$this._data = data;

  RewardResponseSchemaBuilder() {
    RewardResponseSchema._defaults(this);
  }

  RewardResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RewardResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RewardResponseSchema;
  }

  @override
  void update(void Function(RewardResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RewardResponseSchema build() => _build();

  _$RewardResponseSchema _build() {
    _$RewardResponseSchema _$result;
    try {
      _$result = _$v ?? new _$RewardResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RewardResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
