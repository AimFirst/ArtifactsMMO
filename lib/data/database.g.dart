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
  static const VerificationMeta _contextTypeMeta =
      const VerificationMeta('contextType');
  @override
  late final GeneratedColumn<String> contextType = GeneratedColumn<String>(
      'context_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contextSubTypeMeta =
      const VerificationMeta('contextSubType');
  @override
  late final GeneratedColumn<String> contextSubType = GeneratedColumn<String>(
      'context_sub_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contextLevelMeta =
      const VerificationMeta('contextLevel');
  @override
  late final GeneratedColumn<int> contextLevel = GeneratedColumn<int>(
      'context_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _optionsHashMeta =
      const VerificationMeta('optionsHash');
  @override
  late final GeneratedColumn<String> optionsHash = GeneratedColumn<String>(
      'options_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loadoutMeta =
      const VerificationMeta('loadout');
  @override
  late final GeneratedColumn<String> loadout = GeneratedColumn<String>(
      'loadout', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        algorithmVersion,
        contextType,
        contextSubType,
        contextLevel,
        optionsHash,
        loadout
      ];
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
    if (data.containsKey('context_type')) {
      context.handle(
          _contextTypeMeta,
          contextType.isAcceptableOrUnknown(
              data['context_type']!, _contextTypeMeta));
    } else if (isInserting) {
      context.missing(_contextTypeMeta);
    }
    if (data.containsKey('context_sub_type')) {
      context.handle(
          _contextSubTypeMeta,
          contextSubType.isAcceptableOrUnknown(
              data['context_sub_type']!, _contextSubTypeMeta));
    } else if (isInserting) {
      context.missing(_contextSubTypeMeta);
    }
    if (data.containsKey('context_level')) {
      context.handle(
          _contextLevelMeta,
          contextLevel.isAcceptableOrUnknown(
              data['context_level']!, _contextLevelMeta));
    } else if (isInserting) {
      context.missing(_contextLevelMeta);
    }
    if (data.containsKey('options_hash')) {
      context.handle(
          _optionsHashMeta,
          optionsHash.isAcceptableOrUnknown(
              data['options_hash']!, _optionsHashMeta));
    } else if (isInserting) {
      context.missing(_optionsHashMeta);
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
  Set<GeneratedColumn> get $primaryKey => {
        algorithmVersion,
        contextType,
        contextSubType,
        contextLevel,
        optionsHash
      };
  @override
  CachedLoadout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedLoadout(
      algorithmVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}algorithm_version'])!,
      contextType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context_type'])!,
      contextSubType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}context_sub_type'])!,
      contextLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}context_level'])!,
      optionsHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options_hash'])!,
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
  final String contextType;
  final String contextSubType;
  final int contextLevel;
  final String optionsHash;
  final String loadout;
  const CachedLoadout(
      {required this.algorithmVersion,
      required this.contextType,
      required this.contextSubType,
      required this.contextLevel,
      required this.optionsHash,
      required this.loadout});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['algorithm_version'] = Variable<int>(algorithmVersion);
    map['context_type'] = Variable<String>(contextType);
    map['context_sub_type'] = Variable<String>(contextSubType);
    map['context_level'] = Variable<int>(contextLevel);
    map['options_hash'] = Variable<String>(optionsHash);
    map['loadout'] = Variable<String>(loadout);
    return map;
  }

  CachedLoadoutsCompanion toCompanion(bool nullToAbsent) {
    return CachedLoadoutsCompanion(
      algorithmVersion: Value(algorithmVersion),
      contextType: Value(contextType),
      contextSubType: Value(contextSubType),
      contextLevel: Value(contextLevel),
      optionsHash: Value(optionsHash),
      loadout: Value(loadout),
    );
  }

  factory CachedLoadout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedLoadout(
      algorithmVersion: serializer.fromJson<int>(json['algorithmVersion']),
      contextType: serializer.fromJson<String>(json['contextType']),
      contextSubType: serializer.fromJson<String>(json['contextSubType']),
      contextLevel: serializer.fromJson<int>(json['contextLevel']),
      optionsHash: serializer.fromJson<String>(json['optionsHash']),
      loadout: serializer.fromJson<String>(json['loadout']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'algorithmVersion': serializer.toJson<int>(algorithmVersion),
      'contextType': serializer.toJson<String>(contextType),
      'contextSubType': serializer.toJson<String>(contextSubType),
      'contextLevel': serializer.toJson<int>(contextLevel),
      'optionsHash': serializer.toJson<String>(optionsHash),
      'loadout': serializer.toJson<String>(loadout),
    };
  }

  CachedLoadout copyWith(
          {int? algorithmVersion,
          String? contextType,
          String? contextSubType,
          int? contextLevel,
          String? optionsHash,
          String? loadout}) =>
      CachedLoadout(
        algorithmVersion: algorithmVersion ?? this.algorithmVersion,
        contextType: contextType ?? this.contextType,
        contextSubType: contextSubType ?? this.contextSubType,
        contextLevel: contextLevel ?? this.contextLevel,
        optionsHash: optionsHash ?? this.optionsHash,
        loadout: loadout ?? this.loadout,
      );
  CachedLoadout copyWithCompanion(CachedLoadoutsCompanion data) {
    return CachedLoadout(
      algorithmVersion: data.algorithmVersion.present
          ? data.algorithmVersion.value
          : this.algorithmVersion,
      contextType:
          data.contextType.present ? data.contextType.value : this.contextType,
      contextSubType: data.contextSubType.present
          ? data.contextSubType.value
          : this.contextSubType,
      contextLevel: data.contextLevel.present
          ? data.contextLevel.value
          : this.contextLevel,
      optionsHash:
          data.optionsHash.present ? data.optionsHash.value : this.optionsHash,
      loadout: data.loadout.present ? data.loadout.value : this.loadout,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedLoadout(')
          ..write('algorithmVersion: $algorithmVersion, ')
          ..write('contextType: $contextType, ')
          ..write('contextSubType: $contextSubType, ')
          ..write('contextLevel: $contextLevel, ')
          ..write('optionsHash: $optionsHash, ')
          ..write('loadout: $loadout')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(algorithmVersion, contextType, contextSubType,
      contextLevel, optionsHash, loadout);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedLoadout &&
          other.algorithmVersion == this.algorithmVersion &&
          other.contextType == this.contextType &&
          other.contextSubType == this.contextSubType &&
          other.contextLevel == this.contextLevel &&
          other.optionsHash == this.optionsHash &&
          other.loadout == this.loadout);
}

class CachedLoadoutsCompanion extends UpdateCompanion<CachedLoadout> {
  final Value<int> algorithmVersion;
  final Value<String> contextType;
  final Value<String> contextSubType;
  final Value<int> contextLevel;
  final Value<String> optionsHash;
  final Value<String> loadout;
  final Value<int> rowid;
  const CachedLoadoutsCompanion({
    this.algorithmVersion = const Value.absent(),
    this.contextType = const Value.absent(),
    this.contextSubType = const Value.absent(),
    this.contextLevel = const Value.absent(),
    this.optionsHash = const Value.absent(),
    this.loadout = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedLoadoutsCompanion.insert({
    required int algorithmVersion,
    required String contextType,
    required String contextSubType,
    required int contextLevel,
    required String optionsHash,
    required String loadout,
    this.rowid = const Value.absent(),
  })  : algorithmVersion = Value(algorithmVersion),
        contextType = Value(contextType),
        contextSubType = Value(contextSubType),
        contextLevel = Value(contextLevel),
        optionsHash = Value(optionsHash),
        loadout = Value(loadout);
  static Insertable<CachedLoadout> custom({
    Expression<int>? algorithmVersion,
    Expression<String>? contextType,
    Expression<String>? contextSubType,
    Expression<int>? contextLevel,
    Expression<String>? optionsHash,
    Expression<String>? loadout,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (algorithmVersion != null) 'algorithm_version': algorithmVersion,
      if (contextType != null) 'context_type': contextType,
      if (contextSubType != null) 'context_sub_type': contextSubType,
      if (contextLevel != null) 'context_level': contextLevel,
      if (optionsHash != null) 'options_hash': optionsHash,
      if (loadout != null) 'loadout': loadout,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedLoadoutsCompanion copyWith(
      {Value<int>? algorithmVersion,
      Value<String>? contextType,
      Value<String>? contextSubType,
      Value<int>? contextLevel,
      Value<String>? optionsHash,
      Value<String>? loadout,
      Value<int>? rowid}) {
    return CachedLoadoutsCompanion(
      algorithmVersion: algorithmVersion ?? this.algorithmVersion,
      contextType: contextType ?? this.contextType,
      contextSubType: contextSubType ?? this.contextSubType,
      contextLevel: contextLevel ?? this.contextLevel,
      optionsHash: optionsHash ?? this.optionsHash,
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
    if (contextType.present) {
      map['context_type'] = Variable<String>(contextType.value);
    }
    if (contextSubType.present) {
      map['context_sub_type'] = Variable<String>(contextSubType.value);
    }
    if (contextLevel.present) {
      map['context_level'] = Variable<int>(contextLevel.value);
    }
    if (optionsHash.present) {
      map['options_hash'] = Variable<String>(optionsHash.value);
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
          ..write('contextType: $contextType, ')
          ..write('contextSubType: $contextSubType, ')
          ..write('contextLevel: $contextLevel, ')
          ..write('optionsHash: $optionsHash, ')
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
  required String contextType,
  required String contextSubType,
  required int contextLevel,
  required String optionsHash,
  required String loadout,
  Value<int> rowid,
});
typedef $$CachedLoadoutsTableUpdateCompanionBuilder = CachedLoadoutsCompanion
    Function({
  Value<int> algorithmVersion,
  Value<String> contextType,
  Value<String> contextSubType,
  Value<int> contextLevel,
  Value<String> optionsHash,
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

  ColumnFilters<String> get contextType => $composableBuilder(
      column: $table.contextType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contextSubType => $composableBuilder(
      column: $table.contextSubType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get contextLevel => $composableBuilder(
      column: $table.contextLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionsHash => $composableBuilder(
      column: $table.optionsHash, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get contextType => $composableBuilder(
      column: $table.contextType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contextSubType => $composableBuilder(
      column: $table.contextSubType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get contextLevel => $composableBuilder(
      column: $table.contextLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionsHash => $composableBuilder(
      column: $table.optionsHash, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get contextType => $composableBuilder(
      column: $table.contextType, builder: (column) => column);

  GeneratedColumn<String> get contextSubType => $composableBuilder(
      column: $table.contextSubType, builder: (column) => column);

  GeneratedColumn<int> get contextLevel => $composableBuilder(
      column: $table.contextLevel, builder: (column) => column);

  GeneratedColumn<String> get optionsHash => $composableBuilder(
      column: $table.optionsHash, builder: (column) => column);

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
            Value<String> contextType = const Value.absent(),
            Value<String> contextSubType = const Value.absent(),
            Value<int> contextLevel = const Value.absent(),
            Value<String> optionsHash = const Value.absent(),
            Value<String> loadout = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedLoadoutsCompanion(
            algorithmVersion: algorithmVersion,
            contextType: contextType,
            contextSubType: contextSubType,
            contextLevel: contextLevel,
            optionsHash: optionsHash,
            loadout: loadout,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int algorithmVersion,
            required String contextType,
            required String contextSubType,
            required int contextLevel,
            required String optionsHash,
            required String loadout,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedLoadoutsCompanion.insert(
            algorithmVersion: algorithmVersion,
            contextType: contextType,
            contextSubType: contextSubType,
            contextLevel: contextLevel,
            optionsHash: optionsHash,
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
