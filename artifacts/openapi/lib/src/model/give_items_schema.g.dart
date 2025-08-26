// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_items_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveItemsSchema extends GiveItemsSchema {
  @override
  final BuiltList<SimpleItemSchema> items;
  @override
  final String character;

  factory _$GiveItemsSchema([void Function(GiveItemsSchemaBuilder)? updates]) =>
      (GiveItemsSchemaBuilder()..update(updates))._build();

  _$GiveItemsSchema._({required this.items, required this.character})
      : super._();
  @override
  GiveItemsSchema rebuild(void Function(GiveItemsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveItemsSchemaBuilder toBuilder() => GiveItemsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveItemsSchema &&
        items == other.items &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveItemsSchema')
          ..add('items', items)
          ..add('character', character))
        .toString();
  }
}

class GiveItemsSchemaBuilder
    implements Builder<GiveItemsSchema, GiveItemsSchemaBuilder> {
  _$GiveItemsSchema? _$v;

  ListBuilder<SimpleItemSchema>? _items;
  ListBuilder<SimpleItemSchema> get items =>
      _$this._items ??= ListBuilder<SimpleItemSchema>();
  set items(ListBuilder<SimpleItemSchema>? items) => _$this._items = items;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  GiveItemsSchemaBuilder() {
    GiveItemsSchema._defaults(this);
  }

  GiveItemsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _character = $v.character;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveItemsSchema other) {
    _$v = other as _$GiveItemsSchema;
  }

  @override
  void update(void Function(GiveItemsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveItemsSchema build() => _build();

  _$GiveItemsSchema _build() {
    _$GiveItemsSchema _$result;
    try {
      _$result = _$v ??
          _$GiveItemsSchema._(
            items: items.build(),
            character: BuiltValueNullFieldError.checkNotNull(
                character, r'GiveItemsSchema', 'character'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GiveItemsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
