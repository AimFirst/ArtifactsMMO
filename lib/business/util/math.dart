import 'dart:math';

import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';

class MathUtil {
  static double average(num first, num second) {
    return ((second - first) / 2) + first;
  }

  static double distance(Location first, Location second) {
    return sqrt(pow(second.x - first.x, 2) + pow(second.y - first.y, 2));
  }

  static int sortDistance(Location first, Location second) {
    double pointDistance = distance(first, second);
    return pointDistance < 0 ? -1 : pointDistance > 0 ? 1 : 0;
  }

  static int doubleToCompare(double compareValue) {
    return compareValue < 0 ? -1 : compareValue > 0 ? 1 : 0;
  }

  static int sortDistanceReversed(Location first, Location second) => sortDistance(second, first);
}