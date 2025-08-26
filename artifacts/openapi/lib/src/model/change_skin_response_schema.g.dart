// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_skin_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeSkinResponseSchema extends ChangeSkinResponseSchema {
  @override
  final ChangeSkinCharacterDataSchema data;

  factory _$ChangeSkinResponseSchema(
          [void Function(ChangeSkinResponseSchemaBuilder)? updates]) =>
      (ChangeSkinResponseSchemaBuilder()..update(updates))._build();

  _$ChangeSkinResponseSchema._({required this.data}) : super._();
  @override
  ChangeSkinResponseSchema rebuild(
          void Function(ChangeSkinResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeSkinResponseSchemaBuilder toBuilder() =>
      ChangeSkinResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeSkinResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ChangeSkinResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class ChangeSkinResponseSchemaBuilder
    implements
        Builder<ChangeSkinResponseSchema, ChangeSkinResponseSchemaBuilder> {
  _$ChangeSkinResponseSchema? _$v;

  ChangeSkinCharacterDataSchemaBuilder? _data;
  ChangeSkinCharacterDataSchemaBuilder get data =>
      _$this._data ??= ChangeSkinCharacterDataSchemaBuilder();
  set data(ChangeSkinCharacterDataSchemaBuilder? data) => _$this._data = data;

  ChangeSkinResponseSchemaBuilder() {
    ChangeSkinResponseSchema._defaults(this);
  }

  ChangeSkinResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeSkinResponseSchema other) {
    _$v = other as _$ChangeSkinResponseSchema;
  }

  @override
  void update(void Function(ChangeSkinResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeSkinResponseSchema build() => _build();

  _$ChangeSkinResponseSchema _build() {
    _$ChangeSkinResponseSchema _$result;
    try {
      _$result = _$v ??
          _$ChangeSkinResponseSchema._(
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ChangeSkinResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
