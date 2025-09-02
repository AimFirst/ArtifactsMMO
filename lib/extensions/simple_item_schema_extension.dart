import 'package:artifacts_api/artifacts_api.dart';

extension SimpleItemSchemaExtension on SimpleItemSchemaBuilder {
  SimpleItemSchema fromCodeAndQuantity(String code, int quantity) {
    this.code = code;
    this.quantity = quantity;
    return build();
  }
}