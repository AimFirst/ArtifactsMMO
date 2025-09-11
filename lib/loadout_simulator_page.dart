// lib/loadout_simulator_page.dart
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/widgets/equipped_item_widget.dart';
import 'package:flutter/material.dart';
// ... import your models and widgets

class LoadoutSimulatorPage extends StatefulWidget {
  final WorldDataProvider worldDataProvider;
  final TeamProvider teamProvider;
  final BankProvider bankProvider;

  const LoadoutSimulatorPage({
    super.key,
    required this.worldDataProvider,
    required this.teamProvider,
    required this.bankProvider,
  });

  @override
  State<LoadoutSimulatorPage> createState() => _LoadoutSimulatorPageState(
        worldDataProvider: worldDataProvider,
        teamProvider: teamProvider,
        bankProvider: bankProvider,
      );
}

class _LoadoutSimulatorPageState extends State<LoadoutSimulatorPage> {
  final WorldDataProvider worldDataProvider;
  final TeamProvider teamProvider;
  final BankProvider bankProvider;

  // State for the user's selections
  CharacterSchema? _selectedCharacter;
  Type? _selectedTaskType = CombatGearEvaluationContext;
  MonsterSchema? _selectedMonster;
  String? _selectedSkillType;
  bool? _selectedForceCalculate = false;

  // State to hold the final result
  EquipmentLoadoutResult? _result;

  _LoadoutSimulatorPageState({
    required this.worldDataProvider,
    required this.teamProvider,
    required this.bankProvider,
  }) {
    _selectedMonster = worldDataProvider.allMonsters.first;
    _selectedCharacter = teamProvider.characters.first.character;
    _selectedTaskType = CombatGearEvaluationContext;
    _selectedSkillType = GatheringSkill.mining.name;
  }

  void _runSimulation() async {
    if (_selectedCharacter == null) return;
    if (_selectedTaskType == CombatGearEvaluationContext &&
        _selectedMonster == null) return;
    if (_selectedTaskType == SkillGearEvaluationContext &&
        _selectedSkillType == null) return;

    GearEvaluationContext? gearContext = null;

    switch (_selectedTaskType) {
      case CombatGearEvaluationContext:
        gearContext =
            CombatGearEvaluationContext(targetMonster: _selectedMonster!);
        break;
      case HealGearEvaluationContext:
        gearContext = HealGearEvaluationContext(
            hpToRestore: _selectedCharacter!.maxHp - _selectedCharacter!.hp);
        break;
      case SkillGearEvaluationContext:
        gearContext =
            SkillGearEvaluationContext(skillType: _selectedSkillType!);
        break;
    }

    if (gearContext == null) {
      return;
    }

    // Get the service from your provider setup
    final result = await teamProvider.bestLoadoutOfAvailableCharacterItems(
      _selectedCharacter!,
      gearContext,
      worldDataProvider,
      bankProvider,
      forceCalculate: _selectedForceCalculate ?? false,
    );

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Read providers to get data for dropdowns
    final characters = teamProvider.characters.map((e) => e.character).toList();
    final monsters = worldDataProvider.allMonsters;
    final skills = [
      ...GatheringSkill.values.map((s) => s.name),
      ...CraftSkill.values.map((s) => s.name),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Loadout Simulator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Input Controls ---
            Row(children: [
              Expanded(
                  child: DropdownButtonFormField<String>(
                initialValue: _selectedCharacter!.name,
                items: characters
                    .map((e) => DropdownMenuItem<String>(
                          value: e.name,
                          key: Key(e.name),
                          child: Text(e.name),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  _selectedCharacter = characters.firstWhere((e) => e.name == value);
                }, /* ... for characters ... */
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: DropdownButtonFormField<Type>(
                initialValue: _selectedTaskType,
                items: [
                  CombatGearEvaluationContext,
                  SkillGearEvaluationContext,
                  HealGearEvaluationContext
                ]
                    .map((e) => DropdownMenuItem<Type>(
                          value: e,
                          key: Key(e.toString()),
                          child: Text(e.toString()),
                        ))
                    .toList(),
                onChanged: (Type? value) {
                  _selectedTaskType = value;
                },
              )),
              const SizedBox(width: 8),
              if (_selectedTaskType == CombatGearEvaluationContext)
                Expanded(
                    child: DropdownButtonFormField<MonsterSchema>(
                  initialValue: _selectedMonster,
                  items: monsters
                      .map((e) => DropdownMenuItem<MonsterSchema>(
                            value: e,
                            key: Key(e.name),
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: (MonsterSchema? value) {
                    _selectedMonster = value;
                  },
                )),
              if (_selectedTaskType == SkillGearEvaluationContext)
                Expanded(
                    child: DropdownButtonFormField<String>(
                  initialValue: _selectedSkillType,
                  items: skills
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            key: Key(e),
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    _selectedSkillType = value;
                  },
                )),
              Expanded(
                  child: CheckboxListTile(
                      title: const Text('Force Calculate'),
                      value: _selectedForceCalculate,
                      onChanged: (value) {
                        setState(() {
                          _selectedForceCalculate = value;
                        });
                      })),
            ]),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _runSimulation,
                child: const Text("Calculate Optimal Loadout")),
            const Divider(height: 32),

            // --- Results Display ---
            if (_result != null)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70),
                  itemCount: _result!.loadout.itemsBySlot.entries.length,
                  itemBuilder: (context, index) {
                    final itemAndSlot =
                        _result!.loadout.itemsBySlot.entries.elementAt(index);
                    return EquippedItemWidget(
                        slot: itemAndSlot.key, item: itemAndSlot.value?.item);
                  },
                ),
              )
            else
              const Expanded(
                  child: Center(
                      child: Text("Select inputs and run calculation."))),
          ],
        ),
      ),
    );
  }
}
