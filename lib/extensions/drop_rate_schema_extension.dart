import 'package:artifacts_api/artifacts_api.dart';

extension DropRateSchemaExtension on DropRateSchema {
  double get  averageQuantity => (minQuantity + maxQuantity) / 2.0;
}