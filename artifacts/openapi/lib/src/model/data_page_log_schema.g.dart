// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_log_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageLogSchema extends DataPageLogSchema {
  @override
  final BuiltList<LogSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageLogSchema(
          [void Function(DataPageLogSchemaBuilder)? updates]) =>
      (new DataPageLogSchemaBuilder()..update(updates))._build();

  _$DataPageLogSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'DataPageLogSchema', 'data');
  }

  @override
  DataPageLogSchema rebuild(void Function(DataPageLogSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageLogSchemaBuilder toBuilder() =>
      new DataPageLogSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageLogSchema &&
        data == other.data &&
        total == other.total &&
        page == other.page &&
        size == other.size &&
        pages == other.pages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, pages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataPageLogSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageLogSchemaBuilder
    implements Builder<DataPageLogSchema, DataPageLogSchemaBuilder> {
  _$DataPageLogSchema? _$v;

  ListBuilder<LogSchema>? _data;
  ListBuilder<LogSchema> get data =>
      _$this._data ??= new ListBuilder<LogSchema>();
  set data(ListBuilder<LogSchema>? data) => _$this._data = data;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  int? _pages;
  int? get pages => _$this._pages;
  set pages(int? pages) => _$this._pages = pages;

  DataPageLogSchemaBuilder() {
    DataPageLogSchema._defaults(this);
  }

  DataPageLogSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _total = $v.total;
      _page = $v.page;
      _size = $v.size;
      _pages = $v.pages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataPageLogSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageLogSchema;
  }

  @override
  void update(void Function(DataPageLogSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageLogSchema build() => _build();

  _$DataPageLogSchema _build() {
    _$DataPageLogSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageLogSchema._(
              data: data.build(),
              total: total,
              page: page,
              size: size,
              pages: pages);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DataPageLogSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
