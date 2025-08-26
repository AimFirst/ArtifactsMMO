// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fight_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FightSchema extends FightSchema {
  @override
  final int xp;
  @override
  final int gold;
  @override
  final BuiltList<DropSchema> drops;
  @override
  final int turns;
  @override
  final BuiltList<String> logs;
  @override
  final FightResult result;

  factory _$FightSchema([void Function(FightSchemaBuilder)? updates]) =>
      (FightSchemaBuilder()..update(updates))._build();

  _$FightSchema._(
      {required this.xp,
      required this.gold,
      required this.drops,
      required this.turns,
      required this.logs,
      required this.result})
      : super._();
  @override
  FightSchema rebuild(void Function(FightSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FightSchemaBuilder toBuilder() => FightSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FightSchema &&
        xp == other.xp &&
        gold == other.gold &&
        drops == other.drops &&
        turns == other.turns &&
        logs == other.logs &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xp.hashCode);
    _$hash = $jc(_$hash, gold.hashCode);
    _$hash = $jc(_$hash, drops.hashCode);
    _$hash = $jc(_$hash, turns.hashCode);
    _$hash = $jc(_$hash, logs.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FightSchema')
          ..add('xp', xp)
          ..add('gold', gold)
          ..add('drops', drops)
          ..add('turns', turns)
          ..add('logs', logs)
          ..add('result', result))
        .toString();
  }
}

class FightSchemaBuilder implements Builder<FightSchema, FightSchemaBuilder> {
  _$FightSchema? _$v;

  int? _xp;
  int? get xp => _$this._xp;
  set xp(int? xp) => _$this._xp = xp;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  ListBuilder<DropSchema>? _drops;
  ListBuilder<DropSchema> get drops =>
      _$this._drops ??= ListBuilder<DropSchema>();
  set drops(ListBuilder<DropSchema>? drops) => _$this._drops = drops;

  int? _turns;
  int? get turns => _$this._turns;
  set turns(int? turns) => _$this._turns = turns;

  ListBuilder<String>? _logs;
  ListBuilder<String> get logs => _$this._logs ??= ListBuilder<String>();
  set logs(ListBuilder<String>? logs) => _$this._logs = logs;

  FightResult? _result;
  FightResult? get result => _$this._result;
  set result(FightResult? result) => _$this._result = result;

  FightSchemaBuilder() {
    FightSchema._defaults(this);
  }

  FightSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xp = $v.xp;
      _gold = $v.gold;
      _drops = $v.drops.toBuilder();
      _turns = $v.turns;
      _logs = $v.logs.toBuilder();
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FightSchema other) {
    _$v = other as _$FightSchema;
  }

  @override
  void update(void Function(FightSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FightSchema build() => _build();

  _$FightSchema _build() {
    _$FightSchema _$result;
    try {
      _$result = _$v ??
          _$FightSchema._(
            xp: BuiltValueNullFieldError.checkNotNull(xp, r'FightSchema', 'xp'),
            gold: BuiltValueNullFieldError.checkNotNull(
                gold, r'FightSchema', 'gold'),
            drops: drops.build(),
            turns: BuiltValueNullFieldError.checkNotNull(
                turns, r'FightSchema', 'turns'),
            logs: logs.build(),
            result: BuiltValueNullFieldError.checkNotNull(
                result, r'FightSchema', 'result'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'drops';
        drops.build();

        _$failedField = 'logs';
        logs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FightSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
