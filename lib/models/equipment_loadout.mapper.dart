// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'equipment_loadout.dart';

class EquipmentLoadoutMapper extends ClassMapperBase<EquipmentLoadout> {
  EquipmentLoadoutMapper._();

  static EquipmentLoadoutMapper? _instance;
  static EquipmentLoadoutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EquipmentLoadoutMapper._());
      MapperContainer.globals.useAll([ItemSchemaMapper()]);
      QuantityItemSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EquipmentLoadout';

  static ItemSchema? _$weapon(EquipmentLoadout v) => v.weapon;
  static const Field<EquipmentLoadout, ItemSchema> _f$weapon = Field(
    'weapon',
    _$weapon,
    opt: true,
  );
  static ItemSchema? _$helmet(EquipmentLoadout v) => v.helmet;
  static const Field<EquipmentLoadout, ItemSchema> _f$helmet = Field(
    'helmet',
    _$helmet,
    opt: true,
  );
  static ItemSchema? _$shield(EquipmentLoadout v) => v.shield;
  static const Field<EquipmentLoadout, ItemSchema> _f$shield = Field(
    'shield',
    _$shield,
    opt: true,
  );
  static ItemSchema? _$bodyArmor(EquipmentLoadout v) => v.bodyArmor;
  static const Field<EquipmentLoadout, ItemSchema> _f$bodyArmor = Field(
    'bodyArmor',
    _$bodyArmor,
    opt: true,
  );
  static ItemSchema? _$legArmor(EquipmentLoadout v) => v.legArmor;
  static const Field<EquipmentLoadout, ItemSchema> _f$legArmor = Field(
    'legArmor',
    _$legArmor,
    opt: true,
  );
  static ItemSchema? _$boots(EquipmentLoadout v) => v.boots;
  static const Field<EquipmentLoadout, ItemSchema> _f$boots = Field(
    'boots',
    _$boots,
    opt: true,
  );
  static ItemSchema? _$amulet(EquipmentLoadout v) => v.amulet;
  static const Field<EquipmentLoadout, ItemSchema> _f$amulet = Field(
    'amulet',
    _$amulet,
    opt: true,
  );
  static ItemSchema? _$ring1(EquipmentLoadout v) => v.ring1;
  static const Field<EquipmentLoadout, ItemSchema> _f$ring1 = Field(
    'ring1',
    _$ring1,
    opt: true,
  );
  static ItemSchema? _$ring2(EquipmentLoadout v) => v.ring2;
  static const Field<EquipmentLoadout, ItemSchema> _f$ring2 = Field(
    'ring2',
    _$ring2,
    opt: true,
  );
  static QuantityItemSchema? _$utility1(EquipmentLoadout v) => v.utility1;
  static const Field<EquipmentLoadout, QuantityItemSchema> _f$utility1 = Field(
    'utility1',
    _$utility1,
    opt: true,
  );
  static QuantityItemSchema? _$utility2(EquipmentLoadout v) => v.utility2;
  static const Field<EquipmentLoadout, QuantityItemSchema> _f$utility2 = Field(
    'utility2',
    _$utility2,
    opt: true,
  );
  static ItemSchema? _$artifact1(EquipmentLoadout v) => v.artifact1;
  static const Field<EquipmentLoadout, ItemSchema> _f$artifact1 = Field(
    'artifact1',
    _$artifact1,
    opt: true,
  );
  static ItemSchema? _$artifact2(EquipmentLoadout v) => v.artifact2;
  static const Field<EquipmentLoadout, ItemSchema> _f$artifact2 = Field(
    'artifact2',
    _$artifact2,
    opt: true,
  );
  static ItemSchema? _$artifact3(EquipmentLoadout v) => v.artifact3;
  static const Field<EquipmentLoadout, ItemSchema> _f$artifact3 = Field(
    'artifact3',
    _$artifact3,
    opt: true,
  );
  static ItemSchema? _$rune(EquipmentLoadout v) => v.rune;
  static const Field<EquipmentLoadout, ItemSchema> _f$rune = Field(
    'rune',
    _$rune,
    opt: true,
  );
  static ItemSchema? _$bag(EquipmentLoadout v) => v.bag;
  static const Field<EquipmentLoadout, ItemSchema> _f$bag = Field(
    'bag',
    _$bag,
    opt: true,
  );
  static Map<ItemSlot, QuantityItemSchema?> _$itemsBySlot(EquipmentLoadout v) =>
      v.itemsBySlot;
  static const Field<EquipmentLoadout, Map<ItemSlot, QuantityItemSchema?>>
  _f$itemsBySlot = Field('itemsBySlot', _$itemsBySlot, mode: FieldMode.member);
  static List<QuantityItemSchema?> _$items(EquipmentLoadout v) => v.items;
  static const Field<EquipmentLoadout, List<QuantityItemSchema?>> _f$items =
      Field('items', _$items, mode: FieldMode.member);

  @override
  final MappableFields<EquipmentLoadout> fields = const {
    #weapon: _f$weapon,
    #helmet: _f$helmet,
    #shield: _f$shield,
    #bodyArmor: _f$bodyArmor,
    #legArmor: _f$legArmor,
    #boots: _f$boots,
    #amulet: _f$amulet,
    #ring1: _f$ring1,
    #ring2: _f$ring2,
    #utility1: _f$utility1,
    #utility2: _f$utility2,
    #artifact1: _f$artifact1,
    #artifact2: _f$artifact2,
    #artifact3: _f$artifact3,
    #rune: _f$rune,
    #bag: _f$bag,
    #itemsBySlot: _f$itemsBySlot,
    #items: _f$items,
  };

  static EquipmentLoadout _instantiate(DecodingData data) {
    return EquipmentLoadout(
      weapon: data.dec(_f$weapon),
      helmet: data.dec(_f$helmet),
      shield: data.dec(_f$shield),
      bodyArmor: data.dec(_f$bodyArmor),
      legArmor: data.dec(_f$legArmor),
      boots: data.dec(_f$boots),
      amulet: data.dec(_f$amulet),
      ring1: data.dec(_f$ring1),
      ring2: data.dec(_f$ring2),
      utility1: data.dec(_f$utility1),
      utility2: data.dec(_f$utility2),
      artifact1: data.dec(_f$artifact1),
      artifact2: data.dec(_f$artifact2),
      artifact3: data.dec(_f$artifact3),
      rune: data.dec(_f$rune),
      bag: data.dec(_f$bag),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EquipmentLoadout fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EquipmentLoadout>(map);
  }

  static EquipmentLoadout fromJson(String json) {
    return ensureInitialized().decodeJson<EquipmentLoadout>(json);
  }
}

mixin EquipmentLoadoutMappable {
  String toJson() {
    return EquipmentLoadoutMapper.ensureInitialized()
        .encodeJson<EquipmentLoadout>(this as EquipmentLoadout);
  }

  Map<String, dynamic> toMap() {
    return EquipmentLoadoutMapper.ensureInitialized()
        .encodeMap<EquipmentLoadout>(this as EquipmentLoadout);
  }

  EquipmentLoadoutCopyWith<EquipmentLoadout, EquipmentLoadout, EquipmentLoadout>
  get copyWith =>
      _EquipmentLoadoutCopyWithImpl<EquipmentLoadout, EquipmentLoadout>(
        this as EquipmentLoadout,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return EquipmentLoadoutMapper.ensureInitialized().stringifyValue(
      this as EquipmentLoadout,
    );
  }

  @override
  bool operator ==(Object other) {
    return EquipmentLoadoutMapper.ensureInitialized().equalsValue(
      this as EquipmentLoadout,
      other,
    );
  }

  @override
  int get hashCode {
    return EquipmentLoadoutMapper.ensureInitialized().hashValue(
      this as EquipmentLoadout,
    );
  }
}

extension EquipmentLoadoutValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EquipmentLoadout, $Out> {
  EquipmentLoadoutCopyWith<$R, EquipmentLoadout, $Out>
  get $asEquipmentLoadout =>
      $base.as((v, t, t2) => _EquipmentLoadoutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EquipmentLoadoutCopyWith<$R, $In extends EquipmentLoadout, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>?
  get utility1;
  QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>?
  get utility2;
  $R call({
    ItemSchema? weapon,
    ItemSchema? helmet,
    ItemSchema? shield,
    ItemSchema? bodyArmor,
    ItemSchema? legArmor,
    ItemSchema? boots,
    ItemSchema? amulet,
    ItemSchema? ring1,
    ItemSchema? ring2,
    QuantityItemSchema? utility1,
    QuantityItemSchema? utility2,
    ItemSchema? artifact1,
    ItemSchema? artifact2,
    ItemSchema? artifact3,
    ItemSchema? rune,
    ItemSchema? bag,
  });
  EquipmentLoadoutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _EquipmentLoadoutCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EquipmentLoadout, $Out>
    implements EquipmentLoadoutCopyWith<$R, EquipmentLoadout, $Out> {
  _EquipmentLoadoutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EquipmentLoadout> $mapper =
      EquipmentLoadoutMapper.ensureInitialized();
  @override
  QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>?
  get utility1 => $value.utility1?.copyWith.$chain((v) => call(utility1: v));
  @override
  QuantityItemSchemaCopyWith<$R, QuantityItemSchema, QuantityItemSchema>?
  get utility2 => $value.utility2?.copyWith.$chain((v) => call(utility2: v));
  @override
  $R call({
    Object? weapon = $none,
    Object? helmet = $none,
    Object? shield = $none,
    Object? bodyArmor = $none,
    Object? legArmor = $none,
    Object? boots = $none,
    Object? amulet = $none,
    Object? ring1 = $none,
    Object? ring2 = $none,
    Object? utility1 = $none,
    Object? utility2 = $none,
    Object? artifact1 = $none,
    Object? artifact2 = $none,
    Object? artifact3 = $none,
    Object? rune = $none,
    Object? bag = $none,
  }) => $apply(
    FieldCopyWithData({
      if (weapon != $none) #weapon: weapon,
      if (helmet != $none) #helmet: helmet,
      if (shield != $none) #shield: shield,
      if (bodyArmor != $none) #bodyArmor: bodyArmor,
      if (legArmor != $none) #legArmor: legArmor,
      if (boots != $none) #boots: boots,
      if (amulet != $none) #amulet: amulet,
      if (ring1 != $none) #ring1: ring1,
      if (ring2 != $none) #ring2: ring2,
      if (utility1 != $none) #utility1: utility1,
      if (utility2 != $none) #utility2: utility2,
      if (artifact1 != $none) #artifact1: artifact1,
      if (artifact2 != $none) #artifact2: artifact2,
      if (artifact3 != $none) #artifact3: artifact3,
      if (rune != $none) #rune: rune,
      if (bag != $none) #bag: bag,
    }),
  );
  @override
  EquipmentLoadout $make(CopyWithData data) => EquipmentLoadout(
    weapon: data.get(#weapon, or: $value.weapon),
    helmet: data.get(#helmet, or: $value.helmet),
    shield: data.get(#shield, or: $value.shield),
    bodyArmor: data.get(#bodyArmor, or: $value.bodyArmor),
    legArmor: data.get(#legArmor, or: $value.legArmor),
    boots: data.get(#boots, or: $value.boots),
    amulet: data.get(#amulet, or: $value.amulet),
    ring1: data.get(#ring1, or: $value.ring1),
    ring2: data.get(#ring2, or: $value.ring2),
    utility1: data.get(#utility1, or: $value.utility1),
    utility2: data.get(#utility2, or: $value.utility2),
    artifact1: data.get(#artifact1, or: $value.artifact1),
    artifact2: data.get(#artifact2, or: $value.artifact2),
    artifact3: data.get(#artifact3, or: $value.artifact3),
    rune: data.get(#rune, or: $value.rune),
    bag: data.get(#bag, or: $value.bag),
  );

  @override
  EquipmentLoadoutCopyWith<$R2, EquipmentLoadout, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EquipmentLoadoutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

