// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'equipment_loadout_result.dart';

class EquipmentLoadoutResultMapper
    extends ClassMapperBase<EquipmentLoadoutResult> {
  EquipmentLoadoutResultMapper._();

  static EquipmentLoadoutResultMapper? _instance;
  static EquipmentLoadoutResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EquipmentLoadoutResultMapper._());
      CombatEquipmentLoadoutResultMapper.ensureInitialized();
      SkillEquipmentLoadoutResultMapper.ensureInitialized();
      HealEquipmentLoadoutResultMapper.ensureInitialized();
      EquipmentLoadoutMapper.ensureInitialized();
      QuantityItemSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EquipmentLoadoutResult';

  static EquipmentLoadout _$loadout(EquipmentLoadoutResult v) => v.loadout;
  static const Field<EquipmentLoadoutResult, EquipmentLoadout> _f$loadout =
      Field('loadout', _$loadout);
  static List<QuantityItemSchema> _$itemsToUse(EquipmentLoadoutResult v) =>
      v.itemsToUse;
  static const Field<EquipmentLoadoutResult, List<QuantityItemSchema>>
  _f$itemsToUse = Field('itemsToUse', _$itemsToUse);

  @override
  final MappableFields<EquipmentLoadoutResult> fields = const {
    #loadout: _f$loadout,
    #itemsToUse: _f$itemsToUse,
  };

  static EquipmentLoadoutResult _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EquipmentLoadoutResult');
  }

  @override
  final Function instantiate = _instantiate;

  static EquipmentLoadoutResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EquipmentLoadoutResult>(map);
  }

  static EquipmentLoadoutResult fromJson(String json) {
    return ensureInitialized().decodeJson<EquipmentLoadoutResult>(json);
  }
}

mixin EquipmentLoadoutResultMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EquipmentLoadoutResultCopyWith<
    EquipmentLoadoutResult,
    EquipmentLoadoutResult,
    EquipmentLoadoutResult
  >
  get copyWith;
}

abstract class EquipmentLoadoutResultCopyWith<
  $R,
  $In extends EquipmentLoadoutResult,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout> get loadout;
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse;
  $R call({EquipmentLoadout? loadout, List<QuantityItemSchema>? itemsToUse});
  EquipmentLoadoutResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class CombatEquipmentLoadoutResultMapper
    extends SubClassMapperBase<CombatEquipmentLoadoutResult> {
  CombatEquipmentLoadoutResultMapper._();

  static CombatEquipmentLoadoutResultMapper? _instance;
  static CombatEquipmentLoadoutResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CombatEquipmentLoadoutResultMapper._(),
      );
      EquipmentLoadoutResultMapper.ensureInitialized().addSubMapper(_instance!);
      EquipmentLoadoutMapper.ensureInitialized();
      QuantityItemSchemaMapper.ensureInitialized();
      CombatDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CombatEquipmentLoadoutResult';

  static EquipmentLoadout _$loadout(CombatEquipmentLoadoutResult v) =>
      v.loadout;
  static const Field<CombatEquipmentLoadoutResult, EquipmentLoadout>
  _f$loadout = Field('loadout', _$loadout);
  static List<QuantityItemSchema> _$itemsToUse(
    CombatEquipmentLoadoutResult v,
  ) => v.itemsToUse;
  static const Field<CombatEquipmentLoadoutResult, List<QuantityItemSchema>>
  _f$itemsToUse = Field('itemsToUse', _$itemsToUse);
  static CombatDetails _$combatDetails(CombatEquipmentLoadoutResult v) =>
      v.combatDetails;
  static const Field<CombatEquipmentLoadoutResult, CombatDetails>
  _f$combatDetails = Field('combatDetails', _$combatDetails);

  @override
  final MappableFields<CombatEquipmentLoadoutResult> fields = const {
    #loadout: _f$loadout,
    #itemsToUse: _f$itemsToUse,
    #combatDetails: _f$combatDetails,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'CombatEquipmentLoadoutResult';
  @override
  late final ClassMapperBase superMapper =
      EquipmentLoadoutResultMapper.ensureInitialized();

  static CombatEquipmentLoadoutResult _instantiate(DecodingData data) {
    return CombatEquipmentLoadoutResult(
      loadout: data.dec(_f$loadout),
      itemsToUse: data.dec(_f$itemsToUse),
      combatDetails: data.dec(_f$combatDetails),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CombatEquipmentLoadoutResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CombatEquipmentLoadoutResult>(map);
  }

  static CombatEquipmentLoadoutResult fromJson(String json) {
    return ensureInitialized().decodeJson<CombatEquipmentLoadoutResult>(json);
  }
}

mixin CombatEquipmentLoadoutResultMappable {
  String toJson() {
    return CombatEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeJson<CombatEquipmentLoadoutResult>(
          this as CombatEquipmentLoadoutResult,
        );
  }

  Map<String, dynamic> toMap() {
    return CombatEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeMap<CombatEquipmentLoadoutResult>(
          this as CombatEquipmentLoadoutResult,
        );
  }

  CombatEquipmentLoadoutResultCopyWith<
    CombatEquipmentLoadoutResult,
    CombatEquipmentLoadoutResult,
    CombatEquipmentLoadoutResult
  >
  get copyWith => _CombatEquipmentLoadoutResultCopyWithImpl<
    CombatEquipmentLoadoutResult,
    CombatEquipmentLoadoutResult
  >(this as CombatEquipmentLoadoutResult, $identity, $identity);
  @override
  String toString() {
    return CombatEquipmentLoadoutResultMapper.ensureInitialized()
        .stringifyValue(this as CombatEquipmentLoadoutResult);
  }

  @override
  bool operator ==(Object other) {
    return CombatEquipmentLoadoutResultMapper.ensureInitialized().equalsValue(
      this as CombatEquipmentLoadoutResult,
      other,
    );
  }

  @override
  int get hashCode {
    return CombatEquipmentLoadoutResultMapper.ensureInitialized().hashValue(
      this as CombatEquipmentLoadoutResult,
    );
  }
}

extension CombatEquipmentLoadoutResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CombatEquipmentLoadoutResult, $Out> {
  CombatEquipmentLoadoutResultCopyWith<$R, CombatEquipmentLoadoutResult, $Out>
  get $asCombatEquipmentLoadoutResult => $base.as(
    (v, t, t2) => _CombatEquipmentLoadoutResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CombatEquipmentLoadoutResultCopyWith<
  $R,
  $In extends CombatEquipmentLoadoutResult,
  $Out
>
    implements EquipmentLoadoutResultCopyWith<$R, $In, $Out> {
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout> get loadout;
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse;
  CombatDetailsCopyWith<$R, CombatDetails, CombatDetails> get combatDetails;
  @override
  $R call({
    EquipmentLoadout? loadout,
    List<QuantityItemSchema>? itemsToUse,
    CombatDetails? combatDetails,
  });
  CombatEquipmentLoadoutResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CombatEquipmentLoadoutResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CombatEquipmentLoadoutResult, $Out>
    implements
        CombatEquipmentLoadoutResultCopyWith<
          $R,
          CombatEquipmentLoadoutResult,
          $Out
        > {
  _CombatEquipmentLoadoutResultCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<CombatEquipmentLoadoutResult> $mapper =
      CombatEquipmentLoadoutResultMapper.ensureInitialized();
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout>
  get loadout => $value.loadout.copyWith.$chain((v) => call(loadout: v));
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse => ListCopyWith(
    $value.itemsToUse,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(itemsToUse: v),
  );
  @override
  CombatDetailsCopyWith<$R, CombatDetails, CombatDetails> get combatDetails =>
      $value.combatDetails.copyWith.$chain((v) => call(combatDetails: v));
  @override
  $R call({
    EquipmentLoadout? loadout,
    List<QuantityItemSchema>? itemsToUse,
    CombatDetails? combatDetails,
  }) => $apply(
    FieldCopyWithData({
      if (loadout != null) #loadout: loadout,
      if (itemsToUse != null) #itemsToUse: itemsToUse,
      if (combatDetails != null) #combatDetails: combatDetails,
    }),
  );
  @override
  CombatEquipmentLoadoutResult $make(CopyWithData data) =>
      CombatEquipmentLoadoutResult(
        loadout: data.get(#loadout, or: $value.loadout),
        itemsToUse: data.get(#itemsToUse, or: $value.itemsToUse),
        combatDetails: data.get(#combatDetails, or: $value.combatDetails),
      );

  @override
  CombatEquipmentLoadoutResultCopyWith<$R2, CombatEquipmentLoadoutResult, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CombatEquipmentLoadoutResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SkillEquipmentLoadoutResultMapper
    extends SubClassMapperBase<SkillEquipmentLoadoutResult> {
  SkillEquipmentLoadoutResultMapper._();

  static SkillEquipmentLoadoutResultMapper? _instance;
  static SkillEquipmentLoadoutResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SkillEquipmentLoadoutResultMapper._(),
      );
      EquipmentLoadoutResultMapper.ensureInitialized().addSubMapper(_instance!);
      EquipmentLoadoutMapper.ensureInitialized();
      QuantityItemSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SkillEquipmentLoadoutResult';

  static EquipmentLoadout _$loadout(SkillEquipmentLoadoutResult v) => v.loadout;
  static const Field<SkillEquipmentLoadoutResult, EquipmentLoadout> _f$loadout =
      Field('loadout', _$loadout);
  static List<QuantityItemSchema> _$itemsToUse(SkillEquipmentLoadoutResult v) =>
      v.itemsToUse;
  static const Field<SkillEquipmentLoadoutResult, List<QuantityItemSchema>>
  _f$itemsToUse = Field('itemsToUse', _$itemsToUse);

  @override
  final MappableFields<SkillEquipmentLoadoutResult> fields = const {
    #loadout: _f$loadout,
    #itemsToUse: _f$itemsToUse,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SkillEquipmentLoadoutResult';
  @override
  late final ClassMapperBase superMapper =
      EquipmentLoadoutResultMapper.ensureInitialized();

  static SkillEquipmentLoadoutResult _instantiate(DecodingData data) {
    return SkillEquipmentLoadoutResult(
      loadout: data.dec(_f$loadout),
      itemsToUse: data.dec(_f$itemsToUse),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SkillEquipmentLoadoutResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SkillEquipmentLoadoutResult>(map);
  }

  static SkillEquipmentLoadoutResult fromJson(String json) {
    return ensureInitialized().decodeJson<SkillEquipmentLoadoutResult>(json);
  }
}

mixin SkillEquipmentLoadoutResultMappable {
  String toJson() {
    return SkillEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeJson<SkillEquipmentLoadoutResult>(
          this as SkillEquipmentLoadoutResult,
        );
  }

  Map<String, dynamic> toMap() {
    return SkillEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeMap<SkillEquipmentLoadoutResult>(
          this as SkillEquipmentLoadoutResult,
        );
  }

  SkillEquipmentLoadoutResultCopyWith<
    SkillEquipmentLoadoutResult,
    SkillEquipmentLoadoutResult,
    SkillEquipmentLoadoutResult
  >
  get copyWith => _SkillEquipmentLoadoutResultCopyWithImpl<
    SkillEquipmentLoadoutResult,
    SkillEquipmentLoadoutResult
  >(this as SkillEquipmentLoadoutResult, $identity, $identity);
  @override
  String toString() {
    return SkillEquipmentLoadoutResultMapper.ensureInitialized().stringifyValue(
      this as SkillEquipmentLoadoutResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return SkillEquipmentLoadoutResultMapper.ensureInitialized().equalsValue(
      this as SkillEquipmentLoadoutResult,
      other,
    );
  }

  @override
  int get hashCode {
    return SkillEquipmentLoadoutResultMapper.ensureInitialized().hashValue(
      this as SkillEquipmentLoadoutResult,
    );
  }
}

extension SkillEquipmentLoadoutResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SkillEquipmentLoadoutResult, $Out> {
  SkillEquipmentLoadoutResultCopyWith<$R, SkillEquipmentLoadoutResult, $Out>
  get $asSkillEquipmentLoadoutResult => $base.as(
    (v, t, t2) => _SkillEquipmentLoadoutResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SkillEquipmentLoadoutResultCopyWith<
  $R,
  $In extends SkillEquipmentLoadoutResult,
  $Out
>
    implements EquipmentLoadoutResultCopyWith<$R, $In, $Out> {
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout> get loadout;
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse;
  @override
  $R call({EquipmentLoadout? loadout, List<QuantityItemSchema>? itemsToUse});
  SkillEquipmentLoadoutResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SkillEquipmentLoadoutResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SkillEquipmentLoadoutResult, $Out>
    implements
        SkillEquipmentLoadoutResultCopyWith<
          $R,
          SkillEquipmentLoadoutResult,
          $Out
        > {
  _SkillEquipmentLoadoutResultCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<SkillEquipmentLoadoutResult> $mapper =
      SkillEquipmentLoadoutResultMapper.ensureInitialized();
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout>
  get loadout => $value.loadout.copyWith.$chain((v) => call(loadout: v));
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse => ListCopyWith(
    $value.itemsToUse,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(itemsToUse: v),
  );
  @override
  $R call({EquipmentLoadout? loadout, List<QuantityItemSchema>? itemsToUse}) =>
      $apply(
        FieldCopyWithData({
          if (loadout != null) #loadout: loadout,
          if (itemsToUse != null) #itemsToUse: itemsToUse,
        }),
      );
  @override
  SkillEquipmentLoadoutResult $make(CopyWithData data) =>
      SkillEquipmentLoadoutResult(
        loadout: data.get(#loadout, or: $value.loadout),
        itemsToUse: data.get(#itemsToUse, or: $value.itemsToUse),
      );

  @override
  SkillEquipmentLoadoutResultCopyWith<$R2, SkillEquipmentLoadoutResult, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SkillEquipmentLoadoutResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class HealEquipmentLoadoutResultMapper
    extends SubClassMapperBase<HealEquipmentLoadoutResult> {
  HealEquipmentLoadoutResultMapper._();

  static HealEquipmentLoadoutResultMapper? _instance;
  static HealEquipmentLoadoutResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = HealEquipmentLoadoutResultMapper._(),
      );
      EquipmentLoadoutResultMapper.ensureInitialized().addSubMapper(_instance!);
      EquipmentLoadoutMapper.ensureInitialized();
      QuantityItemSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HealEquipmentLoadoutResult';

  static EquipmentLoadout _$loadout(HealEquipmentLoadoutResult v) => v.loadout;
  static const Field<HealEquipmentLoadoutResult, EquipmentLoadout> _f$loadout =
      Field('loadout', _$loadout);
  static List<QuantityItemSchema> _$itemsToUse(HealEquipmentLoadoutResult v) =>
      v.itemsToUse;
  static const Field<HealEquipmentLoadoutResult, List<QuantityItemSchema>>
  _f$itemsToUse = Field('itemsToUse', _$itemsToUse);

  @override
  final MappableFields<HealEquipmentLoadoutResult> fields = const {
    #loadout: _f$loadout,
    #itemsToUse: _f$itemsToUse,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'HealEquipmentLoadoutResult';
  @override
  late final ClassMapperBase superMapper =
      EquipmentLoadoutResultMapper.ensureInitialized();

  static HealEquipmentLoadoutResult _instantiate(DecodingData data) {
    return HealEquipmentLoadoutResult(
      loadout: data.dec(_f$loadout),
      itemsToUse: data.dec(_f$itemsToUse),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HealEquipmentLoadoutResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HealEquipmentLoadoutResult>(map);
  }

  static HealEquipmentLoadoutResult fromJson(String json) {
    return ensureInitialized().decodeJson<HealEquipmentLoadoutResult>(json);
  }
}

mixin HealEquipmentLoadoutResultMappable {
  String toJson() {
    return HealEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeJson<HealEquipmentLoadoutResult>(
          this as HealEquipmentLoadoutResult,
        );
  }

  Map<String, dynamic> toMap() {
    return HealEquipmentLoadoutResultMapper.ensureInitialized()
        .encodeMap<HealEquipmentLoadoutResult>(
          this as HealEquipmentLoadoutResult,
        );
  }

  HealEquipmentLoadoutResultCopyWith<
    HealEquipmentLoadoutResult,
    HealEquipmentLoadoutResult,
    HealEquipmentLoadoutResult
  >
  get copyWith => _HealEquipmentLoadoutResultCopyWithImpl<
    HealEquipmentLoadoutResult,
    HealEquipmentLoadoutResult
  >(this as HealEquipmentLoadoutResult, $identity, $identity);
  @override
  String toString() {
    return HealEquipmentLoadoutResultMapper.ensureInitialized().stringifyValue(
      this as HealEquipmentLoadoutResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return HealEquipmentLoadoutResultMapper.ensureInitialized().equalsValue(
      this as HealEquipmentLoadoutResult,
      other,
    );
  }

  @override
  int get hashCode {
    return HealEquipmentLoadoutResultMapper.ensureInitialized().hashValue(
      this as HealEquipmentLoadoutResult,
    );
  }
}

extension HealEquipmentLoadoutResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HealEquipmentLoadoutResult, $Out> {
  HealEquipmentLoadoutResultCopyWith<$R, HealEquipmentLoadoutResult, $Out>
  get $asHealEquipmentLoadoutResult => $base.as(
    (v, t, t2) => _HealEquipmentLoadoutResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class HealEquipmentLoadoutResultCopyWith<
  $R,
  $In extends HealEquipmentLoadoutResult,
  $Out
>
    implements EquipmentLoadoutResultCopyWith<$R, $In, $Out> {
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout> get loadout;
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse;
  @override
  $R call({EquipmentLoadout? loadout, List<QuantityItemSchema>? itemsToUse});
  HealEquipmentLoadoutResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _HealEquipmentLoadoutResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HealEquipmentLoadoutResult, $Out>
    implements
        HealEquipmentLoadoutResultCopyWith<
          $R,
          HealEquipmentLoadoutResult,
          $Out
        > {
  _HealEquipmentLoadoutResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HealEquipmentLoadoutResult> $mapper =
      HealEquipmentLoadoutResultMapper.ensureInitialized();
  @override
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, EquipmentLoadout>
  get loadout => $value.loadout.copyWith.$chain((v) => call(loadout: v));
  @override
  ListCopyWith<
    $R,
    QuantityItemSchema,
    QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>
  >
  get itemsToUse => ListCopyWith(
    $value.itemsToUse,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(itemsToUse: v),
  );
  @override
  $R call({EquipmentLoadout? loadout, List<QuantityItemSchema>? itemsToUse}) =>
      $apply(
        FieldCopyWithData({
          if (loadout != null) #loadout: loadout,
          if (itemsToUse != null) #itemsToUse: itemsToUse,
        }),
      );
  @override
  HealEquipmentLoadoutResult $make(CopyWithData data) =>
      HealEquipmentLoadoutResult(
        loadout: data.get(#loadout, or: $value.loadout),
        itemsToUse: data.get(#itemsToUse, or: $value.itemsToUse),
      );

  @override
  HealEquipmentLoadoutResultCopyWith<$R2, HealEquipmentLoadoutResult, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _HealEquipmentLoadoutResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

