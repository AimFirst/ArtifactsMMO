import 'package:artifacts_api/artifacts_api.dart';

extension DestinationExtension on DestinationSchemaBuilder {
  void setCoords(int x, int y) {
    this.x = x;
    this.y = y;
  }
}