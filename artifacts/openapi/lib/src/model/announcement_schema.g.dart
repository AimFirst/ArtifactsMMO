// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnnouncementSchema extends AnnouncementSchema {
  @override
  final String message;
  @override
  final DateTime? createdAt;

  factory _$AnnouncementSchema(
          [void Function(AnnouncementSchemaBuilder)? updates]) =>
      (new AnnouncementSchemaBuilder()..update(updates))._build();

  _$AnnouncementSchema._({required this.message, this.createdAt}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'AnnouncementSchema', 'message');
  }

  @override
  AnnouncementSchema rebuild(
          void Function(AnnouncementSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementSchemaBuilder toBuilder() =>
      new AnnouncementSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementSchema &&
        message == other.message &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementSchema')
          ..add('message', message)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AnnouncementSchemaBuilder
    implements Builder<AnnouncementSchema, AnnouncementSchemaBuilder> {
  _$AnnouncementSchema? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  AnnouncementSchemaBuilder() {
    AnnouncementSchema._defaults(this);
  }

  AnnouncementSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementSchema;
  }

  @override
  void update(void Function(AnnouncementSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementSchema build() => _build();

  _$AnnouncementSchema _build() {
    final _$result = _$v ??
        new _$AnnouncementSchema._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AnnouncementSchema', 'message'),
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
