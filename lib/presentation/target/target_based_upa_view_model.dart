import 'package:artifacts_mmo/business/state/character_log.dart';
import 'package:artifacts_mmo/business/state/character_target_manager.dart';
import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_skill_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_progress.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';

class TargetBasedUpaViewModel extends BaseViewModel<TargetBasedUpaModel> {
  final ArtifactsClient artifactsClient;
  final StateManager stateManager;
  final _menuOptions = {
    MenuItemType.logs: MenuOption(
      type: MenuItemType.logs,
      url: 'https://www.artifactsmmo.com/images/items/book_from_hell.png',
      name: 'Logs',
    ),
    MenuItemType.skills: MenuOption(
      type: MenuItemType.skills,
      url: 'https://artifactsmmo.com/images/items/iron_sword.png',
      name: 'Skills',
    ),
    MenuItemType.tasks: MenuOption(
      type: MenuItemType.tasks,
      url: 'https://artifactsmmo.com/images/items/forest_whip.png',
      name: 'Tasks',
    ),
    MenuItemType.inventory: MenuOption(
      type: MenuItemType.inventory,
      url: 'https://artifactsmmo.com/images/items/backpack.png',
      name: 'Inventory',
    ),
    MenuItemType.items: MenuOption(
      type: MenuItemType.items,
      url: 'https://artifactsmmo.com/images/items/ruby_book.png',
      name: 'Items',
    ),
    MenuItemType.bank: MenuOption(
      type: MenuItemType.bank,
      url: 'https://artifactsmmo.com/images/items/bag_of_gold.png',
      name: 'Bank',
    ),
    MenuItemType.team: MenuOption(
      type: MenuItemType.team,
      url: 'https://artifactsmmo.com/images/items/slime_shield.png',
      name: 'Team',
    ),
  };
  String selectedCharacter = '';

  TargetBasedUpaViewModel({
    required this.artifactsClient,
    required this.stateManager,
  }) : super(
          TargetBasedUpaModelLoading(),
        );

  @override
  Future<void> loadAsync() async {
    await stateManager.init();
    selectedCharacter = stateManager.characterTargetManagers.keys.first;

    stateManager.stateStream.listen((s) {
      value = TargetBasedUpaModelLoaded(
        state: s,
        menuOptions: _menuOptions.values.toList(),
        selectedChar: selectedCharacter,
        teamState: s.teamState,
      );
    });
  }

  @override
  TargetBasedUpaModelError errorModel(Error err) {
    return TargetBasedUpaModelError(error: err.toString());
  }

  void updateSelectedMenuItem(MenuOption option) {
    var currentOption = _menuOptions[option.type];
    currentOption = currentOption!.copyWith(selected: !currentOption.selected);
    _menuOptions
        .forEach((k, v) => _menuOptions[k] = v.copyWith(selected: false));
    _menuOptions[currentOption.type] = currentOption;
    final tempVal = value;
    if (tempVal is TargetBasedUpaModelLoaded) {
      value = tempVal.copyWith(menuOptions: _menuOptions.values.toList());
    }
  }

  CharacterTargetManager _getCurrentTargetManager() {
    final targetManager =
        stateManager.characterTargetManagers[selectedCharacter];
    if (targetManager == null) {
      throw ArtifactsException(
          errorMessage:
              'No character target manager with name $selectedCharacter');
    }
    return targetManager;
  }

  Future<void> onCancelTarget() async {
    await _getCurrentTargetManager().stopTargetBasedUpa();
  }

  Future<void> onItemDestroy(Item item, int maintainAmount) async {
    await _getCurrentTargetManager().startNewTarget(ManageInventoryTarget(
        maxItemQuantity:
            ItemQuantity(code: item.code, quantity: maintainAmount),
        parentTarget: null,
        characterLog: CharacterLog()));
  }

  Future<void> onItemCraft(
      Item item, Character character, int craftAmount) async {
    final currentCount = character.inventory.items.count(code: item.code);
    await _getCurrentTargetManager().startNewTarget(CraftItemTarget(
        itemQuantity:
            ItemQuantity(code: item.code, quantity: currentCount + craftAmount),
        parentTarget: null,
        characterLog: CharacterLog()));
  }

  Future<void> onCurrentTaskTap(TaskProgress task) async {
    if (task.progress == task.total) {
      await _getCurrentTargetManager().startNewTarget(
          CompleteTaskTarget(parentTarget: null, characterLog: CharacterLog()));
    } else {
      await _getCurrentTargetManager().startNewTarget(
          PerformTaskTarget(parentTarget: null, characterLog: CharacterLog()));
    }
  }

  Future<void> onTaskTap(Task task) async {
    await _getCurrentTargetManager().startNewTarget(
        AcceptTaskTarget(parentTarget: null, characterLog: CharacterLog()));
  }

  Future<void> onCharacterSelected(Character character) async {
    selectedCharacter = character.name;
    final tempVal = value;
    if (tempVal is TargetBasedUpaModelLoaded) {
      value = tempVal.copyWith(selectedChar: selectedCharacter);
    }
  }

  Future<void> onSkillSelected(Skill skill) async {
    if (skill.skillType == SkillType.overall) {
      await _getCurrentTargetManager().startNewTarget(FightLevelTarget(
        level: 99,
        parentTarget: null,
        characterLog: CharacterLog(),
      ));
    } else if (skill.skillType == SkillType.alchemy ||
        skill.skillType == SkillType.fishing ||
        skill.skillType == SkillType.woodcutting ||
        skill.skillType == SkillType.mining) {
      await _getCurrentTargetManager().startNewTarget(GatheringSkillTarget(
        skillType: skill.skillType,
        targetLevel: 99,
        parentTarget: null,
        characterLog: CharacterLog(),
      ));
    } else {
      await _getCurrentTargetManager().startNewTarget(CraftLevelTarget(
        skillType: skill.skillType,
        targetLevel: 99,
        parentTarget: null,
        characterLog: CharacterLog(),
      ));
    }
  }
}
