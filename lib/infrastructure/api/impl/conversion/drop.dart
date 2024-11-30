import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/drop/drop.dart';

extension DropConversion on DropRateSchema {
  DropRate convert() {
    return DropRate(
      code: code,
      rate: rate,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
    );
  }
}
