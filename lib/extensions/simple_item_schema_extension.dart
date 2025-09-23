import 'package:artifacts_api/artifacts_api.dart';

extension SimpleItemSchemaBuilderExtension on SimpleItemSchemaBuilder {
  SimpleItemSchema fromCodeAndQuantity(String code, int quantity) {
    this.code = code;
    this.quantity = quantity;
    return build();
  }
}

extension SimpleItemSchemaExtension on SimpleItemSchema {
  String get simpleName => '${code} x${quantity}';
}
