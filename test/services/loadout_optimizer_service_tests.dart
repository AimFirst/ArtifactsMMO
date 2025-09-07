import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
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
import 'package:built_collection/built_collection.dart';import 'package:collection/collection.dart';

// Mocks (some might not be strictly necessary if Loadout/CombatDetails can be created directly)
class MockCombatService extends Mock implements CombatService {}

class MockWorldDataProvider extends Mock implements WorldDataProvider {}

class MockItemSchema extends Mock implements ItemSchema {}

class MockMonsterSchema extends Mock implements MonsterSchema {}

class MockCombatDetails extends Mock implements CombatDetails {}

class MockEquipmentLoadout extends Mock implements EquipmentLoadout {}

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

  test('Isolating the problematic mock setup', () {
    final isolatedMockItem = MockItemSchema();
    const typeStringForMock = "ring"; // A raw string

    print("Directly mocking isolatedMockItem.type to return '$typeStringForMock'");
    // This is the line equivalent to line 20 in your original test
    when(() => isolatedMockItem.type).thenReturn(typeStringForMock);
    print("Direct mock setup for .type complete.");

    // Now, try to use the extension that depends on .type
    print("Accessing extension isolatedMockItem.itemSlot");
    ItemSlot? slot;
    try {
      slot = isolatedMockItem.itemSlot; // This will call your extension
    } catch (e, s) {
      print("Error accessing isolatedMockItem.itemSlot: $e");
      print(s);
      fail("Failed during itemSlot access");
    }
    print("isolatedMockItem.itemSlot returned: $slot");
    expect(slot, ItemSlot.ring1);

    // And verify .type itself
    expect(isolatedMockItem.type, typeStringForMock);
    print("Verified isolatedMockItem.type returns: ${isolatedMockItem.type}");
  });

  group('LoadoutOptimizerService - compareLoadoutResults', () {
    // --- Helper to create MockItemSchema ---
    MockItemSchema createMockItem(
        String code,
        dynamic typeArg, // Temporarily change to dynamic to catch the runtime type
        Map<String, int> effects,
        {int? wisdom}) { // 'wisdom' param appears unused for mock setup in later versions

      print("createMockItem called for code: '$code'. "
          "typeArg received: '$typeArg', "
          "runtimeType of typeArg: ${typeArg.runtimeType}");

      if (typeArg is! String) {
        print("ERROR in createMockItem: typeArg is NOT a String! Failing early.");
        throw TypeError(); // Or some other clear error
      }
      String itemTypeString = typeArg as String; // Now we are sure it's a string

      final item = MockItemSchema();
      when(() => item.code).thenReturn(code);

      // This is your line 20 equivalent:
      // It should now only proceed if itemTypeString is definitely a String
      when(() => item.type).thenReturn(itemTypeString);

      // Assuming ItemSchema itself does NOT have an 'itemSlot' field,
      // and itemSlot comes ONLY from your extension.
      // So, no when() for item.itemSlot is needed here if MockItemSchema only implements ItemSchema.
      // If ItemSchema DID have `ItemSlot get itemSlot;`, then:
      // when(() => item.itemSlot).thenReturn(ItemSlot.ring1); // Or derive it from itemTypeString

      when(() => item.effects).thenReturn(BuiltList.of(effects.entries
          .map((e) => (SimpleEffectSchemaBuilder()
        ..value = e.value
        ..code = e.key
        ..description = "Effect for ${e.key}")
          .build())
          .toList()));
      return item;
    }


    // --- Helper to create CombatEquipmentLoadoutResult ---
    CombatEquipmentLoadoutResult createCombatResult(
      bool canWin,
      double totalCooldown,
      List<ItemSchema?> items, {
      int wisdomEffect = 0,
    }) {
      final combatDetails = MockCombatDetails();
      when(() => combatDetails.canWin).thenReturn(canWin);
      when(() => combatDetails.totalCooldown).thenReturn(totalCooldown);

      // Mocking the effectValue on the real loadout instance for wisdom
      // This is a bit tricky as effectValue is on EquipmentLoadout.
      // We can create a real EquipmentLoadout and ensure its items provide the desired wisdom.
      // Or, if EquipmentLoadout is complex to set up for this, mock it.
      // For simplicity, let's assume items passed to EquipmentLoadout will correctly calculate wisdom.
      // If wisdom is calculated directly from items:
      final mockLoadoutForWisdom = MockEquipmentLoadout();
      when(() => mockLoadoutForWisdom.items).thenReturn(items);
      when(() => mockLoadoutForWisdom.effectValue(EffectEnum.wisdom))
          .thenReturn(wisdomEffect);
      when(() => mockLoadoutForWisdom.itemsBySlot).thenReturn(
          Map.fromEntries(
          items.where(
                  (i) => i != null).
          map((i) =>
              MapEntry(i!.itemSlot!, i))));

      // To make the test more robust, let's use a real EquipmentLoadout
      // and ensure the items provide the wisdom.
      List<ItemSchema?> itemsForWisdomLoadout = List.from(items);
      if (wisdomEffect > 0 &&
          !itemsForWisdomLoadout.any((item) =>
              item?.effects
                  ?.firstWhereOrNull((e) => e.code == EffectEnum.wisdom.name) !=
              null)) {
        final wisdomItem = createMockItem('wisdom_item_for_test',
            'ring', {EffectEnum.wisdom.name: wisdomEffect});
        itemsForWisdomLoadout.add(wisdomItem);
      }
      final actualLoadout = EquipmentLoadout.fromItems(itemsForWisdomLoadout);

      // If we use the actualLoadout, ensure its effectValue method works as expected or mock it too.
      // For this test, it's better if EquipmentLoadout itself is tested elsewhere, and we can rely on its behavior.
      // We'll pass the 'actualLoadout' to CombatEquipmentLoadoutResult.

      return CombatEquipmentLoadoutResult(actualLoadout, combatDetails);
    }

    // --- Helper to create SkillEquipmentLoadoutResult ---
    SkillEquipmentLoadoutResult createSkillResult(
      String taskType,
      Map<ItemSlot, ItemSchema?> itemsBySlot,
      int skillEffectValue,
    ) {
      // Create a mock EquipmentLoadout that returns the desired skillEffectValue
      final loadout = MockEquipmentLoadout();
      final items = itemsBySlot.values.toList();
      when(() => loadout.items).thenReturn(items);
      when(() => loadout.itemsBySlot).thenReturn(itemsBySlot);
      final effectEnum = EffectEnum.values.firstWhere((e) => e.name == taskType,
          orElse: () => throw "Invalid task type $taskType");
      when(() => loadout.effectValue(effectEnum)).thenReturn(skillEffectValue);

      return SkillEquipmentLoadoutResult(loadout, taskType);
    }

    final gearContextCombat = GearEvaluationContext(
        taskType: 'fighting', targetMonster: MockMonsterSchema());
    final gearContextSkillWoodcutting =
        GearEvaluationContext(taskType: EffectEnum.woodcutting.name);
    final gearContextSkillMining =
        GearEvaluationContext(taskType: EffectEnum.mining.name);

    // --- CombatEquipmentLoadoutResult Tests ---
    group('CombatEquipmentLoadoutResult comparison', () {
      test('b.canWin=true, a.canWin=false (b should be preferred)', () {
        final resultA = createCombatResult(false, 10.0, []); // Loses
        final resultB = createCombatResult(true, 15.0, []); // Wins
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            1);
      });

      test('a.canWin=true, b.canWin=false (a should be preferred)', () {
        final resultA = createCombatResult(true, 15.0, []); // Wins
        final resultB = createCombatResult(false, 10.0, []); // Loses
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            -1);
      });

      test('Both win, b has higher wisdom (b should be preferred)', () {
        final itemWisdomHigh = createMockItem(
            'wisdom_high', 'ring', {EffectEnum.wisdom.name: 10}, wisdom: 10);
        final itemWisdomLow = createMockItem(
            'wisdom_low', 'ring', {EffectEnum.wisdom.name: 5}, wisdom: 5);

        final resultA =
            createCombatResult(true, 10.0, [itemWisdomLow], wisdomEffect: 5);
        final resultB =
            createCombatResult(true, 10.0, [itemWisdomHigh], wisdomEffect: 10);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            1);
      });

      test('Both win, a has higher wisdom (a should be preferred)', () {
        final itemWisdomHigh = createMockItem(
            'wisdom_high', 'ring', {EffectEnum.wisdom.name: 10});
        final itemWisdomLow = createMockItem(
            'wisdom_low', 'ring', {EffectEnum.wisdom.name: 5});

        final resultA =
            createCombatResult(true, 10.0, [itemWisdomHigh], wisdomEffect: 10);
        final resultB =
            createCombatResult(true, 10.0, [itemWisdomLow], wisdomEffect: 5);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            -1);
      });

      test(
          'Both win, same wisdom, b has lower totalCooldown (b should be preferred)',
          () {
        final itemWisdom = createMockItem(
            'wisdom_item', 'ring', {EffectEnum.wisdom.name: 5});
        final resultA = createCombatResult(true, 15.0, [itemWisdom],
            wisdomEffect: 5); // Higher cooldown
        final resultB = createCombatResult(true, 10.0, [itemWisdom],
            wisdomEffect: 5); // Lower cooldown
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            1);
      });

      test(
          'Both win, same wisdom, a has lower totalCooldown (a should be preferred)',
          () {
        final itemWisdom = createMockItem(
            'wisdom_item', 'ring', {EffectEnum.wisdom.name: 5});
        final resultA = createCombatResult(true, 10.0, [itemWisdom],
            wisdomEffect: 5); // Lower cooldown
        final resultB = createCombatResult(true, 15.0, [itemWisdom],
            wisdomEffect: 5); // Higher cooldown
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            -1);
      });

      // test(
      //     'Both win, same wisdom, same cooldown, b has more null items (b should be preferred)',
      //     () {
      //   final item1 = createMockItem('sword', ItemSlot.weapon.name,
      //       {EffectEnum.attack_air.name: 5, EffectEnum.wisdom.name: 2});
      //   final resultA = createCombatResult(true, 10.0, [item1],
      //       wisdomEffect:
      //           2); // 1 item, 0 nulls (effectively, depends on total slots)
      //   final resultB = createCombatResult(true, 10.0, [item1, null, null],
      //       wisdomEffect: 2); // 1 item, 2 nulls
      //   expect(
      //       loadoutOptimizerService.compareLoadoutResults(
      //           resultA, resultB, gearContextCombat),
      //       1);
      // });

      test(
          'Both win, same wisdom, same cooldown, a has more null items (a should be preferred)',
          () {
        final item1 = createMockItem('sword', ItemSlot.weapon.name,
            {EffectEnum.attack_air.name: 5, EffectEnum.wisdom.name: 2});
        // resultA has 1 actual item and the rest null.
        // resultB has 2 actual items and the rest null.
        // Let's ensure the number of items passed to createCombatResult reflects this accurately for the null count.
        // EquipmentLoadout().items will list all possible slots, often with nulls by default.
        // The `items.where((item) => item == null).length` depends on the total size of `loadout.items`.
        // We need to control the `items` list passed to `EquipmentLoadout` constructor carefully.

        // Assume ItemSlot.values has a certain length. Let's say 3 for simplicity in this test.
        // So a full loadout has 3 potential items.
        // resultA: item1, null, null (2 nulls)
        // resultB: item1, item1, null (1 null) -> this is not what we want, let's use different items

        final item2 = createMockItem('shield', ItemSlot.shield.name, {
          EffectEnum.res_air.name: 3,
          EffectEnum.wisdom.name: 0
        }); // No wisdom contribution for simplicity

        // To make wisdom the same for both, and ensure item1 is the source of wisdom.
        final resultAItems =
            List<ItemSchema?>.filled(ItemSlot.values.length, null);
        resultAItems[0] = item1; // 1 actual item
        final resultA =
            createCombatResult(true, 10.0, resultAItems, wisdomEffect: 2);

        final resultBItems =
            List<ItemSchema?>.filled(ItemSlot.values.length, null);
        resultBItems[0] = item1;
        resultBItems[2] = item2; // 2 actual items
        final resultB =
            createCombatResult(true, 10.0, resultBItems, wisdomEffect: 2);

        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            -1,
            reason:
                "A has more nulls (${resultA.loadout.items.where((i) => i == null).length}) than B (${resultB.loadout.items.where((i) => i == null).length})");
      });

      test('Both win, all primary criteria same (should be 0 - equal)', () {
        final item1 = createMockItem(
            'item1', ItemSlot.weapon.name, {EffectEnum.wisdom.name: 5});
        final loadoutItems =
            List<ItemSchema?>.filled(ItemSlot.values.length, null);
        loadoutItems[0] = item1;

        final resultA =
            createCombatResult(true, 10.0, loadoutItems, wisdomEffect: 5);
        final resultB =
            createCombatResult(true, 10.0, loadoutItems, wisdomEffect: 5);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextCombat),
            0);
      });
    });

    // --- SkillEquipmentLoadoutResult Tests ---
    group('SkillEquipmentLoadoutResult comparison', () {
      test('b has higher skill value (b should be preferred)', () {
        final resultA = createSkillResult(EffectEnum.woodcutting.name, {}, 5);
        final resultB = createSkillResult(EffectEnum.woodcutting.name, {}, 10);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextSkillWoodcutting),
            1);
      });

      test('a has higher skill value (a should be preferred)', () {
        final resultA = createSkillResult(EffectEnum.woodcutting.name, {}, 10);
        final resultB = createSkillResult(EffectEnum.woodcutting.name, {}, 5);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextSkillWoodcutting),
            -1);
      });

      test('Both have same skill value (should be 0 - equal)', () {
        final resultA = createSkillResult(EffectEnum.mining.name, {}, 7);
        final resultB = createSkillResult(EffectEnum.mining.name, {}, 7);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                resultA, resultB, gearContextSkillMining),
            0);
      });
    });

    // --- Mixed Types Tests ---
    group('Mixed EquipmentLoadoutResult types', () {
      test(
          'CombatResult vs SkillResult (should be 0 - incomparable by current logic)',
          () {
        final combatResult = createCombatResult(true, 10.0, []);
        final skillResult =
            createSkillResult(EffectEnum.woodcutting.name, {}, 5);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                combatResult, skillResult, gearContextCombat),
            0);
        expect(
            loadoutOptimizerService.compareLoadoutResults(
                skillResult, combatResult, gearContextSkillWoodcutting),
            0);
      });
    });
  });
}
