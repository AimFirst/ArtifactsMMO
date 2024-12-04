// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BadgeSchema extends BadgeSchema {
  @override
  final String code;
  @override
  final String description;
  @override
  final BuiltList<BadgeConditionSchema> conditions;
  @override
  final int? season;

  factory _$BadgeSchema([void Function(BadgeSchemaBuilder)? updates]) =>
      (new BadgeSchemaBuilder()..update(updates))._build();

  _$BadgeSchema._(
      {required this.code,
      required this.description,
      required this.conditions,
      this.season})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'BadgeSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        description, r'BadgeSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(
        conditions, r'BadgeSchema', 'conditions');
  }

  @override
  BadgeSchema rebuild(void Function(BadgeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BadgeSchemaBuilder toBuilder() => new BadgeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BadgeSchema &&
        code == other.code &&
        description == other.description &&
        conditions == other.conditions &&
        season == other.season;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, conditions.hashCode);
    _$hash = $jc(_$hash, season.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BadgeSchema')
          ..add('code', code)
          ..add('description', description)
          ..add('conditions', conditions)
          ..add('season', season))
        .toString();
  }
}

class BadgeSchemaBuilder implements Builder<BadgeSchema, BadgeSchemaBuilder> {
  _$BadgeSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<BadgeConditionSchema>? _conditions;
  ListBuilder<BadgeConditionSchema> get conditions =>
      _$this._conditions ??= new ListBuilder<BadgeConditionSchema>();
  set conditions(ListBuilder<BadgeConditionSchema>? conditions) =>
      _$this._conditions = conditions;

  int? _season;
  int? get season => _$this._season;
  set season(int? season) => _$this._season = season;

  BadgeSchemaBuilder() {
    BadgeSchema._defaults(this);
  }

  BadgeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _description = $v.description;
      _conditions = $v.conditions.toBuilder();
      _season = $v.season;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BadgeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BadgeSchema;
  }

  @override
  void update(void Function(BadgeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BadgeSchema build() => _build();

  _$BadgeSchema _build() {
    _$BadgeSchema _$result;
    try {
      _$result = _$v ??
          new _$BadgeSchema._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'BadgeSchema', 'code'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'BadgeSchema', 'description'),
              conditions: conditions.build(),
              season: season);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'conditions';
        conditions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BadgeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
