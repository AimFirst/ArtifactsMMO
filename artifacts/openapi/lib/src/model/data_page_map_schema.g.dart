// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_map_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageMapSchema extends DataPageMapSchema {
  @override
  final BuiltList<MapSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageMapSchema(
          [void Function(DataPageMapSchemaBuilder)? updates]) =>
      (new DataPageMapSchemaBuilder()..update(updates))._build();

  _$DataPageMapSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'DataPageMapSchema', 'data');
  }

  @override
  DataPageMapSchema rebuild(void Function(DataPageMapSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageMapSchemaBuilder toBuilder() =>
      new DataPageMapSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageMapSchema &&
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
    return (newBuiltValueToStringHelper(r'DataPageMapSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageMapSchemaBuilder
    implements Builder<DataPageMapSchema, DataPageMapSchemaBuilder> {
  _$DataPageMapSchema? _$v;

  ListBuilder<MapSchema>? _data;
  ListBuilder<MapSchema> get data =>
      _$this._data ??= new ListBuilder<MapSchema>();
  set data(ListBuilder<MapSchema>? data) => _$this._data = data;

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

  DataPageMapSchemaBuilder() {
    DataPageMapSchema._defaults(this);
  }

  DataPageMapSchemaBuilder get _$this {
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
  void replace(DataPageMapSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageMapSchema;
  }

  @override
  void update(void Function(DataPageMapSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageMapSchema build() => _build();

  _$DataPageMapSchema _build() {
    _$DataPageMapSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageMapSchema._(
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
            r'DataPageMapSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
