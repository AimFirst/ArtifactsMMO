// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankSchema extends BankSchema {
  @override
  final int slots;
  @override
  final int expansions;
  @override
  final int nextExpansionCost;
  @override
  final int gold;

  factory _$BankSchema([void Function(BankSchemaBuilder)? updates]) =>
      (new BankSchemaBuilder()..update(updates))._build();

  _$BankSchema._(
      {required this.slots,
      required this.expansions,
      required this.nextExpansionCost,
      required this.gold})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(slots, r'BankSchema', 'slots');
    BuiltValueNullFieldError.checkNotNull(
        expansions, r'BankSchema', 'expansions');
    BuiltValueNullFieldError.checkNotNull(
        nextExpansionCost, r'BankSchema', 'nextExpansionCost');
    BuiltValueNullFieldError.checkNotNull(gold, r'BankSchema', 'gold');
  }

  @override
  BankSchema rebuild(void Function(BankSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankSchemaBuilder toBuilder() => new BankSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankSchema &&
        slots == other.slots &&
        expansions == other.expansions &&
        nextExpansionCost == other.nextExpansionCost &&
        gold == other.gold;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, slots.hashCode);
    _$hash = $jc(_$hash, expansions.hashCode);
    _$hash = $jc(_$hash, nextExpansionCost.hashCode);
    _$hash = $jc(_$hash, gold.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankSchema')
          ..add('slots', slots)
          ..add('expansions', expansions)
          ..add('nextExpansionCost', nextExpansionCost)
          ..add('gold', gold))
        .toString();
  }
}

class BankSchemaBuilder implements Builder<BankSchema, BankSchemaBuilder> {
  _$BankSchema? _$v;

  int? _slots;
  int? get slots => _$this._slots;
  set slots(int? slots) => _$this._slots = slots;

  int? _expansions;
  int? get expansions => _$this._expansions;
  set expansions(int? expansions) => _$this._expansions = expansions;

  int? _nextExpansionCost;
  int? get nextExpansionCost => _$this._nextExpansionCost;
  set nextExpansionCost(int? nextExpansionCost) =>
      _$this._nextExpansionCost = nextExpansionCost;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  BankSchemaBuilder() {
    BankSchema._defaults(this);
  }

  BankSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _slots = $v.slots;
      _expansions = $v.expansions;
      _nextExpansionCost = $v.nextExpansionCost;
      _gold = $v.gold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankSchema;
  }

  @override
  void update(void Function(BankSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankSchema build() => _build();

  _$BankSchema _build() {
    final _$result = _$v ??
        new _$BankSchema._(
            slots: BuiltValueNullFieldError.checkNotNull(
                slots, r'BankSchema', 'slots'),
            expansions: BuiltValueNullFieldError.checkNotNull(
                expansions, r'BankSchema', 'expansions'),
            nextExpansionCost: BuiltValueNullFieldError.checkNotNull(
                nextExpansionCost, r'BankSchema', 'nextExpansionCost'),
            gold: BuiltValueNullFieldError.checkNotNull(
                gold, r'BankSchema', 'gold'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
