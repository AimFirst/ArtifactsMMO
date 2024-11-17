// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageItemSchema extends DataPageItemSchema {
  @override
  final BuiltList<ItemSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageItemSchema(
          [void Function(DataPageItemSchemaBuilder)? updates]) =>
      (new DataPageItemSchemaBuilder()..update(updates))._build();

  _$DataPageItemSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'DataPageItemSchema', 'data');
  }

  @override
  DataPageItemSchema rebuild(
          void Function(DataPageItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageItemSchemaBuilder toBuilder() =>
      new DataPageItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageItemSchema &&
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
    return (newBuiltValueToStringHelper(r'DataPageItemSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageItemSchemaBuilder
    implements Builder<DataPageItemSchema, DataPageItemSchemaBuilder> {
  _$DataPageItemSchema? _$v;

  ListBuilder<ItemSchema>? _data;
  ListBuilder<ItemSchema> get data =>
      _$this._data ??= new ListBuilder<ItemSchema>();
  set data(ListBuilder<ItemSchema>? data) => _$this._data = data;

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

  DataPageItemSchemaBuilder() {
    DataPageItemSchema._defaults(this);
  }

  DataPageItemSchemaBuilder get _$this {
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
  void replace(DataPageItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageItemSchema;
  }

  @override
  void update(void Function(DataPageItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageItemSchema build() => _build();

  _$DataPageItemSchema _build() {
    _$DataPageItemSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageItemSchema._(
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
            r'DataPageItemSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
