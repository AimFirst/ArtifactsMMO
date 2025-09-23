import 'package:artifacts_mmo/loadout_simulator_page.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class QuickSettingsPanel extends StatefulWidget {
  const QuickSettingsPanel({super.key});

  @override
  State<QuickSettingsPanel> createState() => _QuickSettingsPanelState();
}

class _QuickSettingsPanelState extends State<QuickSettingsPanel> {
  bool _isWakelockEnabled = false;

  @override
  Widget build(BuildContext context) {
    final teamProvider = context.watch<TeamProvider>();
    final worldDataProvider = context.watch<WorldDataProvider>();
    final bankProvider = context.watch<BankProvider>();

    // Determine the label for the master pause/resume button.
    final bool isAnyCharacterActive =
        teamProvider.characters.any((c) => !c.isPaused);

    return Container(
      width: 180, // Give the panel a fixed width
      padding: const EdgeInsets.all(8.0),
      color: Colors.black.withValues(alpha: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Quick Settings",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),

          // --- Keep Screen Awake Toggle ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Keep Awake"),
              Switch(
                value: _isWakelockEnabled,
                onChanged: (newValue) {
                  setState(() {
                    _isWakelockEnabled = newValue;
                    // Use the wakelock package to enable/disable the screen lock
                    WakelockPlus.toggle(enable: _isWakelockEnabled);
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // --- Pause/Resume All Button ---
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(isAnyCharacterActive ? Icons.pause : Icons.play_arrow),
              label: Text(isAnyCharacterActive ? "Pause All" : "Resume All"),
              onPressed: () {
                teamProvider.togglePauseAll();
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text("Loadout Sim"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => LoadoutSimulatorPage(
                            worldDataProvider: worldDataProvider,
                            teamProvider: teamProvider,
                            bankProvider: bankProvider,
                          )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
