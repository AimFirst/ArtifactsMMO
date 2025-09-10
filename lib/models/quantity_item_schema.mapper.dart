// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quantity_item_schema.dart';

class QuantityItemSchemaMapper extends ClassMapperBase<QuantityItemSchema> {
  QuantityItemSchemaMapper._();

  static QuantityItemSchemaMapper? _instance;
  static QuantityItemSchemaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuantityItemSchemaMapper._());
      MapperContainer.globals.useAll([ItemSchemaMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'QuantityItemSchema';

  static ItemSchema _$item(QuantityItemSchema v) => v.item;
  static const Field<QuantityItemSchema, ItemSchema> _f$item = Field(
    'item',
    _$item,
  );
  static int _$quantity(QuantityItemSchema v) => v.quantity;
  static const Field<QuantityItemSchema, int> _f$quantity = Field(
    'quantity',
    _$quantity,
  );

  @override
  final MappableFields<QuantityItemSchema> fields = const {
    #item: _f$item,
    #quantity: _f$quantity,
  };

  static QuantityItemSchema _instantiate(DecodingData data) {
    return QuantityItemSchema(data.dec(_f$item), data.dec(_f$quantity));
  }

  @override
  final Function instantiate = _instantiate;

  static QuantityItemSchema fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuantityItemSchema>(map);
  }

  static QuantityItemSchema fromJson(String json) {
    return ensureInitialized().decodeJson<QuantityItemSchema>(json);
  }
}

mixin QuantityItemSchemaMappable {
  String toJson() {
    return QuantityItemSchemaMapper.ensureInitialized()
        .encodeJson<QuantityItemSchema>(this as QuantityItemSchema);
  }

  Map<String, dynamic> toMap() {
    return QuantityItemSchemaMapper.ensureInitialized()
        .encodeMap<QuantityItemSchema>(this as QuantityItemSchema);
  }

  QuantityItemSchemaCopyWith<
    QuantityItemSchema,
    QuantityItemSchema,
    QuantityItemSchema
  >
  get copyWith =>
      _QuantityItemSchemaCopyWithImpl<QuantityItemSchema, QuantityItemSchema>(
        this as QuantityItemSchema,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return QuantityItemSchemaMapper.ensureInitialized().stringifyValue(
      this as QuantityItemSchema,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuantityItemSchemaMapper.ensureInitialized().equalsValue(
      this as QuantityItemSchema,
      other,
    );
  }

  @override
  int get hashCode {
    return QuantityItemSchemaMapper.ensureInitialized().hashValue(
      this as QuantityItemSchema,
    );
  }
}

extension QuantityItemSchemaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuantityItemSchema, $Out> {
  QuantityItemSchemaCopyWith<$R, QuantityItemSchema, $Out>
  get $asQuantityItemSchema => $base.as(
    (v, t, t2) => _QuantityItemSchemaCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class QuantityItemSchemaCopyWith<
  $R,
  $In extends QuantityItemSchema,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({ItemSchema? item, int? quantity});
  QuantityItemSchemaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuantityItemSchemaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuantityItemSchema, $Out>
    implements QuantityItemSchemaCopyWith<$R, QuantityItemSchema, $Out> {
  _QuantityItemSchemaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuantityItemSchema> $mapper =
      QuantityItemSchemaMapper.ensureInitialized();
  @override
  $R call({ItemSchema? item, int? quantity}) => $apply(
    FieldCopyWithData({
      if (item != null) #item: item,
      if (quantity != null) #quantity: quantity,
    }),
  );
  @override
  QuantityItemSchema $make(CopyWithData data) => QuantityItemSchema(
    data.get(#item, or: $value.item),
    data.get(#quantity, or: $value.quantity),
  );

  @override
  QuantityItemSchemaCopyWith<$R2, QuantityItemSchema, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuantityItemSchemaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

