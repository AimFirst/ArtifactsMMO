// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_rewards_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskRewardsSchema extends TaskRewardsSchema {
  @override
  final BuiltList<SimpleItemSchema> items;
  @override
  final int gold;

  factory _$TaskRewardsSchema(
          [void Function(TaskRewardsSchemaBuilder)? updates]) =>
      (new TaskRewardsSchemaBuilder()..update(updates))._build();

  _$TaskRewardsSchema._({required this.items, required this.gold}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'TaskRewardsSchema', 'items');
    BuiltValueNullFieldError.checkNotNull(gold, r'TaskRewardsSchema', 'gold');
  }

  @override
  TaskRewardsSchema rebuild(void Function(TaskRewardsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskRewardsSchemaBuilder toBuilder() =>
      new TaskRewardsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskRewardsSchema &&
        items == other.items &&
        gold == other.gold;
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
    return (newBuiltValueToStringHelper(r'TaskRewardsSchema')
          ..add('items', items)
          ..add('gold', gold))
        .toString();
  }
}

class TaskRewardsSchemaBuilder
    implements Builder<TaskRewardsSchema, TaskRewardsSchemaBuilder> {
  _$TaskRewardsSchema? _$v;

  ListBuilder<SimpleItemSchema>? _items;
  ListBuilder<SimpleItemSchema> get items =>
      _$this._items ??= new ListBuilder<SimpleItemSchema>();
  set items(ListBuilder<SimpleItemSchema>? items) => _$this._items = items;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  TaskRewardsSchemaBuilder() {
    TaskRewardsSchema._defaults(this);
  }

  TaskRewardsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _gold = $v.gold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskRewardsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskRewardsSchema;
  }

  @override
  void update(void Function(TaskRewardsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskRewardsSchema build() => _build();

  _$TaskRewardsSchema _build() {
    _$TaskRewardsSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskRewardsSchema._(
              items: items.build(),
              gold: BuiltValueNullFieldError.checkNotNull(
                  gold, r'TaskRewardsSchema', 'gold'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskRewardsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
