// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_info_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SkillInfoSchema extends SkillInfoSchema {
  @override
  final int xp;
  @override
  final BuiltList<DropSchema> items;

  factory _$SkillInfoSchema([void Function(SkillInfoSchemaBuilder)? updates]) =>
      (new SkillInfoSchemaBuilder()..update(updates))._build();

  _$SkillInfoSchema._({required this.xp, required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(xp, r'SkillInfoSchema', 'xp');
    BuiltValueNullFieldError.checkNotNull(items, r'SkillInfoSchema', 'items');
  }

  @override
  SkillInfoSchema rebuild(void Function(SkillInfoSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillInfoSchemaBuilder toBuilder() =>
      new SkillInfoSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillInfoSchema && xp == other.xp && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xp.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillInfoSchema')
          ..add('xp', xp)
          ..add('items', items))
        .toString();
  }
}

class SkillInfoSchemaBuilder
    implements Builder<SkillInfoSchema, SkillInfoSchemaBuilder> {
  _$SkillInfoSchema? _$v;

  int? _xp;
  int? get xp => _$this._xp;
  set xp(int? xp) => _$this._xp = xp;

  ListBuilder<DropSchema>? _items;
  ListBuilder<DropSchema> get items =>
      _$this._items ??= new ListBuilder<DropSchema>();
  set items(ListBuilder<DropSchema>? items) => _$this._items = items;

  SkillInfoSchemaBuilder() {
    SkillInfoSchema._defaults(this);
  }

  SkillInfoSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xp = $v.xp;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillInfoSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillInfoSchema;
  }

  @override
  void update(void Function(SkillInfoSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillInfoSchema build() => _build();

  _$SkillInfoSchema _build() {
    _$SkillInfoSchema _$result;
    try {
      _$result = _$v ??
          new _$SkillInfoSchema._(
              xp: BuiltValueNullFieldError.checkNotNull(
                  xp, r'SkillInfoSchema', 'xp'),
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SkillInfoSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
