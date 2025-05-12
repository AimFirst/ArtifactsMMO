// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NPCItem extends NPCItem {
  @override
  final String code;
  @override
  final String npc;
  @override
  final int? buyPrice;
  @override
  final int? sellPrice;

  factory _$NPCItem([void Function(NPCItemBuilder)? updates]) =>
      (new NPCItemBuilder()..update(updates))._build();

  _$NPCItem._(
      {required this.code, required this.npc, this.buyPrice, this.sellPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'NPCItem', 'code');
    BuiltValueNullFieldError.checkNotNull(npc, r'NPCItem', 'npc');
  }

  @override
  NPCItem rebuild(void Function(NPCItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NPCItemBuilder toBuilder() => new NPCItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NPCItem &&
        code == other.code &&
        npc == other.npc &&
        buyPrice == other.buyPrice &&
        sellPrice == other.sellPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, npc.hashCode);
    _$hash = $jc(_$hash, buyPrice.hashCode);
    _$hash = $jc(_$hash, sellPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NPCItem')
          ..add('code', code)
          ..add('npc', npc)
          ..add('buyPrice', buyPrice)
          ..add('sellPrice', sellPrice))
        .toString();
  }
}

class NPCItemBuilder implements Builder<NPCItem, NPCItemBuilder> {
  _$NPCItem? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _npc;
  String? get npc => _$this._npc;
  set npc(String? npc) => _$this._npc = npc;

  int? _buyPrice;
  int? get buyPrice => _$this._buyPrice;
  set buyPrice(int? buyPrice) => _$this._buyPrice = buyPrice;

  int? _sellPrice;
  int? get sellPrice => _$this._sellPrice;
  set sellPrice(int? sellPrice) => _$this._sellPrice = sellPrice;

  NPCItemBuilder() {
    NPCItem._defaults(this);
  }

  NPCItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _npc = $v.npc;
      _buyPrice = $v.buyPrice;
      _sellPrice = $v.sellPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NPCItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NPCItem;
  }

  @override
  void update(void Function(NPCItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NPCItem build() => _build();

  _$NPCItem _build() {
    final _$result = _$v ??
        new _$NPCItem._(
            code:
                BuiltValueNullFieldError.checkNotNull(code, r'NPCItem', 'code'),
            npc: BuiltValueNullFieldError.checkNotNull(npc, r'NPCItem', 'npc'),
            buyPrice: buyPrice,
            sellPrice: sellPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
