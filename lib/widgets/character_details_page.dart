// lib/character_details_page.dart
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/widgets/equipped_item_widget.dart';
import 'package:artifacts_mmo/widgets/inventory_item_widget.dart';
import 'package:artifacts_mmo/widgets/skill_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:provider/provider.dart'; // For ItemSlot enum

class CharacterDetailsPage extends StatelessWidget {
  final CharacterState characterState;

  const CharacterDetailsPage({super.key, required this.characterState});

  @override
  Widget build(BuildContext context) {
    final worldDataProvider = context.watch<WorldDataProvider>();
    final character = characterState.character;
    final inventory =
        character.inventory?.where((item) => item.quantity > 0).toList() ??
            <InventorySlot>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- LEFT COLUMN: Skills ---
            Expanded(
              flex: 2, // Skills take up 2 parts of the space
              child: ListView(
                children: [
                  // Combat
                  SkillProgressWidget(
                    skillName: 'Combat',
                    icon: Icons.shield,
                    iconColor: Colors.redAccent,
                    level: character.level,
                    currentXp: character.xp,
                    maxXp: character.maxXp,
                  ),
                  const Divider(height: 24),

                  // Gathering Skills
                  const Text('Gathering',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  SkillProgressWidget(
                      skillName: 'Mining',
                      icon: Icons.hardware,
                      level: character.miningLevel,
                      currentXp: character.miningXp,
                      maxXp: character.miningMaxXp),
                  SkillProgressWidget(
                      skillName: 'Woodcutting',
                      icon: Icons.park,
                      level: character.woodcuttingLevel,
                      currentXp: character.woodcuttingXp,
                      maxXp: character.woodcuttingMaxXp),
                  SkillProgressWidget(
                      skillName: 'Fishing',
                      icon: Icons.water_drop,
                      level: character.fishingLevel,
                      currentXp: character.fishingXp,
                      maxXp: character.fishingMaxXp),
                  SkillProgressWidget(
                      skillName: 'Alchemy',
                      icon: Icons.science,
                      level: character.alchemyLevel,
                      currentXp: character.alchemyXp,
                      maxXp: character.alchemyMaxXp),
                  const Divider(height: 24),

                  // Crafting Skills
                  const Text('Crafting',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  SkillProgressWidget(
                      skillName: 'Weaponcrafting',
                      icon: Icons.colorize,
                      level: character.weaponcraftingLevel,
                      currentXp: character.weaponcraftingXp,
                      maxXp: character.weaponcraftingMaxXp),
                  SkillProgressWidget(
                      skillName: 'Gearcrafting',
                      icon: Icons.build_circle,
                      level: character.gearcraftingLevel,
                      currentXp: character.gearcraftingXp,
                      maxXp: character.gearcraftingMaxXp),
                  SkillProgressWidget(
                      skillName: 'Jewelrycrafting',
                      icon: Icons.diamond,
                      level: character.jewelrycraftingLevel,
                      currentXp: character.jewelrycraftingXp,
                      maxXp: character.jewelrycraftingMaxXp),
                  SkillProgressWidget(
                      skillName: 'Cooking',
                      icon: Icons.local_dining,
                      level: character.cookingLevel,
                      currentXp: character.cookingXp,
                      maxXp: character.cookingMaxXp),
                  // Add other crafting skills here if available in your character model
                ],
              ),
            ),

            const VerticalDivider(width: 32), // Separator

            // --- RIGHT COLUMN: Equipment & Inventory ---
            Expanded(
              flex: 3, // Equipment & Inventory take up 3 parts of the space
              child: ListView(
                children: [
                  // Equipment View
                  const Text('Equipment',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      // Ensure the items are square.
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: ItemSlot.values.length,
                    itemBuilder: (context, index) {
                      final slot = ItemSlot.values.toList()[index];
                      // Find the equipped item for this slot, using the slot's name as key
                      final equippedItemCode = character.itemInSlot(slot);
                      final equippedItem =
                          worldDataProvider.getItemByCode(equippedItemCode);
                      return EquippedItemWidget(slot: slot, item: equippedItem);
                    },
                  ),
                  const Divider(height: 32),

                  // Inventory View
                  Row(
                    children: [
                      Text(
                          'Inventory (${character.inventoryCount} / ${character.inventoryMaxItems})',
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      Spacer(),
                      Image.network(
                        'https://artifactsmmo.com/images/items/gold.png',
                        fit: BoxFit.cover,
                        width: 18,
                        height: 18,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.person_off,
                              color: Colors.red,
                              size: 18); // Fallback for missing character image
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Text('${character.gold}',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      // Ensure the items are square.
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: inventory.length,
                    itemBuilder: (context, index) {
                      final item = inventory[index];
                      return InventoryItemWidget(item: item);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
