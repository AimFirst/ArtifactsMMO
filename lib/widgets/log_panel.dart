import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/log_provider.dart';
import 'package:intl/intl.dart'; // Add intl package to pubspec.yaml for date formatting

class LogPanel extends StatelessWidget {
  const LogPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<LogProvider>();

    return Container(
      color: Colors.black.withValues(alpha: 0.2),
      child: ListView.builder(
        itemCount: logProvider.logs.length,
        reverse: false, // Since we add to the top, we don't need to reverse
        itemBuilder: (context, index) {
          final entry = logProvider.logs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${DateFormat('HH:mm:ss').format(entry.timestamp)}: ',
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
    );
  }
}
