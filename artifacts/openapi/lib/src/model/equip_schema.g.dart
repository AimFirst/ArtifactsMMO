// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equip_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EquipSchema extends EquipSchema {
  @override
  final String code;
  @override
  final ItemSlot slot;
  @override
  final int? quantity;

  factory _$EquipSchema([void Function(EquipSchemaBuilder)? updates]) =>
      (new EquipSchemaBuilder()..update(updates))._build();

  _$EquipSchema._({required this.code, required this.slot, this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'EquipSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(slot, r'EquipSchema', 'slot');
  }

  @override
  EquipSchema rebuild(void Function(EquipSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipSchemaBuilder toBuilder() => new EquipSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipSchema &&
        code == other.code &&
        slot == other.slot &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipSchema')
          ..add('code', code)
          ..add('slot', slot)
          ..add('quantity', quantity))
        .toString();
  }
}

class EquipSchemaBuilder implements Builder<EquipSchema, EquipSchemaBuilder> {
  _$EquipSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  ItemSlot? _slot;
  ItemSlot? get slot => _$this._slot;
  set slot(ItemSlot? slot) => _$this._slot = slot;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  EquipSchemaBuilder() {
    EquipSchema._defaults(this);
  }

  EquipSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _slot = $v.slot;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipSchema;
  }

  @override
  void update(void Function(EquipSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipSchema build() => _build();

  _$EquipSchema _build() {
    final _$result = _$v ??
        new _$EquipSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EquipSchema', 'code'),
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'EquipSchema', 'slot'),
            quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
