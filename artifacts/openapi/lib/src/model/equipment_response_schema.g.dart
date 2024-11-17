// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EquipmentResponseSchema extends EquipmentResponseSchema {
  @override
  final EquipRequestSchema data;

  factory _$EquipmentResponseSchema(
          [void Function(EquipmentResponseSchemaBuilder)? updates]) =>
      (new EquipmentResponseSchemaBuilder()..update(updates))._build();

  _$EquipmentResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'EquipmentResponseSchema', 'data');
  }

  @override
  EquipmentResponseSchema rebuild(
          void Function(EquipmentResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentResponseSchemaBuilder toBuilder() =>
      new EquipmentResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'EquipmentResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class EquipmentResponseSchemaBuilder
    implements
        Builder<EquipmentResponseSchema, EquipmentResponseSchemaBuilder> {
  _$EquipmentResponseSchema? _$v;

  EquipRequestSchemaBuilder? _data;
  EquipRequestSchemaBuilder get data =>
      _$this._data ??= new EquipRequestSchemaBuilder();
  set data(EquipRequestSchemaBuilder? data) => _$this._data = data;

  EquipmentResponseSchemaBuilder() {
    EquipmentResponseSchema._defaults(this);
  }

  EquipmentResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentResponseSchema;
  }

  @override
  void update(void Function(EquipmentResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentResponseSchema build() => _build();

  _$EquipmentResponseSchema _build() {
    _$EquipmentResponseSchema _$result;
    try {
      _$result = _$v ?? new _$EquipmentResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EquipmentResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
