// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_details_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyAccountDetailsSchema extends MyAccountDetailsSchema {
  @override
  final MyAccountDetails data;

  factory _$MyAccountDetailsSchema(
          [void Function(MyAccountDetailsSchemaBuilder)? updates]) =>
      (new MyAccountDetailsSchemaBuilder()..update(updates))._build();

  _$MyAccountDetailsSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'MyAccountDetailsSchema', 'data');
  }

  @override
  MyAccountDetailsSchema rebuild(
          void Function(MyAccountDetailsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyAccountDetailsSchemaBuilder toBuilder() =>
      new MyAccountDetailsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyAccountDetailsSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'MyAccountDetailsSchema')
          ..add('data', data))
        .toString();
  }
}

class MyAccountDetailsSchemaBuilder
    implements Builder<MyAccountDetailsSchema, MyAccountDetailsSchemaBuilder> {
  _$MyAccountDetailsSchema? _$v;

  MyAccountDetailsBuilder? _data;
  MyAccountDetailsBuilder get data =>
      _$this._data ??= new MyAccountDetailsBuilder();
  set data(MyAccountDetailsBuilder? data) => _$this._data = data;

  MyAccountDetailsSchemaBuilder() {
    MyAccountDetailsSchema._defaults(this);
  }

  MyAccountDetailsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyAccountDetailsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyAccountDetailsSchema;
  }

  @override
  void update(void Function(MyAccountDetailsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyAccountDetailsSchema build() => _build();

  _$MyAccountDetailsSchema _build() {
    _$MyAccountDetailsSchema _$result;
    try {
      _$result = _$v ?? new _$MyAccountDetailsSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyAccountDetailsSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
