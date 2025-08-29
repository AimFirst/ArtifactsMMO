import 'dart:collection';
import 'package:flutter/foundation.dart';

class LogEntry {
  final DateTime timestamp;
  final String message;
  final LogLevel level;

  LogEntry(this.message, {this.level = LogLevel.info})
      : timestamp = DateTime.now();
}

enum LogLevel { info, warning, error }

class LogProvider with ChangeNotifier {
  final List<LogEntry> _logs = [];

  // Use an UnmodifiableListView to prevent direct modification from the UI
  UnmodifiableListView<LogEntry> get logs => UnmodifiableListView(_logs);

  void addLog(String message, {LogLevel level = LogLevel.info}) {
    // Add new logs to the beginning of the list to show them at the top
    _logs.insert(0, LogEntry(message, level: level));
    // To prevent the list from growing indefinitely, cap it at 200 entries
    if (_logs.length > 200) {
      _logs.removeLast();
    }
    notifyListeners();
  }
}
