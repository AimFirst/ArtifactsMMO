// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'combat_details.dart';

class CombatDetailsMapper extends ClassMapperBase<CombatDetails> {
  CombatDetailsMapper._();

  static CombatDetailsMapper? _instance;
  static CombatDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CombatDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CombatDetails';

  static double _$playerAvgDPT(CombatDetails v) => v.playerAvgDPT;
  static const Field<CombatDetails, double> _f$playerAvgDPT = Field(
    'playerAvgDPT',
    _$playerAvgDPT,
  );
  static double _$monsterAvgDPT(CombatDetails v) => v.monsterAvgDPT;
  static const Field<CombatDetails, double> _f$monsterAvgDPT = Field(
    'monsterAvgDPT',
    _$monsterAvgDPT,
  );
  static int _$playerStartHp(CombatDetails v) => v.playerStartHp;
  static const Field<CombatDetails, int> _f$playerStartHp = Field(
    'playerStartHp',
    _$playerStartHp,
  );
  static int _$monsterStartHp(CombatDetails v) => v.monsterStartHp;
  static const Field<CombatDetails, int> _f$monsterStartHp = Field(
    'monsterStartHp',
    _$monsterStartHp,
  );
  static int _$haste(CombatDetails v) => v.haste;
  static const Field<CombatDetails, int> _f$haste = Field('haste', _$haste);
  static int _$turnsForPlayerToWin(CombatDetails v) => v.turnsForPlayerToWin;
  static const Field<CombatDetails, int> _f$turnsForPlayerToWin = Field(
    'turnsForPlayerToWin',
    _$turnsForPlayerToWin,
    mode: FieldMode.member,
  );
  static int _$turnsForMonsterToWin(CombatDetails v) => v.turnsForMonsterToWin;
  static const Field<CombatDetails, int> _f$turnsForMonsterToWin = Field(
    'turnsForMonsterToWin',
    _$turnsForMonsterToWin,
    mode: FieldMode.member,
  );
  static int _$totalTurns(CombatDetails v) => v.totalTurns;
  static const Field<CombatDetails, int> _f$totalTurns = Field(
    'totalTurns',
    _$totalTurns,
    mode: FieldMode.member,
  );
  static bool _$canWin(CombatDetails v) => v.canWin;
  static const Field<CombatDetails, bool> _f$canWin = Field(
    'canWin',
    _$canWin,
    mode: FieldMode.member,
  );
  static double _$fightCooldown(CombatDetails v) => v.fightCooldown;
  static const Field<CombatDetails, double> _f$fightCooldown = Field(
    'fightCooldown',
    _$fightCooldown,
    mode: FieldMode.member,
  );
  static double _$restToHealCooldown(CombatDetails v) => v.restToHealCooldown;
  static const Field<CombatDetails, double> _f$restToHealCooldown = Field(
    'restToHealCooldown',
    _$restToHealCooldown,
    mode: FieldMode.member,
  );
  static double _$totalCooldown(CombatDetails v) => v.totalCooldown;
  static const Field<CombatDetails, double> _f$totalCooldown = Field(
    'totalCooldown',
    _$totalCooldown,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<CombatDetails> fields = const {
    #playerAvgDPT: _f$playerAvgDPT,
    #monsterAvgDPT: _f$monsterAvgDPT,
    #playerStartHp: _f$playerStartHp,
    #monsterStartHp: _f$monsterStartHp,
    #haste: _f$haste,
    #turnsForPlayerToWin: _f$turnsForPlayerToWin,
    #turnsForMonsterToWin: _f$turnsForMonsterToWin,
    #totalTurns: _f$totalTurns,
    #canWin: _f$canWin,
    #fightCooldown: _f$fightCooldown,
    #restToHealCooldown: _f$restToHealCooldown,
    #totalCooldown: _f$totalCooldown,
  };

  static CombatDetails _instantiate(DecodingData data) {
    return CombatDetails(
      playerAvgDPT: data.dec(_f$playerAvgDPT),
      monsterAvgDPT: data.dec(_f$monsterAvgDPT),
      playerStartHp: data.dec(_f$playerStartHp),
      monsterStartHp: data.dec(_f$monsterStartHp),
      haste: data.dec(_f$haste),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CombatDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CombatDetails>(map);
  }

  static CombatDetails fromJson(String json) {
    return ensureInitialized().decodeJson<CombatDetails>(json);
  }
}

mixin CombatDetailsMappable {
  String toJson() {
    return CombatDetailsMapper.ensureInitialized().encodeJson<CombatDetails>(
      this as CombatDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return CombatDetailsMapper.ensureInitialized().encodeMap<CombatDetails>(
      this as CombatDetails,
    );
  }

  CombatDetailsCopyWith<CombatDetails, CombatDetails, CombatDetails>
  get copyWith => _CombatDetailsCopyWithImpl<CombatDetails, CombatDetails>(
    this as CombatDetails,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CombatDetailsMapper.ensureInitialized().stringifyValue(
      this as CombatDetails,
    );
  }

  @override
  bool operator ==(Object other) {
    return CombatDetailsMapper.ensureInitialized().equalsValue(
      this as CombatDetails,
      other,
    );
  }

  @override
  int get hashCode {
    return CombatDetailsMapper.ensureInitialized().hashValue(
      this as CombatDetails,
    );
  }
}

extension CombatDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CombatDetails, $Out> {
  CombatDetailsCopyWith<$R, CombatDetails, $Out> get $asCombatDetails =>
      $base.as((v, t, t2) => _CombatDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CombatDetailsCopyWith<$R, $In extends CombatDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    double? playerAvgDPT,
    double? monsterAvgDPT,
    int? playerStartHp,
    int? monsterStartHp,
    int? haste,
  });
  CombatDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CombatDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CombatDetails, $Out>
    implements CombatDetailsCopyWith<$R, CombatDetails, $Out> {
  _CombatDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CombatDetails> $mapper =
      CombatDetailsMapper.ensureInitialized();
  @override
  $R call({
    double? playerAvgDPT,
    double? monsterAvgDPT,
    int? playerStartHp,
    int? monsterStartHp,
    int? haste,
  }) => $apply(
    FieldCopyWithData({
      if (playerAvgDPT != null) #playerAvgDPT: playerAvgDPT,
      if (monsterAvgDPT != null) #monsterAvgDPT: monsterAvgDPT,
      if (playerStartHp != null) #playerStartHp: playerStartHp,
      if (monsterStartHp != null) #monsterStartHp: monsterStartHp,
      if (haste != null) #haste: haste,
    }),
  );
  @override
  CombatDetails $make(CopyWithData data) => CombatDetails(
    playerAvgDPT: data.get(#playerAvgDPT, or: $value.playerAvgDPT),
    monsterAvgDPT: data.get(#monsterAvgDPT, or: $value.monsterAvgDPT),
    playerStartHp: data.get(#playerStartHp, or: $value.playerStartHp),
    monsterStartHp: data.get(#monsterStartHp, or: $value.monsterStartHp),
    haste: data.get(#haste, or: $value.haste),
  );

  @override
  CombatDetailsCopyWith<$R2, CombatDetails, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CombatDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

