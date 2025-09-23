import 'dart:collection';

import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class LogPanel extends StatefulWidget {
  const LogPanel({super.key});

  @override
  State<LogPanel> createState() => _LogPanelState();
}

class _LogPanelState extends State<LogPanel> {
  // State variables to hold the current filter values
  LogLevel? _selectedLevel;
  String? _selectedCharacterName;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Re-filter the list every time the search text changes
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<LogProvider>();
    final teamProvider = context.watch<TeamProvider>();

    // --- The Filtering Logic ---
    // Start with the full list of logs.
    var filteredLogs = logProvider.logs;

    // Apply the log level filter.
    if (_selectedLevel != null) {
      filteredLogs = UnmodifiableListView(
          filteredLogs.where((log) => log.level == _selectedLevel).toList());
    }

    // Apply the character filter.
    if (_selectedCharacterName != null) {
      filteredLogs = UnmodifiableListView(filteredLogs
          .where((log) => log.character?.name == _selectedCharacterName)
          .toList());
    }

    // Apply the search text filter.
    final searchTerm = _searchController.text.toLowerCase();
    if (searchTerm.isNotEmpty) {
      filteredLogs = UnmodifiableListView(filteredLogs
          .where((log) => log.message.toLowerCase().contains(searchTerm))
          .toList());
    }

    return Column(
      children: [
        // --- The Filter UI Controls ---
        _buildFilterControls(
            teamProvider.characters.map((s) => s.character.name).toList()),
        const Divider(height: 1),

        // --- The Filtered Log List ---
        Expanded(
          child: ListView.builder(
            itemCount: filteredLogs.length,
            itemBuilder: (context, index) {
              final entry = filteredLogs[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${DateFormat('HH:mm:ss').format(entry.timestamp)}: ',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      if (entry.character != null)
                        TextSpan(
                          text: '[${entry.character?.name}]',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      TextSpan(
                        text: entry.message,
                        style: TextStyle(
                          color: entry.level == LogLevel.error
                              ? Colors.redAccent
                              : entry.level == LogLevel.warning
                                  ? Colors.yellow
                                  : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterControls(List<String> characterNames) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search logs...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                isDense: true,
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // Character Filter Dropdown
              Expanded(
                child: DropdownButtonFormField<String?>(
                  initialValue: _selectedCharacterName,
                  isDense: true,
                  decoration: const InputDecoration(
                      labelText: 'Character', border: OutlineInputBorder()),
                  hint: const Text('All'),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text("All Characters")),
                    ...characterNames.map((name) =>
                        DropdownMenuItem(value: name, child: Text(name))),
                  ],
                  onChanged: (value) =>
                      setState(() => _selectedCharacterName = value),
                ),
              ),
              const SizedBox(width: 8),
              // Log Level Filter Dropdown
              Expanded(
                child: DropdownButtonFormField<LogLevel?>(
                  initialValue: _selectedLevel,
                  isDense: true,
                  decoration: const InputDecoration(
                      labelText: 'Level', border: OutlineInputBorder()),
                  hint: const Text('All'),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text("All Levels")),
                    ...LogLevel.values.map((level) => DropdownMenuItem(
                        value: level, child: Text(level.name))),
                  ],
                  onChanged: (value) => setState(() => _selectedLevel = value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
