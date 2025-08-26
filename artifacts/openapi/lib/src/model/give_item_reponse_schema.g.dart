// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_item_reponse_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveItemReponseSchema extends GiveItemReponseSchema {
  @override
  final GiveItemDataSchema data;

  factory _$GiveItemReponseSchema(
          [void Function(GiveItemReponseSchemaBuilder)? updates]) =>
      (GiveItemReponseSchemaBuilder()..update(updates))._build();

  _$GiveItemReponseSchema._({required this.data}) : super._();
  @override
  GiveItemReponseSchema rebuild(
          void Function(GiveItemReponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveItemReponseSchemaBuilder toBuilder() =>
      GiveItemReponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveItemReponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'GiveItemReponseSchema')
          ..add('data', data))
        .toString();
  }
}

class GiveItemReponseSchemaBuilder
    implements Builder<GiveItemReponseSchema, GiveItemReponseSchemaBuilder> {
  _$GiveItemReponseSchema? _$v;

  GiveItemDataSchemaBuilder? _data;
  GiveItemDataSchemaBuilder get data =>
      _$this._data ??= GiveItemDataSchemaBuilder();
  set data(GiveItemDataSchemaBuilder? data) => _$this._data = data;

  GiveItemReponseSchemaBuilder() {
    GiveItemReponseSchema._defaults(this);
  }

  GiveItemReponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveItemReponseSchema other) {
    _$v = other as _$GiveItemReponseSchema;
  }

  @override
  void update(void Function(GiveItemReponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveItemReponseSchema build() => _build();

  _$GiveItemReponseSchema _build() {
    _$GiveItemReponseSchema _$result;
    try {
      _$result = _$v ??
          _$GiveItemReponseSchema._(
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GiveItemReponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
