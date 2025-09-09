// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_trade_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskTradeSchema extends TaskTradeSchema {
  @override
  final String code;
  @override
  final int quantity;

  factory _$TaskTradeSchema([void Function(TaskTradeSchemaBuilder)? updates]) =>
      (new TaskTradeSchemaBuilder()..update(updates))._build();

  _$TaskTradeSchema._({required this.code, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'TaskTradeSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'TaskTradeSchema', 'quantity');
  }

  @override
  TaskTradeSchema rebuild(void Function(TaskTradeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskTradeSchemaBuilder toBuilder() =>
      new TaskTradeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskTradeSchema &&
        code == other.code &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskTradeSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class TaskTradeSchemaBuilder
    implements Builder<TaskTradeSchema, TaskTradeSchemaBuilder> {
  _$TaskTradeSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  TaskTradeSchemaBuilder() {
    TaskTradeSchema._defaults(this);
  }

  TaskTradeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskTradeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskTradeSchema;
  }

  @override
  void update(void Function(TaskTradeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskTradeSchema build() => _build();

  _$TaskTradeSchema _build() {
    final _$result = _$v ??
        new _$TaskTradeSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'TaskTradeSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'TaskTradeSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
