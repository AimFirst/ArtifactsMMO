import 'package:equatable/equatable.dart';

class CharacterLog with EquatableMixin {

  final List<List<String>> logs = [];

  void startNewLogSet() {
    logs.add([]);
    if (logs.length > 5) {
      logs.removeAt(0);
    }
  }

  List<String> get current => logs.isEmpty ? [] : logs.last;

  void addLog(String log) {
    current.add(log);
  }

  @override
  List<Object?> get props => logs;

}