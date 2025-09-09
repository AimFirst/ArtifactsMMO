// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CachedLoadoutsTable extends CachedLoadouts
    with TableInfo<$CachedLoadoutsTable, CachedLoadout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedLoadoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _algorithmVersionMeta =
      const VerificationMeta('algorithmVersion');
  @override
  late final GeneratedColumn<int> algorithmVersion = GeneratedColumn<int>(
      'algorithm_version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cacheKeyMeta =
      const VerificationMeta('cacheKey');
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
      'cache_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loadoutMeta =
      const VerificationMeta('loadout');
  @override
  late final GeneratedColumn<String> loadout = GeneratedColumn<String>(
      'loadout', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [algorithmVersion, cacheKey, loadout];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_loadouts';
  @override
  VerificationContext validateIntegrity(Insertable<CachedLoadout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('algorithm_version')) {
      context.handle(
          _algorithmVersionMeta,
          algorithmVersion.isAcceptableOrUnknown(
              data['algorithm_version']!, _algorithmVersionMeta));
    } else if (isInserting) {
      context.missing(_algorithmVersionMeta);
    }
    if (data.containsKey('cache_key')) {
      context.handle(_cacheKeyMeta,
          cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta));
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('loadout')) {
      context.handle(_loadoutMeta,
          loadout.isAcceptableOrUnknown(data['loadout']!, _loadoutMeta));
    } else if (isInserting) {
      context.missing(_loadoutMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {algorithmVersion, cacheKey};
  @override
  CachedLoadout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedLoadout(
      algorithmVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}algorithm_version'])!,
      cacheKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cache_key'])!,
      loadout: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loadout'])!,
    );
  }

  @override
  $CachedLoadoutsTable createAlias(String alias) {
    return $CachedLoadoutsTable(attachedDatabase, alias);
  }
}

class CachedLoadout extends DataClass implements Insertable<CachedLoadout> {
  final int algorithmVersion;
  final String cacheKey;
  final String loadout;
  const CachedLoadout(
      {required this.algorithmVersion,
      required this.cacheKey,
      required this.loadout});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['algorithm_version'] = Variable<int>(algorithmVersion);
    map['cache_key'] = Variable<String>(cacheKey);
    map['loadout'] = Variable<String>(loadout);
    return map;
  }

  CachedLoadoutsCompanion toCompanion(bool nullToAbsent) {
    return CachedLoadoutsCompanion(
      algorithmVersion: Value(algorithmVersion),
      cacheKey: Value(cacheKey),
      loadout: Value(loadout),
    );
  }

  factory CachedLoadout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedLoadout(
      algorithmVersion: serializer.fromJson<int>(json['algorithmVersion']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      loadout: serializer.fromJson<String>(json['loadout']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'algorithmVersion': serializer.toJson<int>(algorithmVersion),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'loadout': serializer.toJson<String>(loadout),
    };
  }

  CachedLoadout copyWith(
          {int? algorithmVersion, String? cacheKey, String? loadout}) =>
      CachedLoadout(
        algorithmVersion: algorithmVersion ?? this.algorithmVersion,
        cacheKey: cacheKey ?? this.cacheKey,
        loadout: loadout ?? this.loadout,
      );
  CachedLoadout copyWithCompanion(CachedLoadoutsCompanion data) {
    return CachedLoadout(
      algorithmVersion: data.algorithmVersion.present
          ? data.algorithmVersion.value
          : this.algorithmVersion,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      loadout: data.loadout.present ? data.loadout.value : this.loadout,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedLoadout(')
          ..write('algorithmVersion: $algorithmVersion, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('loadout: $loadout')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(algorithmVersion, cacheKey, loadout);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedLoadout &&
          other.algorithmVersion == this.algorithmVersion &&
          other.cacheKey == this.cacheKey &&
          other.loadout == this.loadout);
}

class CachedLoadoutsCompanion extends UpdateCompanion<CachedLoadout> {
  final Value<int> algorithmVersion;
  final Value<String> cacheKey;
  final Value<String> loadout;
  final Value<int> rowid;
  const CachedLoadoutsCompanion({
    this.algorithmVersion = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.loadout = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedLoadoutsCompanion.insert({
    required int algorithmVersion,
    required String cacheKey,
    required String loadout,
    this.rowid = const Value.absent(),
  })  : algorithmVersion = Value(algorithmVersion),
        cacheKey = Value(cacheKey),
        loadout = Value(loadout);
  static Insertable<CachedLoadout> custom({
    Expression<int>? algorithmVersion,
    Expression<String>? cacheKey,
    Expression<String>? loadout,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (algorithmVersion != null) 'algorithm_version': algorithmVersion,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (loadout != null) 'loadout': loadout,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedLoadoutsCompanion copyWith(
      {Value<int>? algorithmVersion,
      Value<String>? cacheKey,
      Value<String>? loadout,
      Value<int>? rowid}) {
    return CachedLoadoutsCompanion(
      algorithmVersion: algorithmVersion ?? this.algorithmVersion,
      cacheKey: cacheKey ?? this.cacheKey,
      loadout: loadout ?? this.loadout,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (algorithmVersion.present) {
      map['algorithm_version'] = Variable<int>(algorithmVersion.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (loadout.present) {
      map['loadout'] = Variable<String>(loadout.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedLoadoutsCompanion(')
          ..write('algorithmVersion: $algorithmVersion, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('loadout: $loadout, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedLoadoutsTable cachedLoadouts = $CachedLoadoutsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cachedLoadouts];
}

typedef $$CachedLoadoutsTableCreateCompanionBuilder = CachedLoadoutsCompanion
    Function({
  required int algorithmVersion,
  required String cacheKey,
  required String loadout,
  Value<int> rowid,
});
typedef $$CachedLoadoutsTableUpdateCompanionBuilder = CachedLoadoutsCompanion
    Function({
  Value<int> algorithmVersion,
  Value<String> cacheKey,
  Value<String> loadout,
  Value<int> rowid,
});

class $$CachedLoadoutsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedLoadoutsTable> {
  $$CachedLoadoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get algorithmVersion => $composableBuilder(
      column: $table.algorithmVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loadout => $composableBuilder(
      column: $table.loadout, builder: (column) => ColumnFilters(column));
}

class $$CachedLoadoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedLoadoutsTable> {
  $$CachedLoadoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get algorithmVersion => $composableBuilder(
      column: $table.algorithmVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loadout => $composableBuilder(
      column: $table.loadout, builder: (column) => ColumnOrderings(column));
}

class $$CachedLoadoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedLoadoutsTable> {
  $$CachedLoadoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get algorithmVersion => $composableBuilder(
      column: $table.algorithmVersion, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get loadout =>
      $composableBuilder(column: $table.loadout, builder: (column) => column);
}

class $$CachedLoadoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedLoadoutsTable,
    CachedLoadout,
    $$CachedLoadoutsTableFilterComposer,
    $$CachedLoadoutsTableOrderingComposer,
    $$CachedLoadoutsTableAnnotationComposer,
    $$CachedLoadoutsTableCreateCompanionBuilder,
    $$CachedLoadoutsTableUpdateCompanionBuilder,
    (
      CachedLoadout,
      BaseReferences<_$AppDatabase, $CachedLoadoutsTable, CachedLoadout>
    ),
    CachedLoadout,
    PrefetchHooks Function()> {
  $$CachedLoadoutsTableTableManager(
      _$AppDatabase db, $CachedLoadoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedLoadoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedLoadoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedLoadoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> algorithmVersion = const Value.absent(),
            Value<String> cacheKey = const Value.absent(),
            Value<String> loadout = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedLoadoutsCompanion(
            algorithmVersion: algorithmVersion,
            cacheKey: cacheKey,
            loadout: loadout,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int algorithmVersion,
            required String cacheKey,
            required String loadout,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedLoadoutsCompanion.insert(
            algorithmVersion: algorithmVersion,
            cacheKey: cacheKey,
            loadout: loadout,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedLoadoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedLoadoutsTable,
    CachedLoadout,
    $$CachedLoadoutsTableFilterComposer,
    $$CachedLoadoutsTableOrderingComposer,
    $$CachedLoadoutsTableAnnotationComposer,
    $$CachedLoadoutsTableCreateCompanionBuilder,
    $$CachedLoadoutsTableUpdateCompanionBuilder,
    (
      CachedLoadout,
      BaseReferences<_$AppDatabase, $CachedLoadoutsTable, CachedLoadout>
    ),
    CachedLoadout,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedLoadoutsTableTableManager get cachedLoadouts =>
      $$CachedLoadoutsTableTableManager(_db, _db.cachedLoadouts);
}
