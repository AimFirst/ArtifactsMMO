import 'package:artifacts_mmo/business/util/fight_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FightCalculator', () {
    late FightCalculator calculator;

    setUp(() {
      calculator = FightCalculator();
    });

    test('predict real values - yellowSlime', () {
      final character = FightingStats(
        hp: 300,
        crit: 0,
        attackFire: 0,
        attackEarth: 16,
        attackWater: 0,
        attackAir: 0,
        dmgFire: 7,
        dmgEarth: 7,
        dmgWater: 12,
        dmgAir: 12,
        resFire: 4,
        resEarth: 4,
        resWater: 4,
        resAir: 4,
      );
      final opponent = FightingStats(
        hp: 70,
        crit: 0,
        attackFire: 0,
        attackEarth: 8,
        attackWater: 0,
        attackAir: 0,
        dmgFire: 0,
        dmgEarth: 0,
        dmgWater: 0,
        dmgAir: 0,
        resFire: 0,
        resEarth: 25,
        resWater: 0,
        resAir: 0,
      );

      final prediction = calculator.predict(
        character: character,
        opponent: opponent,
      );

      expect(prediction.result, FightResult.win);
    });

    test('predict real values - mushmush', () {
      final character = FightingStats(
        hp: 300,
        crit: 0,
        attackFire: 0,
        attackEarth: 16,
        attackWater: 0,
        attackAir: 0,
        dmgFire: 7,
        dmgEarth: 7,
        dmgWater: 12,
        dmgAir: 12,
        resFire: 4,
        resEarth: 4,
        resWater: 4,
        resAir: 4,
      );
      final opponent = FightingStats(
        hp: 350,
        crit: 0,
        attackFire: 16,
        attackEarth: 0,
        attackWater: 16,
        attackAir: 0,
        dmgFire: 0,
        dmgEarth: 0,
        dmgWater: 0,
        dmgAir: 0,
        resFire: 20,
        resEarth: 20,
        resWater: 0,
        resAir: -30,
      );

      final prediction = calculator.predict(
        character: character,
        opponent: opponent,
      );

      expect(prediction.result, FightResult.loss);
    });

    test('predict should return a FightPrediction', () {
      final character = FightingStats(
        hp: 100,
        crit: 10,
        attackFire: 10,
        attackEarth: 5,
        attackWater: 5,
        attackAir: 5,
        dmgFire: 10,
        dmgEarth: 5,
        dmgWater: 5,
        dmgAir: 5,
        resFire: 5,
        resEarth: 5,
        resWater: 5,
        resAir: 5,
      );
      final opponent = FightingStats(
        hp: 100,
        crit: 10,
        attackFire: 10,
        attackEarth: 5,
        attackWater: 5,
        attackAir: 5,
        dmgFire: 10,
        dmgEarth: 5,
        dmgWater: 5,
        dmgAir: 5,
        resFire: 5,
        resEarth: 5,
        resWater: 5,
        resAir: 5,
      );

      final prediction = calculator.predict(
        character: character,
        opponent: opponent,
      );

      expect(prediction, isA<FightPrediction>());
    });

    // Add more tests for other scenarios like loss, timeout, etc.
    // ...
  });

  group('FightingStats', () {
    // Add tests for FightingStats methods like attackForType, damageForType, etc.
    // ...
  });

  group('ElementalValue', () {
    // Add tests for ElementalValue properties and methods
    // ...
  });
}
