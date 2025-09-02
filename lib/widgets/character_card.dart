import 'dart:async';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/widgets/character_details_page.dart';
import 'package:artifacts_mmo/widgets/skill_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCard extends StatefulWidget {
  final CharacterState characterState;

  const CharacterCard({super.key, required this.characterState});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start a timer to update the UI every second for the cooldown
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && widget.characterState.isOnCooldown) {
        setState(() {}); // Just rebuild this widget
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a ChangeNotifierProvider.value to listen to changes on a *single* character's state
    return ChangeNotifierProvider.value(
      value: widget.characterState,
      child: Consumer<CharacterState>(
        builder: (context, state, child) {
          // Rebuild the card content whenever the state notifies listeners
          return Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                // Navigate to the character details page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CharacterDetailsPage(characterState: state),
                  ),
                );
              },
              child: Opacity(
                // Dim the card if the character is busy
                opacity:
                    state.isOnCooldown || state.isPaused || state.isPerformingAction ? 0.65 : 1.0,
                child: _buildCardContent(context, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, CharacterState state) {
    final teamProvider = context.watch<TeamProvider>();
    final character = state.character;
    final queue = teamProvider.getQueueFor(character.name);

    final int currentHp = character.hp;
    final int maxHp = character.maxHp;
    final double hpPercent = maxHp > 0 ? currentHp / maxHp : 0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Character Name and Queue Count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(character.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              if (queue.isNotEmpty)
                Chip(
                  label: Text('${queue.length} Queued'),
                  avatar: const Icon(Icons.playlist_play, size: 16),
                  padding: const EdgeInsets.all(4),
                ),
              // Pause/Resume Button
              IconButton(
                icon: Icon(state.isPaused ? Icons.play_arrow : Icons.pause),
                color: state.isPaused ? Colors.greenAccent : Colors.white,
                onPressed: () {
                  teamProvider.togglePause(character.name);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Health Bar
          Row(
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 16),
              const SizedBox(width: 8),
              Expanded(child: LinearProgressIndicator(value: hpPercent)),
              const SizedBox(width: 8),
              Text('$currentHp / $maxHp'),
            ],
          ),
          const SizedBox(height: 8),
          // Location Info
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue[400], size: 16),
              const SizedBox(width: 8),
              Text('Location: ${character.location}'),
            ],
          ),
          // Inventory
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.inventory_2, color: Colors.brown[400], size: 16),
              const SizedBox(width: 8),
              // NOTE: Adjust field names to match your Character model
              Text(
                  'Inventory: ${character.inventoryCount} / ${character.inventoryMaxItems}'),
            ],
          ),
          // Skills
          const SizedBox(height: 8),
          _buildServerTaskStatus(state.character),
          const SizedBox(height: 8),
          _buildContextualSkillInfo(state),
          const SizedBox(height: 8),
          // Last Action & Cooldown
          _buildActionStatus(state),
          const SizedBox(height: 8),
          _buildCurrentGoalStatus(state),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  // Add a new helper method to display the task
  Widget _buildServerTaskStatus(CharacterSchema character) {
    // Check if the character has an active server-side task
    if (character.task.isEmpty) {
      return const SizedBox.shrink(); // Return an empty widget if no task
    }

    final double progress = character.taskTotal > 0
        ? character.taskProgress / character.taskTotal
        : 0;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quest: ${character.task}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(value: progress),
          Text(
            "${character.taskProgress} / ${character.taskTotal}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Add this new helper method to the _CharacterCardState
  Widget _buildContextualSkillInfo(CharacterState state) {
    final character = state.character;

    // Find highest skill
    int currentHighestSkillLevel = 0;
    String currentHighestSkill = '';
    for (var skill in character.skills.entries) {
      if (skill.value.level > currentHighestSkillLevel) {
        currentHighestSkill = skill.key;
        currentHighestSkillLevel = skill.value.level;
      }
    }

    final skillInfo = character.skills[currentHighestSkill];

    // When idle or doing other tasks, show nothing or the main combat level
    return SkillProgressWidget(
      skillName: currentHighestSkill,
      icon: Icons.shield,
      iconColor: Colors.grey,
      level: skillInfo?.level ?? 1,
      currentXp: skillInfo?.xp ?? 0,
      maxXp: skillInfo?.maxXp ?? 1,
    );
  }

  // Then, add this new method to your CharacterCard's state:
  Widget _buildCurrentGoalStatus(CharacterState state) {
    IconData goalIcon = Icons.pause_circle_outline; // Default for Idle
    Color iconColor = Colors.grey;

    // Choose an icon based on the current goal string
    switch (state.currentGoal) {
      case "Banking Full Inventory":
        goalIcon = Icons.savings;
        iconColor = Colors.amber;
        break;
      case "Completing Server Task":
        goalIcon = Icons.assignment;
        iconColor = Colors.lightBlueAccent;
        break;
      case "Upgrading Gear":
        goalIcon = Icons.upgrade;
        iconColor = Colors.purpleAccent;
        break;
      case "Leveling Up Skill":
        goalIcon = Icons.trending_up;
        iconColor = Colors.greenAccent;
        break;
      // Add more cases for your other goals
    }

    return SizedBox.shrink(
      child: Row(
        children: [
          Icon(goalIcon, color: iconColor, size: 16),
          const SizedBox(width: 8),
          Text(
            state.currentGoal,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActionStatus(CharacterState state) {
    if (state.isPerformingAction) {
      return Row(children: [
        const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2)),
        const SizedBox(width: 8),
        Text(state.lastAction)
      ]);
    }

    if (state.isOnCooldown) {
      final remaining =
          state.cooldownEndsAt!.difference(DateTime.now()).inSeconds;
      return Row(children: [
        Icon(Icons.timer, color: Colors.orange[600], size: 16),
        const SizedBox(width: 8),
        Text('Ready in ${remaining}s'),
      ]);
    }

    return Row(children: [
      const Icon(Icons.check_circle, color: Colors.green, size: 16),
      const SizedBox(width: 8),
      Text(state.lastAction)
    ]);
  }
}
