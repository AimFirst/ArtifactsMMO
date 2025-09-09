// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogSchema extends LogSchema {
  @override
  final String character;
  @override
  final String account;
  @override
  final LogType type;
  @override
  final String description;
  @override
  final JsonObject? content;
  @override
  final int cooldown;
  @override
  final DateTime? cooldownExpiration;
  @override
  final DateTime createdAt;

  factory _$LogSchema([void Function(LogSchemaBuilder)? updates]) =>
      (new LogSchemaBuilder()..update(updates))._build();

  _$LogSchema._(
      {required this.character,
      required this.account,
      required this.type,
      required this.description,
      this.content,
      required this.cooldown,
      this.cooldownExpiration,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(character, r'LogSchema', 'character');
    BuiltValueNullFieldError.checkNotNull(account, r'LogSchema', 'account');
    BuiltValueNullFieldError.checkNotNull(type, r'LogSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(
        description, r'LogSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(cooldown, r'LogSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(createdAt, r'LogSchema', 'createdAt');
  }

  @override
  LogSchema rebuild(void Function(LogSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogSchemaBuilder toBuilder() => new LogSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogSchema &&
        character == other.character &&
        account == other.account &&
        type == other.type &&
        description == other.description &&
        content == other.content &&
        cooldown == other.cooldown &&
        cooldownExpiration == other.cooldownExpiration &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jc(_$hash, account.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, cooldownExpiration.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogSchema')
          ..add('character', character)
          ..add('account', account)
          ..add('type', type)
          ..add('description', description)
          ..add('content', content)
          ..add('cooldown', cooldown)
          ..add('cooldownExpiration', cooldownExpiration)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class LogSchemaBuilder implements Builder<LogSchema, LogSchemaBuilder> {
  _$LogSchema? _$v;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  String? _account;
  String? get account => _$this._account;
  set account(String? account) => _$this._account = account;

  LogType? _type;
  LogType? get type => _$this._type;
  set type(LogType? type) => _$this._type = type;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  JsonObject? _content;
  JsonObject? get content => _$this._content;
  set content(JsonObject? content) => _$this._content = content;

  int? _cooldown;
  int? get cooldown => _$this._cooldown;
  set cooldown(int? cooldown) => _$this._cooldown = cooldown;

  DateTime? _cooldownExpiration;
  DateTime? get cooldownExpiration => _$this._cooldownExpiration;
  set cooldownExpiration(DateTime? cooldownExpiration) =>
      _$this._cooldownExpiration = cooldownExpiration;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  LogSchemaBuilder() {
    LogSchema._defaults(this);
  }

  LogSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _character = $v.character;
      _account = $v.account;
      _type = $v.type;
      _description = $v.description;
      _content = $v.content;
      _cooldown = $v.cooldown;
      _cooldownExpiration = $v.cooldownExpiration;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogSchema;
  }

  @override
  void update(void Function(LogSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogSchema build() => _build();

  _$LogSchema _build() {
    final _$result = _$v ??
        new _$LogSchema._(
            character: BuiltValueNullFieldError.checkNotNull(
                character, r'LogSchema', 'character'),
            account: BuiltValueNullFieldError.checkNotNull(
                account, r'LogSchema', 'account'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'LogSchema', 'type'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'LogSchema', 'description'),
            content: content,
            cooldown: BuiltValueNullFieldError.checkNotNull(
                cooldown, r'LogSchema', 'cooldown'),
            cooldownExpiration: cooldownExpiration,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'LogSchema', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
