// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_npc_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageNPCSchema extends DataPageNPCSchema {
  @override
  final BuiltList<NPCSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageNPCSchema(
          [void Function(DataPageNPCSchemaBuilder)? updates]) =>
      (new DataPageNPCSchemaBuilder()..update(updates))._build();

  _$DataPageNPCSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'DataPageNPCSchema', 'data');
  }

  @override
  DataPageNPCSchema rebuild(void Function(DataPageNPCSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageNPCSchemaBuilder toBuilder() =>
      new DataPageNPCSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageNPCSchema &&
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
    return (newBuiltValueToStringHelper(r'DataPageNPCSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageNPCSchemaBuilder
    implements Builder<DataPageNPCSchema, DataPageNPCSchemaBuilder> {
  _$DataPageNPCSchema? _$v;

  ListBuilder<NPCSchema>? _data;
  ListBuilder<NPCSchema> get data =>
      _$this._data ??= new ListBuilder<NPCSchema>();
  set data(ListBuilder<NPCSchema>? data) => _$this._data = data;

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

  DataPageNPCSchemaBuilder() {
    DataPageNPCSchema._defaults(this);
  }

  DataPageNPCSchemaBuilder get _$this {
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
  void replace(DataPageNPCSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageNPCSchema;
  }

  @override
  void update(void Function(DataPageNPCSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageNPCSchema build() => _build();

  _$DataPageNPCSchema _build() {
    _$DataPageNPCSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageNPCSchema._(
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
            r'DataPageNPCSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
