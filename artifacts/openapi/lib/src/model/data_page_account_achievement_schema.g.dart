// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_account_achievement_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DataPageAccountAchievementSchema
    extends DataPageAccountAchievementSchema {
  @override
  final BuiltList<AccountAchievementSchema> data;
  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? pages;

  factory _$DataPageAccountAchievementSchema(
          [void Function(DataPageAccountAchievementSchemaBuilder)? updates]) =>
      (new DataPageAccountAchievementSchemaBuilder()..update(updates))._build();

  _$DataPageAccountAchievementSchema._(
      {required this.data, this.total, this.page, this.size, this.pages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'DataPageAccountAchievementSchema', 'data');
  }

  @override
  DataPageAccountAchievementSchema rebuild(
          void Function(DataPageAccountAchievementSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPageAccountAchievementSchemaBuilder toBuilder() =>
      new DataPageAccountAchievementSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPageAccountAchievementSchema &&
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
    return (newBuiltValueToStringHelper(r'DataPageAccountAchievementSchema')
          ..add('data', data)
          ..add('total', total)
          ..add('page', page)
          ..add('size', size)
          ..add('pages', pages))
        .toString();
  }
}

class DataPageAccountAchievementSchemaBuilder
    implements
        Builder<DataPageAccountAchievementSchema,
            DataPageAccountAchievementSchemaBuilder> {
  _$DataPageAccountAchievementSchema? _$v;

  ListBuilder<AccountAchievementSchema>? _data;
  ListBuilder<AccountAchievementSchema> get data =>
      _$this._data ??= new ListBuilder<AccountAchievementSchema>();
  set data(ListBuilder<AccountAchievementSchema>? data) => _$this._data = data;

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

  DataPageAccountAchievementSchemaBuilder() {
    DataPageAccountAchievementSchema._defaults(this);
  }

  DataPageAccountAchievementSchemaBuilder get _$this {
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
  void replace(DataPageAccountAchievementSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPageAccountAchievementSchema;
  }

  @override
  void update(void Function(DataPageAccountAchievementSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPageAccountAchievementSchema build() => _build();

  _$DataPageAccountAchievementSchema _build() {
    _$DataPageAccountAchievementSchema _$result;
    try {
      _$result = _$v ??
          new _$DataPageAccountAchievementSchema._(
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
            r'DataPageAccountAchievementSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
