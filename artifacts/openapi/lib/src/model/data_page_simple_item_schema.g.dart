// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_simple_item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageSimpleItemSchema extends DataPageSimpleItemSchema {
  @override
  final BuiltList<SimpleItemSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageSimpleItemSchema(
          [void Function(DataPageSimpleItemSchemaBuilder)? updates]) =>
      (new DataPageSimpleItemSchemaBuilder()..update(updates))._build();

  _$DataPageSimpleItemSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'DataPageSimpleItemSchema', 'data');
  }

  @override
  DataPageSimpleItemSchema rebuild(
          void Function(DataPageSimpleItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageSimpleItemSchemaBuilder toBuilder() =>
      new DataPageSimpleItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageSimpleItemSchema &&
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
    return (newBuiltValueToStringHelper(r'DataPageSimpleItemSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageSimpleItemSchemaBuilder
    implements
        Builder<DataPageSimpleItemSchema, DataPageSimpleItemSchemaBuilder> {
  _$DataPageSimpleItemSchema? _$v;

  ListBuilder<SimpleItemSchema>? _data;
  ListBuilder<SimpleItemSchema> get data =>
      _$this._data ??= new ListBuilder<SimpleItemSchema>();
  set data(ListBuilder<SimpleItemSchema>? data) => _$this._data = data;

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

  DataPageSimpleItemSchemaBuilder() {
    DataPageSimpleItemSchema._defaults(this);
  }

  DataPageSimpleItemSchemaBuilder get _$this {
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
  void replace(DataPageSimpleItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageSimpleItemSchema;
  }

  @override
  void update(void Function(DataPageSimpleItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageSimpleItemSchema build() => _build();

  _$DataPageSimpleItemSchema _build() {
    _$DataPageSimpleItemSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageSimpleItemSchema._(
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
            r'DataPageSimpleItemSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
