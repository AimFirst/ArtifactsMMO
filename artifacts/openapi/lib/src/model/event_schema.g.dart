// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventSchema extends EventSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final EventContentSchema content;
  @override
  final BuiltList<EventMapSchema> maps;
  @override
  final String skin;
  @override
  final int duration;
  @override
  final int rate;

  factory _$EventSchema([void Function(EventSchemaBuilder)? updates]) =>
      (new EventSchemaBuilder()..update(updates))._build();

  _$EventSchema._(
      {required this.name,
      required this.code,
      required this.content,
      required this.maps,
      required this.skin,
      required this.duration,
      required this.rate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'EventSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'EventSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(content, r'EventSchema', 'content');
    BuiltValueNullFieldError.checkNotNull(maps, r'EventSchema', 'maps');
    BuiltValueNullFieldError.checkNotNull(skin, r'EventSchema', 'skin');
    BuiltValueNullFieldError.checkNotNull(duration, r'EventSchema', 'duration');
    BuiltValueNullFieldError.checkNotNull(rate, r'EventSchema', 'rate');
  }

  @override
  EventSchema rebuild(void Function(EventSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventSchemaBuilder toBuilder() => new EventSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventSchema &&
        name == other.name &&
        code == other.code &&
        content == other.content &&
        maps == other.maps &&
        skin == other.skin &&
        duration == other.duration &&
        rate == other.rate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, maps.hashCode);
    _$hash = $jc(_$hash, skin.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('content', content)
          ..add('maps', maps)
          ..add('skin', skin)
          ..add('duration', duration)
          ..add('rate', rate))
        .toString();
  }
}

class EventSchemaBuilder implements Builder<EventSchema, EventSchemaBuilder> {
  _$EventSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  EventContentSchemaBuilder? _content;
  EventContentSchemaBuilder get content =>
      _$this._content ??= new EventContentSchemaBuilder();
  set content(EventContentSchemaBuilder? content) => _$this._content = content;

  ListBuilder<EventMapSchema>? _maps;
  ListBuilder<EventMapSchema> get maps =>
      _$this._maps ??= new ListBuilder<EventMapSchema>();
  set maps(ListBuilder<EventMapSchema>? maps) => _$this._maps = maps;

  String? _skin;
  String? get skin => _$this._skin;
  set skin(String? skin) => _$this._skin = skin;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  EventSchemaBuilder() {
    EventSchema._defaults(this);
  }

  EventSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _content = $v.content.toBuilder();
      _maps = $v.maps.toBuilder();
      _skin = $v.skin;
      _duration = $v.duration;
      _rate = $v.rate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventSchema;
  }

  @override
  void update(void Function(EventSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventSchema build() => _build();

  _$EventSchema _build() {
    _$EventSchema _$result;
    try {
      _$result = _$v ??
          new _$EventSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'EventSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'EventSchema', 'code'),
              content: content.build(),
              maps: maps.build(),
              skin: BuiltValueNullFieldError.checkNotNull(
                  skin, r'EventSchema', 'skin'),
              duration: BuiltValueNullFieldError.checkNotNull(
                  duration, r'EventSchema', 'duration'),
              rate: BuiltValueNullFieldError.checkNotNull(
                  rate, r'EventSchema', 'rate'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        content.build();
        _$failedField = 'maps';
        maps.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
