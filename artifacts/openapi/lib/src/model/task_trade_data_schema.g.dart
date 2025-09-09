// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_trade_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskTradeDataSchema extends TaskTradeDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final TaskTradeSchema trade;
  @override
  final CharacterSchema character;

  factory _$TaskTradeDataSchema(
          [void Function(TaskTradeDataSchemaBuilder)? updates]) =>
      (new TaskTradeDataSchemaBuilder()..update(updates))._build();

  _$TaskTradeDataSchema._(
      {required this.cooldown, required this.trade, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'TaskTradeDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        trade, r'TaskTradeDataSchema', 'trade');
    BuiltValueNullFieldError.checkNotNull(
        character, r'TaskTradeDataSchema', 'character');
  }

  @override
  TaskTradeDataSchema rebuild(
          void Function(TaskTradeDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskTradeDataSchemaBuilder toBuilder() =>
      new TaskTradeDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskTradeDataSchema &&
        cooldown == other.cooldown &&
        trade == other.trade &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, trade.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskTradeDataSchema')
          ..add('cooldown', cooldown)
          ..add('trade', trade)
          ..add('character', character))
        .toString();
  }
}

class TaskTradeDataSchemaBuilder
    implements Builder<TaskTradeDataSchema, TaskTradeDataSchemaBuilder> {
  _$TaskTradeDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  TaskTradeSchemaBuilder? _trade;
  TaskTradeSchemaBuilder get trade =>
      _$this._trade ??= new TaskTradeSchemaBuilder();
  set trade(TaskTradeSchemaBuilder? trade) => _$this._trade = trade;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  TaskTradeDataSchemaBuilder() {
    TaskTradeDataSchema._defaults(this);
  }

  TaskTradeDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _trade = $v.trade.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskTradeDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskTradeDataSchema;
  }

  @override
  void update(void Function(TaskTradeDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskTradeDataSchema build() => _build();

  _$TaskTradeDataSchema _build() {
    _$TaskTradeDataSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskTradeDataSchema._(
              cooldown: cooldown.build(),
              trade: trade.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'trade';
        trade.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskTradeDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
