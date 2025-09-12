// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gear_evaluation_context_key.dart';

class GearEvaluationContextKeyMapper
    extends ClassMapperBase<GearEvaluationContextKey> {
  GearEvaluationContextKeyMapper._();

  static GearEvaluationContextKeyMapper? _instance;
  static GearEvaluationContextKeyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = GearEvaluationContextKeyMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'GearEvaluationContextKey';

  static int _$algorithmVersion(GearEvaluationContextKey v) =>
      v.algorithmVersion;
  static const Field<GearEvaluationContextKey, int> _f$algorithmVersion = Field(
    'algorithmVersion',
    _$algorithmVersion,
  );
  static String _$contextType(GearEvaluationContextKey v) => v.contextType;
  static const Field<GearEvaluationContextKey, String> _f$contextType = Field(
    'contextType',
    _$contextType,
  );
  static int _$contextLevel(GearEvaluationContextKey v) => v.contextLevel;
  static const Field<GearEvaluationContextKey, int> _f$contextLevel = Field(
    'contextLevel',
    _$contextLevel,
  );
  static String _$optionsHash(GearEvaluationContextKey v) => v.optionsHash;
  static const Field<GearEvaluationContextKey, String> _f$optionsHash = Field(
    'optionsHash',
    _$optionsHash,
  );
  static String _$contextSubType(GearEvaluationContextKey v) =>
      v.contextSubType;
  static const Field<GearEvaluationContextKey, String> _f$contextSubType =
      Field('contextSubType', _$contextSubType, opt: true);

  @override
  final MappableFields<GearEvaluationContextKey> fields = const {
    #algorithmVersion: _f$algorithmVersion,
    #contextType: _f$contextType,
    #contextLevel: _f$contextLevel,
    #optionsHash: _f$optionsHash,
    #contextSubType: _f$contextSubType,
  };

  static GearEvaluationContextKey _instantiate(DecodingData data) {
    return GearEvaluationContextKey(
      algorithmVersion: data.dec(_f$algorithmVersion),
      contextType: data.dec(_f$contextType),
      contextLevel: data.dec(_f$contextLevel),
      optionsHash: data.dec(_f$optionsHash),
      contextSubType: data.dec(_f$contextSubType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GearEvaluationContextKey fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GearEvaluationContextKey>(map);
  }

  static GearEvaluationContextKey fromJson(String json) {
    return ensureInitialized().decodeJson<GearEvaluationContextKey>(json);
  }
}

mixin GearEvaluationContextKeyMappable {
  String toJson() {
    return GearEvaluationContextKeyMapper.ensureInitialized()
        .encodeJson<GearEvaluationContextKey>(this as GearEvaluationContextKey);
  }

  Map<String, dynamic> toMap() {
    return GearEvaluationContextKeyMapper.ensureInitialized()
        .encodeMap<GearEvaluationContextKey>(this as GearEvaluationContextKey);
  }

  GearEvaluationContextKeyCopyWith<
    GearEvaluationContextKey,
    GearEvaluationContextKey,
    GearEvaluationContextKey
  >
  get copyWith => _GearEvaluationContextKeyCopyWithImpl<
    GearEvaluationContextKey,
    GearEvaluationContextKey
  >(this as GearEvaluationContextKey, $identity, $identity);
  @override
  String toString() {
    return GearEvaluationContextKeyMapper.ensureInitialized().stringifyValue(
      this as GearEvaluationContextKey,
    );
  }

  @override
  bool operator ==(Object other) {
    return GearEvaluationContextKeyMapper.ensureInitialized().equalsValue(
      this as GearEvaluationContextKey,
      other,
    );
  }

  @override
  int get hashCode {
    return GearEvaluationContextKeyMapper.ensureInitialized().hashValue(
      this as GearEvaluationContextKey,
    );
  }
}

extension GearEvaluationContextKeyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GearEvaluationContextKey, $Out> {
  GearEvaluationContextKeyCopyWith<$R, GearEvaluationContextKey, $Out>
  get $asGearEvaluationContextKey => $base.as(
    (v, t, t2) => _GearEvaluationContextKeyCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class GearEvaluationContextKeyCopyWith<
  $R,
  $In extends GearEvaluationContextKey,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? algorithmVersion,
    String? contextType,
    int? contextLevel,
    String? optionsHash,
    String? contextSubType,
  });
  GearEvaluationContextKeyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GearEvaluationContextKeyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GearEvaluationContextKey, $Out>
    implements
        GearEvaluationContextKeyCopyWith<$R, GearEvaluationContextKey, $Out> {
  _GearEvaluationContextKeyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GearEvaluationContextKey> $mapper =
      GearEvaluationContextKeyMapper.ensureInitialized();
  @override
  $R call({
    int? algorithmVersion,
    String? contextType,
    int? contextLevel,
    String? optionsHash,
    Object? contextSubType = $none,
  }) => $apply(
    FieldCopyWithData({
      if (algorithmVersion != null) #algorithmVersion: algorithmVersion,
      if (contextType != null) #contextType: contextType,
      if (contextLevel != null) #contextLevel: contextLevel,
      if (optionsHash != null) #optionsHash: optionsHash,
      if (contextSubType != $none) #contextSubType: contextSubType,
    }),
  );
  @override
  GearEvaluationContextKey $make(CopyWithData data) => GearEvaluationContextKey(
    algorithmVersion: data.get(#algorithmVersion, or: $value.algorithmVersion),
    contextType: data.get(#contextType, or: $value.contextType),
    contextLevel: data.get(#contextLevel, or: $value.contextLevel),
    optionsHash: data.get(#optionsHash, or: $value.optionsHash),
    contextSubType: data.get(#contextSubType, or: $value.contextSubType),
  );

  @override
  GearEvaluationContextKeyCopyWith<$R2, GearEvaluationContextKey, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GearEvaluationContextKeyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

