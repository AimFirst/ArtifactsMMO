// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountDetailsSchema extends AccountDetailsSchema {
  @override
  final AccountDetails data;

  factory _$AccountDetailsSchema(
          [void Function(AccountDetailsSchemaBuilder)? updates]) =>
      (new AccountDetailsSchemaBuilder()..update(updates))._build();

  _$AccountDetailsSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'AccountDetailsSchema', 'data');
  }

  @override
  AccountDetailsSchema rebuild(
          void Function(AccountDetailsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountDetailsSchemaBuilder toBuilder() =>
      new AccountDetailsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountDetailsSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AccountDetailsSchema')
          ..add('data', data))
        .toString();
  }
}

class AccountDetailsSchemaBuilder
    implements Builder<AccountDetailsSchema, AccountDetailsSchemaBuilder> {
  _$AccountDetailsSchema? _$v;

  AccountDetailsBuilder? _data;
  AccountDetailsBuilder get data =>
      _$this._data ??= new AccountDetailsBuilder();
  set data(AccountDetailsBuilder? data) => _$this._data = data;

  AccountDetailsSchemaBuilder() {
    AccountDetailsSchema._defaults(this);
  }

  AccountDetailsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountDetailsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountDetailsSchema;
  }

  @override
  void update(void Function(AccountDetailsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountDetailsSchema build() => _build();

  _$AccountDetailsSchema _build() {
    _$AccountDetailsSchema _$result;
    try {
      _$result = _$v ?? new _$AccountDetailsSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountDetailsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
