import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamBrainPanel extends StatelessWidget {
  const TeamBrainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final teamBrain = context.watch<TeamBrainProvider>();
    final openRequests = teamBrain.openRequests;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Team Requests (${openRequests.length})", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Divider(height: 1),
        if (openRequests.isEmpty)
          const Expanded(
            child: Center(child: Text("No open team requests.", style: TextStyle(color: Colors.grey))),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: openRequests.length,
              itemBuilder: (context, index) {
                final request = openRequests[index];
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.help_outline, color: Colors.cyan),
                  title: Text("${request.quantity}x ${request.itemName}"),
                  subtitle: Text("Requested by: ${request.requestedBy}"),
                );
              },
            ),
          ),
      ],
    );
  }
}