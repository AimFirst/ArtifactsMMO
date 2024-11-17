// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_content_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventContentSchema extends EventContentSchema {
  @override
  final String type;
  @override
  final String code;

  factory _$EventContentSchema(
          [void Function(EventContentSchemaBuilder)? updates]) =>
      (new EventContentSchemaBuilder()..update(updates))._build();

  _$EventContentSchema._({required this.type, required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'EventContentSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(code, r'EventContentSchema', 'code');
  }

  @override
  EventContentSchema rebuild(
          void Function(EventContentSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventContentSchemaBuilder toBuilder() =>
      new EventContentSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventContentSchema &&
        type == other.type &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventContentSchema')
          ..add('type', type)
          ..add('code', code))
        .toString();
  }
}

class EventContentSchemaBuilder
    implements Builder<EventContentSchema, EventContentSchemaBuilder> {
  _$EventContentSchema? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  EventContentSchemaBuilder() {
    EventContentSchema._defaults(this);
  }

  EventContentSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventContentSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventContentSchema;
  }

  @override
  void update(void Function(EventContentSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventContentSchema build() => _build();

  _$EventContentSchema _build() {
    final _$result = _$v ??
        new _$EventContentSchema._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'EventContentSchema', 'type'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EventContentSchema', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
