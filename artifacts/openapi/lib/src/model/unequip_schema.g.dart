// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unequip_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UnequipSchema extends UnequipSchema {
  @override
  final ItemSlot slot;
  @override
  final int? quantity;

  factory _$UnequipSchema([void Function(UnequipSchemaBuilder)? updates]) =>
      (new UnequipSchemaBuilder()..update(updates))._build();

  _$UnequipSchema._({required this.slot, this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(slot, r'UnequipSchema', 'slot');
  }

  @override
  UnequipSchema rebuild(void Function(UnequipSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnequipSchemaBuilder toBuilder() => new UnequipSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnequipSchema &&
        slot == other.slot &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnequipSchema')
          ..add('slot', slot)
          ..add('quantity', quantity))
        .toString();
  }
}

class UnequipSchemaBuilder
    implements Builder<UnequipSchema, UnequipSchemaBuilder> {
  _$UnequipSchema? _$v;

  ItemSlot? _slot;
  ItemSlot? get slot => _$this._slot;
  set slot(ItemSlot? slot) => _$this._slot = slot;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  UnequipSchemaBuilder() {
    UnequipSchema._defaults(this);
  }

  UnequipSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _slot = $v.slot;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnequipSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnequipSchema;
  }

  @override
  void update(void Function(UnequipSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnequipSchema build() => _build();

  _$UnequipSchema _build() {
    final _$result = _$v ??
        new _$UnequipSchema._(
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'UnequipSchema', 'slot'),
            quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
