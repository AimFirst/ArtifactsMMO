// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_skin_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SeasonSkinSchema extends SeasonSkinSchema {
  @override
  final String code;
  @override
  final String description;
  @override
  final int requiredPoints;

  factory _$SeasonSkinSchema(
          [void Function(SeasonSkinSchemaBuilder)? updates]) =>
      (SeasonSkinSchemaBuilder()..update(updates))._build();

  _$SeasonSkinSchema._(
      {required this.code,
      required this.description,
      required this.requiredPoints})
      : super._();
  @override
  SeasonSkinSchema rebuild(void Function(SeasonSkinSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeasonSkinSchemaBuilder toBuilder() =>
      SeasonSkinSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeasonSkinSchema &&
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
    return (newBuiltValueToStringHelper(r'SeasonSkinSchema')
          ..add('code', code)
          ..add('description', description)
          ..add('requiredPoints', requiredPoints))
        .toString();
  }
}

class SeasonSkinSchemaBuilder
    implements Builder<SeasonSkinSchema, SeasonSkinSchemaBuilder> {
  _$SeasonSkinSchema? _$v;

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

  SeasonSkinSchemaBuilder() {
    SeasonSkinSchema._defaults(this);
  }

  SeasonSkinSchemaBuilder get _$this {
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
  void replace(SeasonSkinSchema other) {
    _$v = other as _$SeasonSkinSchema;
  }

  @override
  void update(void Function(SeasonSkinSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeasonSkinSchema build() => _build();

  _$SeasonSkinSchema _build() {
    final _$result = _$v ??
        _$SeasonSkinSchema._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'SeasonSkinSchema', 'code'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'SeasonSkinSchema', 'description'),
          requiredPoints: BuiltValueNullFieldError.checkNotNull(
              requiredPoints, r'SeasonSkinSchema', 'requiredPoints'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
