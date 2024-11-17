// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventorySlot extends InventorySlot {
  @override
  final int slot;
  @override
  final String code;
  @override
  final int quantity;

  factory _$InventorySlot([void Function(InventorySlotBuilder)? updates]) =>
      (new InventorySlotBuilder()..update(updates))._build();

  _$InventorySlot._(
      {required this.slot, required this.code, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(slot, r'InventorySlot', 'slot');
    BuiltValueNullFieldError.checkNotNull(code, r'InventorySlot', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'InventorySlot', 'quantity');
  }

  @override
  InventorySlot rebuild(void Function(InventorySlotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventorySlotBuilder toBuilder() => new InventorySlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventorySlot &&
        slot == other.slot &&
        code == other.code &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventorySlot')
          ..add('slot', slot)
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class InventorySlotBuilder
    implements Builder<InventorySlot, InventorySlotBuilder> {
  _$InventorySlot? _$v;

  int? _slot;
  int? get slot => _$this._slot;
  set slot(int? slot) => _$this._slot = slot;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  InventorySlotBuilder() {
    InventorySlot._defaults(this);
  }

  InventorySlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _slot = $v.slot;
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventorySlot other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InventorySlot;
  }

  @override
  void update(void Function(InventorySlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventorySlot build() => _build();

  _$InventorySlot _build() {
    final _$result = _$v ??
        new _$InventorySlot._(
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'InventorySlot', 'slot'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'InventorySlot', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'InventorySlot', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
