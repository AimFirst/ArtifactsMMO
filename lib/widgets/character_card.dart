// lib/widgets/character_card.dart

import 'dart:async';
import 'dart:math';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/destination_extension.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/models/queued_action.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
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
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Opacity(
              // Dim the card if the character is busy
              opacity:
                  state.isOnCooldown || state.isPerformingAction ? 0.65 : 1.0,
              child: _buildCardContent(context, state),
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
              Text('Inventory: ${character.inventoryCount} / ${character.inventoryMaxItems}'),
            ],
          ),
          // Skills
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 8),
              // NOTE: Adjust property access to match your Character model
              Text('Mining: ${character.miningLevel}'),
            ],
          ),
          const SizedBox(height: 8),
          // Last Action & Cooldown
          _buildActionStatus(state),
          const SizedBox(height: 16),
          // Action Buttons
          _buildActionButtons(context, state),
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

  Widget _buildActionButtons(BuildContext context, CharacterState state) {
    final teamProvider = context.read<TeamProvider>();
    final characterName = state.character.name;
    final queue = teamProvider.getQueueFor(characterName);
    final random = Random(); // Create a single Random instance

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Task Assignment Dropdown ---
        Row(
          children: [
            const Text('Task: ', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<CharacterTask>(
              value: state.currentTask,
              items: CharacterTask.values.map((task) {
                return DropdownMenuItem(
                  value: task,
                  child: Text(task.toString().split('.').last), // e.g., "mineEndlessly"
                );
              }).toList(),
              onChanged: (CharacterTask? newTask) {
                if (newTask != null) {
                  teamProvider.setTask(characterName, newTask);
                }
              },
            ),
            if (state.currentTask == CharacterTask.gatherEndlessly) ...[
            const Text('Job: ', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<GatheringSkill?>(
              // The value is the character's currently assigned skill
              value: state.currentTask == CharacterTask.gatherEndlessly
                  ? state.designatedGatheringSkill
                  : null,
              hint: const Text("Idle"), // Show 'Idle' when no skill is selected
              // Create a list of all gathering skills, plus a null option for 'Idle'
              items: [
                const DropdownMenuItem(value: null, child: Text("Idle")),
                ...GatheringSkill.values.map((skill) {
                  return DropdownMenuItem(
                    value: skill,
                    child: Text(skill.name), // e.g., "mining"
                  );
                }),
              ],
              onChanged: (GatheringSkill? newSkill) {
                // Call the new method in the provider to set the task
                teamProvider.setGatheringTask(characterName, newSkill);
              },
            ),],
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('Role: ', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<CharacterRole>(
              value: state.role,
              items: CharacterRole.values.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role.toString().split('.').last),
                );
              }).toList(),
              onChanged: (CharacterRole? newRole) {
                if (newRole != null) {
                  teamProvider.setRole(characterName, newRole);
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        // --- Manual Action Buttons ---
        Wrap(
          spacing: 8.0,
          children: [
            ElevatedButton(
              child: const Text('Queue Random Move'),
              onPressed: () {
                final int randomX = random.nextInt(6);
                final int randomY = random.nextInt(6);
                teamProvider.queueAction(
                  characterName,
                  QueuedAction(
                    actionName: 'Move to ($randomX, $randomY)',
                    apiCall: () => teamProvider.apiClient.myCharacters
                        .actionMoveMyNameActionMovePost(
                      name: characterName,
                      destinationSchema: (DestinationSchemaBuilder()
                        ..setCoords(randomX, randomY))
                          .build(),
                    ),
                  ),
                );
              },
            ),
            // The manual "Queue Mine" button is now replaced by the task dropdown.
          ],
        ),
        // Clear Queue Button
        if (queue.isNotEmpty)
          TextButton.icon(
            icon: const Icon(Icons.clear_all, size: 16),
            label: const Text('Clear Queue'),
            onPressed: () => teamProvider.clearQueue(characterName),
            style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent, padding: EdgeInsets.zero),
          )
      ],
    );
  }
}
