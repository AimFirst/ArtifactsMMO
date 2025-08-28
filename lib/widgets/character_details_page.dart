// lib/character_details_page.dart
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/widgets/skill_progress_widget.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterState characterState;

  const CharacterDetailsPage({super.key, required this.characterState});

  @override
  Widget build(BuildContext context) {
    final character = characterState.character;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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
          const Text('Gathering', style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 8),
          ...GatheringSkill.values.map((skill) {
            final skillLevel = character.skills[skill.name];
            return SkillProgressWidget(skillName: skill.name, icon: Icons.hardware, level: skillLevel?.level ?? 1, currentXp: skillLevel?.xp ?? 0, maxXp: skillLevel?.maxXp ?? 0);
          }),

          const Divider(height: 24),

          // Crafting Skills
          const Text('Crafting', style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 8),
          ...CraftSkill.values.map((skill) {
            final skillLevel = character.skills[skill.name];
            return SkillProgressWidget(skillName: skill.name, icon: Icons.hardware, level: skillLevel?.level ?? 1, currentXp: skillLevel?.xp ?? 0, maxXp: skillLevel?.maxXp ?? 0);
          }),
        ],
      ),
    );
  }
}