// lib/home_page.dart

import 'package:artifacts_mmo/widgets/log_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/team_provider.dart';
import 'widgets/character_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artifacts MMO Dashboard'),
        backgroundColor: Colors.grey[800],
        actions: [
          // Add a refresh button to the app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Call the fetch method without listening to the result here
              context.read<TeamProvider>().fetchAllCharacters();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Consumer<TeamProvider>(
              builder: (context, teamProvider, child) {
                if (teamProvider.isLoading && teamProvider.characters.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (teamProvider.characters.isEmpty) {
                  return const Center(
                    child: Text('No characters found or an error occurred.'),
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
          // Log Panel
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Logs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            flex: 2, // Give less space to the logs
            child: LogPanel(),
          ),
        ],
      ),
    );
  }
}
