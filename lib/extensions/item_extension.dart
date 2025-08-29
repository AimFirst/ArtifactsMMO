import 'package:artifacts_api/artifacts_api.dart';

extension ItemExtension on ItemSchema {
  SimpleItemSchema get simpleItem => (SimpleItemSchemaBuilder()
        ..code = code
        ..quantity = 1)
      .build();
}
