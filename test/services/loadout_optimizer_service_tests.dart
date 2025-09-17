import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/combat_prediction.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/services/combat_service.dart'; // For CombatDetails
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart'; // Only if needed for creating ItemSchema instances for loadouts
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:built_collection/built_collection.dart';

// Mocks (some might not be strictly necessary if Loadout/CombatDetails can be created directly)
class MockCombatService extends Mock implements CombatService {}

class MockWorldDataProvider extends Mock implements WorldDataProvider {}

class MockItemSchema extends Mock implements ItemSchema {}

class MockMonsterSchema extends Mock implements MonsterSchema {}

class MockCombatDetails extends Mock implements CombatDetails {}

class MockEquipmentLoadout extends Mock implements EquipmentLoadout {}

class MockAppDatabase extends Mock implements AppDatabase {}

enum ExpectedResult {
  same,
  a,
  b,
}

void main() {
  late LoadoutOptimizerService loadoutOptimizerService;
  late MockCombatService mockCombatService;
  late MockWorldDataProvider mockWorldDataProvider;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockCombatService = MockCombatService();
    mockWorldDataProvider = MockWorldDataProvider();
    mockAppDatabase = MockAppDatabase();
    loadoutOptimizerService = LoadoutOptimizerService(
        mockCombatService, mockWorldDataProvider, mockAppDatabase);
  });

  group('LoadoutOptimizerService - compareLoadoutResults', () {
    GearEvaluationContext _createCombatEvaluationContext() {
      return CombatGearEvaluationContext(
          targetMonster: MockMonsterSchema());
    }

    GearEvaluationContext _createSkillEvaluationContext(
        {GatheringSkill skill = GatheringSkill.mining}) {
      return SkillGearEvaluationContext(skillType: skill.name);
    }

    SimpleEffectSchema _createEffect(
        {EffectEnum effect = EffectEnum.dmg,
        int value = 10,
        String description = 'Some effect description'}) {
      return (SimpleEffectSchemaBuilder()
            ..code = effect.name
            ..value = value
            ..description = description)
          .build();
    }

    QuantityItemSchema _createItemSchema({
      String name = 'fake item',
      String type = 'shield',
      String code = 'fake_item',
      int level = 1,
      String description = 'Some description',
      String subtype = 'type2',
      bool tradable = true,
      List<SimpleEffectSchema> effects = const [],
      int quantity = 1,
    }) {
      return QuantityItemSchema ((ItemSchemaBuilder()
            ..name = name
            ..type = type
            ..code = code
            ..level = 1
            ..description = description
            ..subtype = subtype
            ..tradeable = tradable
            ..effects = ListBuilder(effects))
          .build(), quantity);
    }

    CombatPrediction _createCombatDetails({
      double winPercentage = .99,
      double averageTurnsToWin = 10,
      double averageHpRemaining = 100,
      int haste = 0,
      int startHp = 200,
    }) {
      return CombatPrediction(winPercentage: winPercentage, averageTurnsToWin: averageTurnsToWin, averageHpRemaining: averageHpRemaining, haste: haste, startHp: startHp);
    }

    void _testComparison({
      required EquipmentLoadoutResult a,
      required EquipmentLoadoutResult b,
      required GearEvaluationContext gearContext,
      required ExpectedResult expectedResult,
    }) {
      final options = [a, b];
      final result =
          loadoutOptimizerService.compareLoadoutResults(a, b, gearContext);
      expect(
          result,
          expectedResult == ExpectedResult.same
              ? 0
              : expectedResult == ExpectedResult.a
                  ? -1
                  : 1);
      options.sort((a, b) =>
          loadoutOptimizerService.compareLoadoutResults(a, b, gearContext));
      expect(
          options.first,
          expectedResult == ExpectedResult.same ||
                  expectedResult == ExpectedResult.a
              ? a
              : b);
    }

    void _testCombatComparison({
      required CombatEquipmentLoadoutResult a,
      required CombatEquipmentLoadoutResult b,
      GearEvaluationContext? gearContextParam,
      required ExpectedResult expectedResult,
      bool aCanWin = true,
      bool bCanWin = true,
    }) {
      expect(a.combatDetails.canWin, aCanWin);
      expect(b.combatDetails.canWin, bCanWin);
      _testComparison(
          a: a,
          b: b,
          gearContext: gearContextParam ?? _createCombatEvaluationContext(),
          expectedResult: expectedResult);
    }

    void _testSkillComparison({
      required SkillEquipmentLoadoutResult a,
      required SkillEquipmentLoadoutResult b,
      GearEvaluationContext? gearContextParam,
      required ExpectedResult expectedResult,
    }) {
      _testComparison(
          a: a,
          b: b,
          gearContext: gearContextParam ?? _createSkillEvaluationContext(),
          expectedResult: expectedResult);
    }

    group('CombatEquipmentLoadoutResult', () {
      test('''
    a.canWin = false
    b.canWin = true
    ''', () {
        final resultA = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(),
            combatDetails: _createCombatDetails(winPercentage: 0), itemsToUse: []);
        final resultB = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);
        _testCombatComparison(
            a: resultA,
            b: resultB,
            expectedResult: ExpectedResult.b,
            aCanWin: false);
      });

      test('''
    a.canWin = true
    b.canWin = true

    a.wisdom = 0
    b.wisdom = 10
    ''', () {
        final resultA = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);
        final resultB = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout.fromItems([
              _createItemSchema(
                  effects: [_createEffect(effect: EffectEnum.wisdom)])
            ]),
            combatDetails: _createCombatDetails(), itemsToUse: []);
        _testCombatComparison(
            a: resultA, b: resultB, expectedResult: ExpectedResult.b);
      });

      test('''
    a.canWin = true
    b.canWin = true

    a.wisdom = 0
    b.wisdom = 0

    b.cooldown < a.cooldown
    ''', () {
        final resultA = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(),
            combatDetails: _createCombatDetails(averageTurnsToWin: 20), itemsToUse: []);
        final resultB = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);

        expect(resultB.combatDetails.totalCooldown,
            lessThan(resultA.combatDetails.totalCooldown));

        _testCombatComparison(
            a: resultA, b: resultB, expectedResult: ExpectedResult.b);
      });

      test('''
    a.canWin = true
    b.canWin = true

    a.wisdom = 0
    b.wisdom = 0

    b.cooldown == a.cooldown

    b.nullItems < a.nullItems
    ''', () {
        final resultA = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout.fromItems([_createItemSchema()]),
            combatDetails: _createCombatDetails(), itemsToUse: []);
        final resultB = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);

        _testCombatComparison(
            a: resultA, b: resultB, expectedResult: ExpectedResult.b);
      });

      test('''
    a.canWin = true
    b.canWin = true

    a.wisdom = 0
    b.wisdom = 0

    b.cooldown == a.cooldown

    b.nullItems == a.nullItems
    ''', () {
        final resultA = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);
        final resultB = CombatEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), combatDetails: _createCombatDetails(), itemsToUse: []);

        _testCombatComparison(
            a: resultA, b: resultB, expectedResult: ExpectedResult.same);
      });
    });

    group('SkillEquipmentLoadoutResult', () {
      test('''
    a.skill = b.skill
    ''', () {
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout(), itemsToUse: []),
            b: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout(), itemsToUse: []),
            expectedResult: ExpectedResult.same);
      });

      test('''
    a.skill < b.skill
    ''', () {
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout(), itemsToUse: []),
            b: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout.fromItems([
                  _createItemSchema(effects: [
                    _createEffect(effect: EffectEnum.mining, value: -10)
                  ])
                ]),itemsToUse: []),
            expectedResult: ExpectedResult.b);
      });

      test('''
    a.skill > b.skill
    ''', () {
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout.fromItems([
                  _createItemSchema(effects: [
                    _createEffect(effect: EffectEnum.mining, value: -10)
                  ])
                ]), itemsToUse: [],),
            b: SkillEquipmentLoadoutResult(
                loadout: EquipmentLoadout(), itemsToUse: []),
            expectedResult: ExpectedResult.a);
      });
    });
  });
}
