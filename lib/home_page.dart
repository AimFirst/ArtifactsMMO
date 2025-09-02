import 'package:artifacts_mmo/widgets/log_panel.dart';
import 'package:artifacts_mmo/widgets/map_view.dart';
import 'package:artifacts_mmo/widgets/team_brain_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/team_provider.dart';
import 'widgets/character_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Consumer<TeamProvider>(
                    builder: (context, teamProvider, child) {
                      if (teamProvider.isLoading &&
                          teamProvider.characters.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (teamProvider.characters.isEmpty) {
                        return const Center(
                          child:
                              Text('No characters found or an error occurred.'),
                        );
                      }

                      // We'll use a ListView to display all character cards
                      return ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        // Use characterStates from the provider
                        itemCount: teamProvider.characters.length,
                        itemBuilder: (context, index) {
                          // Get the CharacterState object
                          final characterState = teamProvider.characters[index];
                          return CharacterCard(characterState: characterState);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
          ),
          // --- Map and Bottom Panels (right side) ---
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Expanded(
                  flex: 3, // Map takes the top portion
                  child: MapView(),
                ),
                const Divider(height: 1),
                Expanded(
                  flex: 2, // The bottom portion is now a Row
                  child: Row(
                    children: [
                      // Team Brain Panel on the left of the bottom row
                      const Expanded(
                        child: TeamBrainPanel(),
                      ),
                      const VerticalDivider(width: 1),
                      // Log Panel on the right of the bottom row
                      const Expanded(
                        child: LogPanel(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
