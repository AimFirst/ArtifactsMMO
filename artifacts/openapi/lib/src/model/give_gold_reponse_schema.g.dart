// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_gold_reponse_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveGoldReponseSchema extends GiveGoldReponseSchema {
  @override
  final GiveGoldDataSchema data;

  factory _$GiveGoldReponseSchema(
          [void Function(GiveGoldReponseSchemaBuilder)? updates]) =>
      (new GiveGoldReponseSchemaBuilder()..update(updates))._build();

  _$GiveGoldReponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'GiveGoldReponseSchema', 'data');
  }

  @override
  GiveGoldReponseSchema rebuild(
          void Function(GiveGoldReponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveGoldReponseSchemaBuilder toBuilder() =>
      new GiveGoldReponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveGoldReponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'GiveGoldReponseSchema')
          ..add('data', data))
        .toString();
  }
}

class GiveGoldReponseSchemaBuilder
    implements Builder<GiveGoldReponseSchema, GiveGoldReponseSchemaBuilder> {
  _$GiveGoldReponseSchema? _$v;

  GiveGoldDataSchemaBuilder? _data;
  GiveGoldDataSchemaBuilder get data =>
      _$this._data ??= new GiveGoldDataSchemaBuilder();
  set data(GiveGoldDataSchemaBuilder? data) => _$this._data = data;

  GiveGoldReponseSchemaBuilder() {
    GiveGoldReponseSchema._defaults(this);
  }

  GiveGoldReponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveGoldReponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveGoldReponseSchema;
  }

  @override
  void update(void Function(GiveGoldReponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveGoldReponseSchema build() => _build();

  _$GiveGoldReponseSchema _build() {
    _$GiveGoldReponseSchema _$result;
    try {
      _$result = _$v ?? new _$GiveGoldReponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GiveGoldReponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
