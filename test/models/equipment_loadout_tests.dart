// test/models/equipment_loadout_test.dart

import 'package:artifacts_api/artifacts_api.dart'; // You'll need to mock this
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart'; // You'll need to mock this
import 'package:built_collection/src/list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart'; // For mocking

// --- Mocks ---
class MockItemSchema extends Mock implements ItemSchema {}

class MockCharacterSchema extends Mock implements CharacterSchema {}

class MockWorldDataProvider extends Mock implements WorldDataProvider {}

class MockSimpleEffectSchema extends Mock implements SimpleEffectSchema {}

class MockQuantityItemSchema extends Mock implements QuantityItemSchema {}

void main() {
  group('EquipmentLoadout', () {
    late MockWorldDataProvider mockWorldDataProvider;

    setUp(() {
      mockWorldDataProvider = MockWorldDataProvider();
    });

    // Helper function to create a mock item with optional effects
    MockItemSchema createMockItem(
        {List<SimpleEffectSchema>? effects, String code = 'test_item'}) {
      final item = MockItemSchema();
      when(() => item.code).thenReturn(code);
      when(() => item.effects)
          .thenReturn(BuiltList.of(effects ?? <SimpleEffectSchema>[]));
      return item;
    }

    test('constructor initializes all fields correctly', () {
      final weapon = createMockItem(code: 'weapon1');
      final helmet = createMockItem(code: 'helmet1');
      // ... create other mock items if needed for a more thorough test

      final loadout = EquipmentLoadout(
        weapon: weapon,
        helmet: helmet,
        // ... pass other items
      );

      expect(loadout.weapon, weapon);
      expect(loadout.helmet, helmet);
      expect(loadout.shield, isNull); // Example of checking a null field
      // ... assert other fields
    });

    group('fromCharacter', () {
      test('correctly populates items from CharacterSchema', () {
        final mockCharacter = MockCharacterSchema();
        final weaponItem = createMockItem(code: 'sword');
        final helmetItem = createMockItem(code: 'iron_helmet');
        final ring1Item = createMockItem(code: 'gold_ring');

        // Setup character slots
        when(() => mockCharacter.weaponSlot).thenReturn('sword_id');
        when(() => mockCharacter.helmetSlot).thenReturn('helmet_id');
        when(() => mockCharacter.shieldSlot)
            .thenReturn(''); // Example of an empty slot
        when(() => mockCharacter.bodyArmorSlot).thenReturn('');
        when(() => mockCharacter.legArmorSlot).thenReturn('');
        when(() => mockCharacter.bootsSlot).thenReturn('');
        when(() => mockCharacter.amuletSlot).thenReturn('');
        when(() => mockCharacter.ring1Slot).thenReturn('ring1_id');
        when(() => mockCharacter.ring2Slot).thenReturn('');
        when(() => mockCharacter.utility1Slot).thenReturn('');
        when(() => mockCharacter.utility2Slot).thenReturn('');
        when(() => mockCharacter.artifact1Slot).thenReturn('');
        when(() => mockCharacter.artifact2Slot).thenReturn('');
        when(() => mockCharacter.artifact3Slot).thenReturn('');
        when(() => mockCharacter.runeSlot).thenReturn('');
        when(() => mockCharacter.bagSlot).thenReturn('');

        // Setup WorldDataProvider responses
        when(() => mockWorldDataProvider.getItemByCode('sword_id'))
            .thenReturn(weaponItem);
        when(() => mockWorldDataProvider.getItemByCode('helmet_id'))
            .thenReturn(helmetItem);
        when(() => mockWorldDataProvider.getItemByCode('ring1_id'))
            .thenReturn(ring1Item);
        // For null slots, getItemByCode should be called and can return null
        when(() => mockWorldDataProvider.getItemByCode('')).thenReturn(null);

        final loadout = EquipmentLoadout.fromCharacter(
            mockCharacter, mockWorldDataProvider);

        expect(loadout.weapon, weaponItem);
        expect(loadout.helmet, helmetItem);
        expect(loadout.ring1, ring1Item);
        expect(loadout.shield, isNull);
        // ... assert other slots
      });
    });

    test('items getter returns a list of all equipment items', () {
      final weapon = createMockItem(code: 'w');
      final helmet = createMockItem(code: 'h');
      final shield = createMockItem(code: 's');
      // ... and so on for all 16 slots

      final loadout = EquipmentLoadout(
        weapon: weapon,
        helmet: helmet,
        shield: shield,
        // ... initialize all other slots, some can be null
      );

      final itemsList = loadout.items;

      expect(itemsList.length, 16); // Ensure all slots are accounted for
      expect(itemsList, contains(QuantityItemSchema(weapon, 1)));
      expect(itemsList, contains(QuantityItemSchema(helmet, 1)));
      expect(itemsList, contains(QuantityItemSchema(shield, 1)));
      expect(itemsList.where((item) => item == null).length,
          13); // If only 3 items are set
    });

    group('effectValue', () {
      test('returns 0 if no items are equipped', () {
        final loadout = EquipmentLoadout();
        expect(loadout.effectValue(EffectEnum.hp), 0);
      });

      test('returns 0 if items have no effects', () {
        final weapon = createMockItem(effects: []); // Item with no effects
        final loadout = EquipmentLoadout(weapon: weapon);
        expect(loadout.effectValue(EffectEnum.hp), 0);
      });

      test('returns 0 if items have effects but not the one being queried', () {
        final effect1 = MockSimpleEffectSchema();
        when(() => effect1.code).thenReturn(EffectEnum.dmg.name);
        when(() => effect1.value).thenReturn(10);

        final weapon = createMockItem(effects: [effect1]);
        final loadout = EquipmentLoadout(weapon: weapon);

        expect(loadout.effectValue(EffectEnum.hp), 0);
      });

      test('calculates sum of a single effect from one item', () {
        final hpEffect = MockSimpleEffectSchema();
        when(() => hpEffect.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect.value).thenReturn(50);

        final helmet = createMockItem(effects: [hpEffect]);
        final loadout = EquipmentLoadout(helmet: helmet);

        expect(loadout.effectValue(EffectEnum.hp), 50.0);
      });

      test('calculates sum of a single effect from multiple items', () {
        final hpEffect1 = MockSimpleEffectSchema();
        when(() => hpEffect1.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect1.value).thenReturn(50);
        final helmet = createMockItem(effects: [hpEffect1]);

        final hpEffect2 = MockSimpleEffectSchema();
        when(() => hpEffect2.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect2.value).thenReturn(25);
        final armor = createMockItem(effects: [hpEffect2]);

        final loadout = EquipmentLoadout(helmet: helmet, bodyArmor: armor);
        expect(loadout.effectValue(EffectEnum.hp), 75.0);
      });

      test('calculates sum of an effect present multiple times on one item',
          () {
        final hpEffect1 = MockSimpleEffectSchema();
        when(() => hpEffect1.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect1.value).thenReturn(30);

        final hpEffect2 = MockSimpleEffectSchema();
        when(() => hpEffect2.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect2.value).thenReturn(20);

        // Also add a different effect to ensure it's ignored
        final dmgEffect = MockSimpleEffectSchema();
        when(() => dmgEffect.code).thenReturn(EffectEnum.dmg.name);
        when(() => dmgEffect.value).thenReturn(5);

        final amulet =
            createMockItem(effects: [hpEffect1, dmgEffect, hpEffect2]);
        final loadout = EquipmentLoadout(amulet: amulet);

        expect(loadout.effectValue(EffectEnum.hp), 50.0);
      });

      test('handles items with null effects list', () {
        final weapon = MockItemSchema(); // ItemSchema.effects can be nullable
        when(() => weapon.code).thenReturn('null_effects_weapon');
        when(() => weapon.effects).thenReturn(null);

        final loadout = EquipmentLoadout(weapon: weapon);
        expect(loadout.effectValue(EffectEnum.hp), 0);
      });

      test(
          'handles items with effects list containing null EffectSchema (if possible by contract)',
          () {
        // This test depends on whether your EffectSchema can actually be null within the list.
        // If `item.effects` is `List<EffectSchema>?` and `EffectSchema` itself is non-nullable,
        // then a null inside the list isn't possible.
        // If `item.effects` is `List<EffectSchema?>?`, then this test is relevant.
        // Assuming EffectSchema within the list is non-nullable based on your current code.
        // If EffectSchema can be null in the list, you'd mock it like: `[null, validEffect]`
        // and ensure your fold handles it. Your current code `(prevEffectSum ?? 0)`
        // already seems to handle the null accumulator, but not a null `effect` object itself.
        // The current implementation of effectValue would throw if `effect` in `effect.code` is null.

        // Let's assume EffectSchema in the list is non-nullable.
        // If it *can* be null, you'd need to adjust your `effectValue` method:
        // (effect?.code == effectEnum.name ? (effect?.value ?? 0) : 0)) ?? 0));
        // For now, testing based on current structure.

        final hpEffect = MockSimpleEffectSchema();
        when(() => hpEffect.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect.value).thenReturn(10);

        // Create an item where one effect is valid, and another is somehow null in the list
        // This is tricky with current ItemSchema, typically effects list would be List<EffectSchema>
        // not List<EffectSchema?>. If ItemSchema.effects was List<EffectSchema?> then:
        // final ring = createMockItem(effects: [null, hpEffect]);
        // For now, this scenario is unlikely given standard API design unless explicitly stated.

        // Re-affirming test with a valid effect and a different one
        final dmgEffect = MockSimpleEffectSchema();
        when(() => dmgEffect.code).thenReturn(EffectEnum.dmg.name);
        when(() => dmgEffect.value).thenReturn(5);

        final ring = createMockItem(effects: [hpEffect, dmgEffect]);
        final loadout = EquipmentLoadout(ring1: ring);
        expect(loadout.effectValue(EffectEnum.hp), 10.0);
      });

      test(
          'complex scenario with multiple items, multiple effects, and some missing effects',
          () {
        final hpEffect1 = MockSimpleEffectSchema();
        when(() => hpEffect1.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect1.value).thenReturn(100);
        final weapon = createMockItem(effects: [hpEffect1]);

        final hpEffect2 = MockSimpleEffectSchema();
        when(() => hpEffect2.code).thenReturn(EffectEnum.hp.name);
        when(() => hpEffect2.value).thenReturn(50);
        final dmgEffect1 = MockSimpleEffectSchema();
        when(() => dmgEffect1.code).thenReturn(EffectEnum.dmg.name);
        when(() => dmgEffect1.value).thenReturn(5);
        final helmet = createMockItem(effects: [hpEffect2, dmgEffect1]);

        final dmgEffect2 = MockSimpleEffectSchema();
        when(() => dmgEffect2.code).thenReturn(EffectEnum.dmg.name);
        when(() => dmgEffect2.value).thenReturn(10);
        final shield = createMockItem(effects: [dmgEffect2]);

        final emptyItem = createMockItem(effects: []); // Item with no effects
        final nullEffectsItem = MockItemSchema(); // Item with null effects list
        when(() => nullEffectsItem.code).thenReturn('null_fx');
        when(() => nullEffectsItem.effects).thenReturn(null);

        final loadout = EquipmentLoadout(
          weapon: weapon,
          // HP: 100
          helmet: helmet,
          // HP: 50, DMG: 5
          shield: shield,
          // DMG: 10
          bodyArmor: emptyItem,
          // No effects
          legArmor: nullEffectsItem,
          // Null effects
          boots: null, // No item
        );

        expect(loadout.effectValue(EffectEnum.hp), 150.0);
        expect(loadout.effectValue(EffectEnum.dmg), 15.0);
        expect(
            loadout.effectValue(EffectEnum.res_air), 0.0); // Effect not present
      });
    });
  });
}
