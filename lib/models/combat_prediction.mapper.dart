// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'combat_prediction.dart';

class CombatPredictionMapper extends ClassMapperBase<CombatPrediction> {
  CombatPredictionMapper._();

  static CombatPredictionMapper? _instance;
  static CombatPredictionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CombatPredictionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CombatPrediction';

  static double _$winPercentage(CombatPrediction v) => v.winPercentage;
  static const Field<CombatPrediction, double> _f$winPercentage = Field(
    'winPercentage',
    _$winPercentage,
  );
  static double _$averageTurnsToWin(CombatPrediction v) => v.averageTurnsToWin;
  static const Field<CombatPrediction, double> _f$averageTurnsToWin = Field(
    'averageTurnsToWin',
    _$averageTurnsToWin,
  );
  static double _$averageHpRemaining(CombatPrediction v) =>
      v.averageHpRemaining;
  static const Field<CombatPrediction, double> _f$averageHpRemaining = Field(
    'averageHpRemaining',
    _$averageHpRemaining,
  );
  static int _$haste(CombatPrediction v) => v.haste;
  static const Field<CombatPrediction, int> _f$haste = Field('haste', _$haste);
  static int _$startHp(CombatPrediction v) => v.startHp;
  static const Field<CombatPrediction, int> _f$startHp = Field(
    'startHp',
    _$startHp,
  );
  static bool _$canWin(CombatPrediction v) => v.canWin;
  static const Field<CombatPrediction, bool> _f$canWin = Field(
    'canWin',
    _$canWin,
    mode: FieldMode.member,
  );
  static double _$fightCooldown(CombatPrediction v) => v.fightCooldown;
  static const Field<CombatPrediction, double> _f$fightCooldown = Field(
    'fightCooldown',
    _$fightCooldown,
    mode: FieldMode.member,
  );
  static double _$restToHealCooldown(CombatPrediction v) =>
      v.restToHealCooldown;
  static const Field<CombatPrediction, double> _f$restToHealCooldown = Field(
    'restToHealCooldown',
    _$restToHealCooldown,
    mode: FieldMode.member,
  );
  static double _$totalCooldown(CombatPrediction v) => v.totalCooldown;
  static const Field<CombatPrediction, double> _f$totalCooldown = Field(
    'totalCooldown',
    _$totalCooldown,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<CombatPrediction> fields = const {
    #winPercentage: _f$winPercentage,
    #averageTurnsToWin: _f$averageTurnsToWin,
    #averageHpRemaining: _f$averageHpRemaining,
    #haste: _f$haste,
    #startHp: _f$startHp,
    #canWin: _f$canWin,
    #fightCooldown: _f$fightCooldown,
    #restToHealCooldown: _f$restToHealCooldown,
    #totalCooldown: _f$totalCooldown,
  };

  static CombatPrediction _instantiate(DecodingData data) {
    return CombatPrediction(
      winPercentage: data.dec(_f$winPercentage),
      averageTurnsToWin: data.dec(_f$averageTurnsToWin),
      averageHpRemaining: data.dec(_f$averageHpRemaining),
      haste: data.dec(_f$haste),
      startHp: data.dec(_f$startHp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CombatPrediction fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CombatPrediction>(map);
  }

  static CombatPrediction fromJson(String json) {
    return ensureInitialized().decodeJson<CombatPrediction>(json);
  }
}

mixin CombatPredictionMappable {
  String toJson() {
    return CombatPredictionMapper.ensureInitialized()
        .encodeJson<CombatPrediction>(this as CombatPrediction);
  }

  Map<String, dynamic> toMap() {
    return CombatPredictionMapper.ensureInitialized()
        .encodeMap<CombatPrediction>(this as CombatPrediction);
  }

  CombatPredictionCopyWith<CombatPrediction, CombatPrediction, CombatPrediction>
  get copyWith =>
      _CombatPredictionCopyWithImpl<CombatPrediction, CombatPrediction>(
        this as CombatPrediction,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CombatPredictionMapper.ensureInitialized().stringifyValue(
      this as CombatPrediction,
    );
  }

  @override
  bool operator ==(Object other) {
    return CombatPredictionMapper.ensureInitialized().equalsValue(
      this as CombatPrediction,
      other,
    );
  }

  @override
  int get hashCode {
    return CombatPredictionMapper.ensureInitialized().hashValue(
      this as CombatPrediction,
    );
  }
}

extension CombatPredictionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CombatPrediction, $Out> {
  CombatPredictionCopyWith<$R, CombatPrediction, $Out>
  get $asCombatPrediction =>
      $base.as((v, t, t2) => _CombatPredictionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CombatPredictionCopyWith<$R, $In extends CombatPrediction, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    double? winPercentage,
    double? averageTurnsToWin,
    double? averageHpRemaining,
    int? haste,
    int? startHp,
  });
  CombatPredictionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CombatPredictionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CombatPrediction, $Out>
    implements CombatPredictionCopyWith<$R, CombatPrediction, $Out> {
  _CombatPredictionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CombatPrediction> $mapper =
      CombatPredictionMapper.ensureInitialized();
  @override
  $R call({
    double? winPercentage,
    double? averageTurnsToWin,
    double? averageHpRemaining,
    int? haste,
    int? startHp,
  }) => $apply(
    FieldCopyWithData({
      if (winPercentage != null) #winPercentage: winPercentage,
      if (averageTurnsToWin != null) #averageTurnsToWin: averageTurnsToWin,
      if (averageHpRemaining != null) #averageHpRemaining: averageHpRemaining,
      if (haste != null) #haste: haste,
      if (startHp != null) #startHp: startHp,
    }),
  );
  @override
  CombatPrediction $make(CopyWithData data) => CombatPrediction(
    winPercentage: data.get(#winPercentage, or: $value.winPercentage),
    averageTurnsToWin: data.get(
      #averageTurnsToWin,
      or: $value.averageTurnsToWin,
    ),
    averageHpRemaining: data.get(
      #averageHpRemaining,
      or: $value.averageHpRemaining,
    ),
    haste: data.get(#haste, or: $value.haste),
    startHp: data.get(#startHp, or: $value.startHp),
  );

  @override
  CombatPredictionCopyWith<$R2, CombatPrediction, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CombatPredictionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

