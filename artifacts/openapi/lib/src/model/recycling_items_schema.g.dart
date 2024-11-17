// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycling_items_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecyclingItemsSchema extends RecyclingItemsSchema {
  @override
  final BuiltList<DropSchema> items;

  factory _$RecyclingItemsSchema(
          [void Function(RecyclingItemsSchemaBuilder)? updates]) =>
      (new RecyclingItemsSchemaBuilder()..update(updates))._build();

  _$RecyclingItemsSchema._({required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        items, r'RecyclingItemsSchema', 'items');
  }

  @override
  RecyclingItemsSchema rebuild(
          void Function(RecyclingItemsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecyclingItemsSchemaBuilder toBuilder() =>
      new RecyclingItemsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecyclingItemsSchema && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecyclingItemsSchema')
          ..add('items', items))
        .toString();
  }
}

class RecyclingItemsSchemaBuilder
    implements Builder<RecyclingItemsSchema, RecyclingItemsSchemaBuilder> {
  _$RecyclingItemsSchema? _$v;

  ListBuilder<DropSchema>? _items;
  ListBuilder<DropSchema> get items =>
      _$this._items ??= new ListBuilder<DropSchema>();
  set items(ListBuilder<DropSchema>? items) => _$this._items = items;

  RecyclingItemsSchemaBuilder() {
    RecyclingItemsSchema._defaults(this);
  }

  RecyclingItemsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecyclingItemsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecyclingItemsSchema;
  }

  @override
  void update(void Function(RecyclingItemsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecyclingItemsSchema build() => _build();

  _$RecyclingItemsSchema _build() {
    _$RecyclingItemsSchema _$result;
    try {
      _$result = _$v ?? new _$RecyclingItemsSchema._(items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecyclingItemsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
