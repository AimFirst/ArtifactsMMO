// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RewardsSchema extends RewardsSchema {
  @override
  final BuiltList<SimpleItemSchema> items;
  @override
  final int gold;

  factory _$RewardsSchema([void Function(RewardsSchemaBuilder)? updates]) =>
      (new RewardsSchemaBuilder()..update(updates))._build();

  _$RewardsSchema._({required this.items, required this.gold}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'RewardsSchema', 'items');
    BuiltValueNullFieldError.checkNotNull(gold, r'RewardsSchema', 'gold');
  }

  @override
  RewardsSchema rebuild(void Function(RewardsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RewardsSchemaBuilder toBuilder() => new RewardsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardsSchema && items == other.items && gold == other.gold;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, gold.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RewardsSchema')
          ..add('items', items)
          ..add('gold', gold))
        .toString();
  }
}

class RewardsSchemaBuilder
    implements Builder<RewardsSchema, RewardsSchemaBuilder> {
  _$RewardsSchema? _$v;

  ListBuilder<SimpleItemSchema>? _items;
  ListBuilder<SimpleItemSchema> get items =>
      _$this._items ??= new ListBuilder<SimpleItemSchema>();
  set items(ListBuilder<SimpleItemSchema>? items) => _$this._items = items;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  RewardsSchemaBuilder() {
    RewardsSchema._defaults(this);
  }

  RewardsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _gold = $v.gold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RewardsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RewardsSchema;
  }

  @override
  void update(void Function(RewardsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RewardsSchema build() => _build();

  _$RewardsSchema _build() {
    _$RewardsSchema _$result;
    try {
      _$result = _$v ??
          new _$RewardsSchema._(
              items: items.build(),
              gold: BuiltValueNullFieldError.checkNotNull(
                  gold, r'RewardsSchema', 'gold'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RewardsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
