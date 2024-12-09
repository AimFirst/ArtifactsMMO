import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'character_state.g.dart';

@CopyWith()
class CharacterState with EquatableMixin {
  final Character character;
  final Target target;
  final TargetProcessResult processResult;

  CharacterState({
    required this.character,
    required this.target,
    required this.processResult,
  });

  CharacterState.empty()
      : character = Character.empty(),
        target = NoTarget(),
        processResult = TargetProcessResult.empty();

  @override
  List<Object?> get props => [
        character,
        target,
        processResult,
      ];
}
