// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AchievementResponseSchema extends AchievementResponseSchema {
  @override
  final AchievementSchema data;

  factory _$AchievementResponseSchema(
          [void Function(AchievementResponseSchemaBuilder)? updates]) =>
      (new AchievementResponseSchemaBuilder()..update(updates))._build();

  _$AchievementResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'AchievementResponseSchema', 'data');
  }

  @override
  AchievementResponseSchema rebuild(
          void Function(AchievementResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AchievementResponseSchemaBuilder toBuilder() =>
      new AchievementResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AchievementResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AchievementResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class AchievementResponseSchemaBuilder
    implements
        Builder<AchievementResponseSchema, AchievementResponseSchemaBuilder> {
  _$AchievementResponseSchema? _$v;

  AchievementSchemaBuilder? _data;
  AchievementSchemaBuilder get data =>
      _$this._data ??= new AchievementSchemaBuilder();
  set data(AchievementSchemaBuilder? data) => _$this._data = data;

  AchievementResponseSchemaBuilder() {
    AchievementResponseSchema._defaults(this);
  }

  AchievementResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AchievementResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AchievementResponseSchema;
  }

  @override
  void update(void Function(AchievementResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AchievementResponseSchema build() => _build();

  _$AchievementResponseSchema _build() {
    _$AchievementResponseSchema _$result;
    try {
      _$result = _$v ?? new _$AchievementResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AchievementResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
