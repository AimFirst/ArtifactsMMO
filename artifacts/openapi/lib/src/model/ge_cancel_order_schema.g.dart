// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_cancel_order_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GECancelOrderSchema extends GECancelOrderSchema {
  @override
  final String id;

  factory _$GECancelOrderSchema(
          [void Function(GECancelOrderSchemaBuilder)? updates]) =>
      (new GECancelOrderSchemaBuilder()..update(updates))._build();

  _$GECancelOrderSchema._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GECancelOrderSchema', 'id');
  }

  @override
  GECancelOrderSchema rebuild(
          void Function(GECancelOrderSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GECancelOrderSchemaBuilder toBuilder() =>
      new GECancelOrderSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GECancelOrderSchema && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GECancelOrderSchema')..add('id', id))
        .toString();
  }
}

class GECancelOrderSchemaBuilder
    implements Builder<GECancelOrderSchema, GECancelOrderSchemaBuilder> {
  _$GECancelOrderSchema? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GECancelOrderSchemaBuilder() {
    GECancelOrderSchema._defaults(this);
  }

  GECancelOrderSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GECancelOrderSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GECancelOrderSchema;
  }

  @override
  void update(void Function(GECancelOrderSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GECancelOrderSchema build() => _build();

  _$GECancelOrderSchema _build() {
    final _$result = _$v ??
        new _$GECancelOrderSchema._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GECancelOrderSchema', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
