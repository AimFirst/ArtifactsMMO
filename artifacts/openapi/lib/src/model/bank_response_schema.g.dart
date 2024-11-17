// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankResponseSchema extends BankResponseSchema {
  @override
  final BankSchema data;

  factory _$BankResponseSchema(
          [void Function(BankResponseSchemaBuilder)? updates]) =>
      (new BankResponseSchemaBuilder()..update(updates))._build();

  _$BankResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BankResponseSchema', 'data');
  }

  @override
  BankResponseSchema rebuild(
          void Function(BankResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankResponseSchemaBuilder toBuilder() =>
      new BankResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankResponseSchema && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class BankResponseSchemaBuilder
    implements Builder<BankResponseSchema, BankResponseSchemaBuilder> {
  _$BankResponseSchema? _$v;

  BankSchemaBuilder? _data;
  BankSchemaBuilder get data => _$this._data ??= new BankSchemaBuilder();
  set data(BankSchemaBuilder? data) => _$this._data = data;

  BankResponseSchemaBuilder() {
    BankResponseSchema._defaults(this);
  }

  BankResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankResponseSchema;
  }

  @override
  void update(void Function(BankResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankResponseSchema build() => _build();

  _$BankResponseSchema _build() {
    _$BankResponseSchema _$result;
    try {
      _$result = _$v ?? new _$BankResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
