// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusSchema extends StatusSchema {
  @override
  final String status;
  @override
  final String version;
  @override
  final int maxLevel;
  @override
  final int charactersOnline;
  @override
  final DateTime serverTime;
  @override
  final BuiltList<AnnouncementSchema> announcements;
  @override
  final String lastWipe;
  @override
  final String nextWipe;

  factory _$StatusSchema([void Function(StatusSchemaBuilder)? updates]) =>
      (new StatusSchemaBuilder()..update(updates))._build();

  _$StatusSchema._(
      {required this.status,
      required this.version,
      required this.maxLevel,
      required this.charactersOnline,
      required this.serverTime,
      required this.announcements,
      required this.lastWipe,
      required this.nextWipe})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'StatusSchema', 'status');
    BuiltValueNullFieldError.checkNotNull(version, r'StatusSchema', 'version');
    BuiltValueNullFieldError.checkNotNull(
        maxLevel, r'StatusSchema', 'maxLevel');
    BuiltValueNullFieldError.checkNotNull(
        charactersOnline, r'StatusSchema', 'charactersOnline');
    BuiltValueNullFieldError.checkNotNull(
        serverTime, r'StatusSchema', 'serverTime');
    BuiltValueNullFieldError.checkNotNull(
        announcements, r'StatusSchema', 'announcements');
    BuiltValueNullFieldError.checkNotNull(
        lastWipe, r'StatusSchema', 'lastWipe');
    BuiltValueNullFieldError.checkNotNull(
        nextWipe, r'StatusSchema', 'nextWipe');
  }

  @override
  StatusSchema rebuild(void Function(StatusSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusSchemaBuilder toBuilder() => new StatusSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusSchema &&
        status == other.status &&
        version == other.version &&
        maxLevel == other.maxLevel &&
        charactersOnline == other.charactersOnline &&
        serverTime == other.serverTime &&
        announcements == other.announcements &&
        lastWipe == other.lastWipe &&
        nextWipe == other.nextWipe;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, maxLevel.hashCode);
    _$hash = $jc(_$hash, charactersOnline.hashCode);
    _$hash = $jc(_$hash, serverTime.hashCode);
    _$hash = $jc(_$hash, announcements.hashCode);
    _$hash = $jc(_$hash, lastWipe.hashCode);
    _$hash = $jc(_$hash, nextWipe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusSchema')
          ..add('status', status)
          ..add('version', version)
          ..add('maxLevel', maxLevel)
          ..add('charactersOnline', charactersOnline)
          ..add('serverTime', serverTime)
          ..add('announcements', announcements)
          ..add('lastWipe', lastWipe)
          ..add('nextWipe', nextWipe))
        .toString();
  }
}

class StatusSchemaBuilder
    implements Builder<StatusSchema, StatusSchemaBuilder> {
  _$StatusSchema? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  int? _maxLevel;
  int? get maxLevel => _$this._maxLevel;
  set maxLevel(int? maxLevel) => _$this._maxLevel = maxLevel;

  int? _charactersOnline;
  int? get charactersOnline => _$this._charactersOnline;
  set charactersOnline(int? charactersOnline) =>
      _$this._charactersOnline = charactersOnline;

  DateTime? _serverTime;
  DateTime? get serverTime => _$this._serverTime;
  set serverTime(DateTime? serverTime) => _$this._serverTime = serverTime;

  ListBuilder<AnnouncementSchema>? _announcements;
  ListBuilder<AnnouncementSchema> get announcements =>
      _$this._announcements ??= new ListBuilder<AnnouncementSchema>();
  set announcements(ListBuilder<AnnouncementSchema>? announcements) =>
      _$this._announcements = announcements;

  String? _lastWipe;
  String? get lastWipe => _$this._lastWipe;
  set lastWipe(String? lastWipe) => _$this._lastWipe = lastWipe;

  String? _nextWipe;
  String? get nextWipe => _$this._nextWipe;
  set nextWipe(String? nextWipe) => _$this._nextWipe = nextWipe;

  StatusSchemaBuilder() {
    StatusSchema._defaults(this);
  }

  StatusSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _version = $v.version;
      _maxLevel = $v.maxLevel;
      _charactersOnline = $v.charactersOnline;
      _serverTime = $v.serverTime;
      _announcements = $v.announcements.toBuilder();
      _lastWipe = $v.lastWipe;
      _nextWipe = $v.nextWipe;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusSchema other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$StatusSchema._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'StatusSchema', 'status'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'StatusSchema', 'version'),
              maxLevel: BuiltValueNullFieldError.checkNotNull(
                  maxLevel, r'StatusSchema', 'maxLevel'),
              charactersOnline: BuiltValueNullFieldError.checkNotNull(
                  charactersOnline, r'StatusSchema', 'charactersOnline'),
              serverTime: BuiltValueNullFieldError.checkNotNull(
                  serverTime, r'StatusSchema', 'serverTime'),
              announcements: announcements.build(),
              lastWipe: BuiltValueNullFieldError.checkNotNull(
                  lastWipe, r'StatusSchema', 'lastWipe'),
              nextWipe: BuiltValueNullFieldError.checkNotNull(
                  nextWipe, r'StatusSchema', 'nextWipe'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'announcements';
        announcements.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StatusSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
