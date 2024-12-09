import 'package:artifacts_mmo/business/state/character_target_manager.dart';
import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_progress.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';

class TargetBasedUpaViewModel extends BaseViewModel<TargetBasedUpaModel> {
  final ArtifactsClient artifactsClient;
  final StateManager stateManager;
  final _menuOptions = {
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
    final targetManager = stateManager.characterTargetManagers[selectedCharacter];
    if (targetManager == null) {
      throw ArtifactsException(errorMessage: 'No character target manager with name $selectedCharacter');
    }
    return targetManager;
  }

  Future<void> onCancelTarget() async {
    await _getCurrentTargetManager().stopTargetBasedUpa();
  }

  Future<void> onItemDestroy(Item item, int maintainAmount) async {
    await _getCurrentTargetManager().startNewTarget(ManageInventoryTarget(
        maxItemQuantity:
            ItemQuantity(code: item.code, quantity: maintainAmount)));
  }

  Future<void> onItemCraft(
      Item item, Character character, int craftAmount) async {
    final currentCount = character.inventoryItems.fold(
        0,
        (p, s) =>
            p +
            ((s.itemQuantity.code == item.code) ? s.itemQuantity.quantity : 0));
    await _getCurrentTargetManager().startNewTarget(CraftItemTarget(
        itemQuantity: ItemQuantity(
            code: item.code, quantity: currentCount + craftAmount)));
  }

  Future<void> onCurrentTaskTap(TaskProgress task) async {
    if (task.progress == task.total) {
      await _getCurrentTargetManager().startNewTarget(CompleteTaskTarget());
    } else {
      await _getCurrentTargetManager().startNewTarget(PerformTaskTarget());
    }
  }

  Future<void> onTaskTap(Task task) async {
    await _getCurrentTargetManager().startNewTarget(AcceptTaskTarget());
  }
}
