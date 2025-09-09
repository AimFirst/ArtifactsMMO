// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BadgeResponseSchema extends BadgeResponseSchema {
  @override
  final BadgeSchema data;

  factory _$BadgeResponseSchema(
          [void Function(BadgeResponseSchemaBuilder)? updates]) =>
      (new BadgeResponseSchemaBuilder()..update(updates))._build();

  _$BadgeResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BadgeResponseSchema', 'data');
  }

  @override
  BadgeResponseSchema rebuild(
          void Function(BadgeResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BadgeResponseSchemaBuilder toBuilder() =>
      new BadgeResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BadgeResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'BadgeResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class BadgeResponseSchemaBuilder
    implements Builder<BadgeResponseSchema, BadgeResponseSchemaBuilder> {
  _$BadgeResponseSchema? _$v;

  BadgeSchemaBuilder? _data;
  BadgeSchemaBuilder get data => _$this._data ??= new BadgeSchemaBuilder();
  set data(BadgeSchemaBuilder? data) => _$this._data = data;

  BadgeResponseSchemaBuilder() {
    BadgeResponseSchema._defaults(this);
  }

  BadgeResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BadgeResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BadgeResponseSchema;
  }

  @override
  void update(void Function(BadgeResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BadgeResponseSchema build() => _build();

  _$BadgeResponseSchema _build() {
    _$BadgeResponseSchema _$result;
    try {
      _$result = _$v ?? new _$BadgeResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BadgeResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
