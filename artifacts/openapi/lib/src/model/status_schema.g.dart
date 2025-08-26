// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusSchema extends StatusSchema {
  @override
  final String version;
  @override
  final DateTime serverTime;
  @override
  final int maxLevel;
  @override
  final int maxSkillLevel;
  @override
  final int charactersOnline;
  @override
  final BuiltList<AnnouncementSchema> announcements;
  @override
  final BuiltList<RateLimitSchema> rateLimits;
  @override
  final SeasonSchema? season;

  factory _$StatusSchema([void Function(StatusSchemaBuilder)? updates]) =>
      (StatusSchemaBuilder()..update(updates))._build();

  _$StatusSchema._(
      {required this.version,
      required this.serverTime,
      required this.maxLevel,
      required this.maxSkillLevel,
      required this.charactersOnline,
      required this.announcements,
      required this.rateLimits,
      this.season})
      : super._();
  @override
  StatusSchema rebuild(void Function(StatusSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusSchemaBuilder toBuilder() => StatusSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusSchema &&
        version == other.version &&
        serverTime == other.serverTime &&
        maxLevel == other.maxLevel &&
        maxSkillLevel == other.maxSkillLevel &&
        charactersOnline == other.charactersOnline &&
        announcements == other.announcements &&
        rateLimits == other.rateLimits &&
        season == other.season;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, serverTime.hashCode);
    _$hash = $jc(_$hash, maxLevel.hashCode);
    _$hash = $jc(_$hash, maxSkillLevel.hashCode);
    _$hash = $jc(_$hash, charactersOnline.hashCode);
    _$hash = $jc(_$hash, announcements.hashCode);
    _$hash = $jc(_$hash, rateLimits.hashCode);
    _$hash = $jc(_$hash, season.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusSchema')
          ..add('version', version)
          ..add('serverTime', serverTime)
          ..add('maxLevel', maxLevel)
          ..add('maxSkillLevel', maxSkillLevel)
          ..add('charactersOnline', charactersOnline)
          ..add('announcements', announcements)
          ..add('rateLimits', rateLimits)
          ..add('season', season))
        .toString();
  }
}

class StatusSchemaBuilder
    implements Builder<StatusSchema, StatusSchemaBuilder> {
  _$StatusSchema? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  DateTime? _serverTime;
  DateTime? get serverTime => _$this._serverTime;
  set serverTime(DateTime? serverTime) => _$this._serverTime = serverTime;

  int? _maxLevel;
  int? get maxLevel => _$this._maxLevel;
  set maxLevel(int? maxLevel) => _$this._maxLevel = maxLevel;

  int? _maxSkillLevel;
  int? get maxSkillLevel => _$this._maxSkillLevel;
  set maxSkillLevel(int? maxSkillLevel) =>
      _$this._maxSkillLevel = maxSkillLevel;

  int? _charactersOnline;
  int? get charactersOnline => _$this._charactersOnline;
  set charactersOnline(int? charactersOnline) =>
      _$this._charactersOnline = charactersOnline;

  ListBuilder<AnnouncementSchema>? _announcements;
  ListBuilder<AnnouncementSchema> get announcements =>
      _$this._announcements ??= ListBuilder<AnnouncementSchema>();
  set announcements(ListBuilder<AnnouncementSchema>? announcements) =>
      _$this._announcements = announcements;

  ListBuilder<RateLimitSchema>? _rateLimits;
  ListBuilder<RateLimitSchema> get rateLimits =>
      _$this._rateLimits ??= ListBuilder<RateLimitSchema>();
  set rateLimits(ListBuilder<RateLimitSchema>? rateLimits) =>
      _$this._rateLimits = rateLimits;

  SeasonSchemaBuilder? _season;
  SeasonSchemaBuilder get season => _$this._season ??= SeasonSchemaBuilder();
  set season(SeasonSchemaBuilder? season) => _$this._season = season;

  StatusSchemaBuilder() {
    StatusSchema._defaults(this);
  }

  StatusSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _serverTime = $v.serverTime;
      _maxLevel = $v.maxLevel;
      _maxSkillLevel = $v.maxSkillLevel;
      _charactersOnline = $v.charactersOnline;
      _announcements = $v.announcements.toBuilder();
      _rateLimits = $v.rateLimits.toBuilder();
      _season = $v.season?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusSchema other) {
    _$v = other as _$StatusSchema;
  }

  @override
  void update(void Function(StatusSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusSchema build() => _build();

  _$StatusSchema _build() {
    _$StatusSchema _$result;
    try {
      _$result = _$v ??
          _$StatusSchema._(
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'StatusSchema', 'version'),
            serverTime: BuiltValueNullFieldError.checkNotNull(
                serverTime, r'StatusSchema', 'serverTime'),
            maxLevel: BuiltValueNullFieldError.checkNotNull(
                maxLevel, r'StatusSchema', 'maxLevel'),
            maxSkillLevel: BuiltValueNullFieldError.checkNotNull(
                maxSkillLevel, r'StatusSchema', 'maxSkillLevel'),
            charactersOnline: BuiltValueNullFieldError.checkNotNull(
                charactersOnline, r'StatusSchema', 'charactersOnline'),
            announcements: announcements.build(),
            rateLimits: rateLimits.build(),
            season: _season?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'announcements';
        announcements.build();
        _$failedField = 'rateLimits';
        rateLimits.build();
        _$failedField = 'season';
        _season?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StatusSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
