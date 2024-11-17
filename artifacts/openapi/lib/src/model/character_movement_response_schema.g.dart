// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_movement_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterMovementResponseSchema
    extends CharacterMovementResponseSchema {
  @override
  final CharacterMovementDataSchema data;

  factory _$CharacterMovementResponseSchema(
          [void Function(CharacterMovementResponseSchemaBuilder)? updates]) =>
      (new CharacterMovementResponseSchemaBuilder()..update(updates))._build();

  _$CharacterMovementResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CharacterMovementResponseSchema', 'data');
  }

  @override
  CharacterMovementResponseSchema rebuild(
          void Function(CharacterMovementResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterMovementResponseSchemaBuilder toBuilder() =>
      new CharacterMovementResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterMovementResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'CharacterMovementResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class CharacterMovementResponseSchemaBuilder
    implements
        Builder<CharacterMovementResponseSchema,
            CharacterMovementResponseSchemaBuilder> {
  _$CharacterMovementResponseSchema? _$v;

  CharacterMovementDataSchemaBuilder? _data;
  CharacterMovementDataSchemaBuilder get data =>
      _$this._data ??= new CharacterMovementDataSchemaBuilder();
  set data(CharacterMovementDataSchemaBuilder? data) => _$this._data = data;

  CharacterMovementResponseSchemaBuilder() {
    CharacterMovementResponseSchema._defaults(this);
  }

  CharacterMovementResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterMovementResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterMovementResponseSchema;
  }

  @override
  void update(void Function(CharacterMovementResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterMovementResponseSchema build() => _build();

  _$CharacterMovementResponseSchema _build() {
    _$CharacterMovementResponseSchema _$result;
    try {
      _$result =
          _$v ?? new _$CharacterMovementResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterMovementResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
