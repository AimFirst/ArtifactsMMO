// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_badge_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SeasonBadgeSchema extends SeasonBadgeSchema {
  @override
  final String code;
  @override
  final String description;
  @override
  final int requiredPoints;

  factory _$SeasonBadgeSchema(
          [void Function(SeasonBadgeSchemaBuilder)? updates]) =>
      (SeasonBadgeSchemaBuilder()..update(updates))._build();

  _$SeasonBadgeSchema._(
      {required this.code,
      required this.description,
      required this.requiredPoints})
      : super._();
  @override
  SeasonBadgeSchema rebuild(void Function(SeasonBadgeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeasonBadgeSchemaBuilder toBuilder() =>
      SeasonBadgeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeasonBadgeSchema &&
        code == other.code &&
        description == other.description &&
        requiredPoints == other.requiredPoints;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, requiredPoints.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeasonBadgeSchema')
          ..add('code', code)
          ..add('description', description)
          ..add('requiredPoints', requiredPoints))
        .toString();
  }
}

class SeasonBadgeSchemaBuilder
    implements Builder<SeasonBadgeSchema, SeasonBadgeSchemaBuilder> {
  _$SeasonBadgeSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _requiredPoints;
  int? get requiredPoints => _$this._requiredPoints;
  set requiredPoints(int? requiredPoints) =>
      _$this._requiredPoints = requiredPoints;

  SeasonBadgeSchemaBuilder() {
    SeasonBadgeSchema._defaults(this);
  }

  SeasonBadgeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _description = $v.description;
      _requiredPoints = $v.requiredPoints;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeasonBadgeSchema other) {
    _$v = other as _$SeasonBadgeSchema;
  }

  @override
  void update(void Function(SeasonBadgeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeasonBadgeSchema build() => _build();

  _$SeasonBadgeSchema _build() {
    final _$result = _$v ??
        _$SeasonBadgeSchema._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'SeasonBadgeSchema', 'code'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'SeasonBadgeSchema', 'description'),
          requiredPoints: BuiltValueNullFieldError.checkNotNull(
              requiredPoints, r'SeasonBadgeSchema', 'requiredPoints'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
