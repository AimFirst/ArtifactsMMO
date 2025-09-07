import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/services/combat_service.dart'; // For CombatDetails
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart'; // Only if needed for creating ItemSchema instances for loadouts
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';

// Mocks (some might not be strictly necessary if Loadout/CombatDetails can be created directly)
class MockCombatService extends Mock implements CombatService {}

class MockWorldDataProvider extends Mock implements WorldDataProvider {}

class MockItemSchema extends Mock implements ItemSchema {}

class MockMonsterSchema extends Mock implements MonsterSchema {}

class MockCombatDetails extends Mock implements CombatDetails {}

class MockEquipmentLoadout extends Mock implements EquipmentLoadout {}

enum ExpectedResult {
  same,
  a,
  b,
}

void main() {
  late LoadoutOptimizerService loadoutOptimizerService;
  late MockCombatService mockCombatService;
  late MockWorldDataProvider mockWorldDataProvider;

  setUp(() {
    mockCombatService = MockCombatService();
    mockWorldDataProvider = MockWorldDataProvider();
    loadoutOptimizerService =
        LoadoutOptimizerService(mockCombatService, mockWorldDataProvider);
  });

  group('LoadoutOptimizerService - compareLoadoutResults', () {
    const defaultSkillType = GatheringSkill.mining;
    GearEvaluationContext _createCombatEvaluationContext() {
      return GearEvaluationContext(
          taskType: CharacterExtensions.overallLevelSkillName,
          targetMonster: MockMonsterSchema());
    }

    GearEvaluationContext _createSkillEvaluationContext(
        {GatheringSkill skill = defaultSkillType}) {
      return GearEvaluationContext(taskType: skill.name);
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

    ItemSchema _createItemSchema({
      String name = 'fake item',
      String type = 'shield',
      String code = 'fake_item',
      int level = 1,
      String description = 'Some description',
      String subtype = 'type2',
      bool tradable = true,
      List<SimpleEffectSchema> effects = const [],
    }) {
      return (ItemSchemaBuilder()
            ..name = name
            ..type = type
            ..code = code
            ..level = 1
            ..description = description
            ..subtype = subtype
            ..tradeable = tradable
            ..effects = ListBuilder(effects))
          .build();
    }

    CombatDetails _createCombatDetails({
      double playerAvgDPT = 10,
      double monsterAvgDPT = 1,
      int playerStartHp = 200,
      int monsterStartHp = 200,
      int haste = 0,
    }) {
      return CombatDetails(
          playerAvgDPT: playerAvgDPT,
          monsterAvgDPT: monsterAvgDPT,
          playerStartHp: playerStartHp,
          monsterStartHp: monsterStartHp,
          haste: haste);
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
            EquipmentLoadout(), _createCombatDetails(monsterAvgDPT: 100));
        final resultB = CombatEquipmentLoadoutResult(
            EquipmentLoadout(), _createCombatDetails());
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
            EquipmentLoadout(), _createCombatDetails());
        final resultB = CombatEquipmentLoadoutResult(
            EquipmentLoadout.fromItems([
              _createItemSchema(
                  effects: [_createEffect(effect: EffectEnum.wisdom)])
            ]),
            _createCombatDetails());
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
            EquipmentLoadout(), _createCombatDetails(monsterAvgDPT: 5));
        final resultB = CombatEquipmentLoadoutResult(
            EquipmentLoadout(), _createCombatDetails());

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
            EquipmentLoadout.fromItems([_createItemSchema()]),
            _createCombatDetails());
        final resultB = CombatEquipmentLoadoutResult(
            EquipmentLoadout(), _createCombatDetails());

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
            EquipmentLoadout(), _createCombatDetails());
        final resultB = CombatEquipmentLoadoutResult(
            EquipmentLoadout(), _createCombatDetails());

        _testCombatComparison(
            a: resultA, b: resultB, expectedResult: ExpectedResult.same);
      });
    });

    group('SkillEquipmentLoadoutResult', () {
      test('''
    a.skill = b.skill
    ''', () {
        final resultA = _createSkillEvaluationContext();
        final resultB = _createSkillEvaluationContext();
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                EquipmentLoadout(), resultA.taskType),
            b: SkillEquipmentLoadoutResult(
                EquipmentLoadout(), resultB.taskType),
            expectedResult: ExpectedResult.same);
      });

      test('''
    a.skill < b.skill
    ''', () {
        final resultA = _createSkillEvaluationContext();
        final resultB = _createSkillEvaluationContext();
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                EquipmentLoadout(), resultA.taskType),
            b: SkillEquipmentLoadoutResult(
                EquipmentLoadout.fromItems([_createItemSchema(effects: [_createEffect(effect: EffectEnum.mining)])]), resultB.taskType),
            expectedResult: ExpectedResult.b);
      });

      test('''
    a.skill > b.skill
    ''', () {
        final resultA = _createSkillEvaluationContext();
        final resultB = _createSkillEvaluationContext();
        _testSkillComparison(
            a: SkillEquipmentLoadoutResult(
                EquipmentLoadout.fromItems([_createItemSchema(effects: [_createEffect(effect: EffectEnum.mining)])]), resultA.taskType),
            b: SkillEquipmentLoadoutResult(
                EquipmentLoadout(), resultB.taskType),
            expectedResult: ExpectedResult.a);
      });
    });
  });
}
