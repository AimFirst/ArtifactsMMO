// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SeasonSchema extends SeasonSchema {
  @override
  final BuiltList<SeasonBadgeSchema> badges;
  @override
  final BuiltList<SeasonSkinSchema> skins;
  @override
  final String? name;
  @override
  final int? number;
  @override
  final DateTime? startDate;

  factory _$SeasonSchema([void Function(SeasonSchemaBuilder)? updates]) =>
      (SeasonSchemaBuilder()..update(updates))._build();

  _$SeasonSchema._(
      {required this.badges,
      required this.skins,
      this.name,
      this.number,
      this.startDate})
      : super._();
  @override
  SeasonSchema rebuild(void Function(SeasonSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeasonSchemaBuilder toBuilder() => SeasonSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeasonSchema &&
        badges == other.badges &&
        skins == other.skins &&
        name == other.name &&
        number == other.number &&
        startDate == other.startDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, badges.hashCode);
    _$hash = $jc(_$hash, skins.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeasonSchema')
          ..add('badges', badges)
          ..add('skins', skins)
          ..add('name', name)
          ..add('number', number)
          ..add('startDate', startDate))
        .toString();
  }
}

class SeasonSchemaBuilder
    implements Builder<SeasonSchema, SeasonSchemaBuilder> {
  _$SeasonSchema? _$v;

  ListBuilder<SeasonBadgeSchema>? _badges;
  ListBuilder<SeasonBadgeSchema> get badges =>
      _$this._badges ??= ListBuilder<SeasonBadgeSchema>();
  set badges(ListBuilder<SeasonBadgeSchema>? badges) => _$this._badges = badges;

  ListBuilder<SeasonSkinSchema>? _skins;
  ListBuilder<SeasonSkinSchema> get skins =>
      _$this._skins ??= ListBuilder<SeasonSkinSchema>();
  set skins(ListBuilder<SeasonSkinSchema>? skins) => _$this._skins = skins;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  SeasonSchemaBuilder() {
    SeasonSchema._defaults(this);
  }

  SeasonSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _badges = $v.badges.toBuilder();
      _skins = $v.skins.toBuilder();
      _name = $v.name;
      _number = $v.number;
      _startDate = $v.startDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeasonSchema other) {
    _$v = other as _$SeasonSchema;
  }

  @override
  void update(void Function(SeasonSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeasonSchema build() => _build();

  _$SeasonSchema _build() {
    _$SeasonSchema _$result;
    try {
      _$result = _$v ??
          _$SeasonSchema._(
            badges: badges.build(),
            skins: skins.build(),
            name: name,
            number: number,
            startDate: startDate,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'badges';
        badges.build();
        _$failedField = 'skins';
        skins.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SeasonSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
