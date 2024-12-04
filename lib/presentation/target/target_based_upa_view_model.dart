import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
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

  TargetBasedUpaViewModel(
      {required this.artifactsClient, required this.stateManager})
      : super(TargetBasedUpaModelLoading());

  @override
  Future<void> loadAsync() async {
    await stateManager.init();

    stateManager.stateStream.listen((s) {
      value = TargetBasedUpaModelLoaded(
        state: s,
        menuOptions: _menuOptions.values.toList(),
      );
    });

    stateManager.startTargetBasedUpa();
  }

  @override
  TargetBasedUpaModelError errorModel(Error err) {
    return TargetBasedUpaModelError(error: err.toString());
  }

  void updateSelectedMenuItem(MenuOption option) {
    var currentOption = _menuOptions[option.type];
    currentOption = currentOption!.copyWith(selected: !currentOption.selected);
    _menuOptions.forEach((k, v) => _menuOptions[k] = v.copyWith(selected: false));
    _menuOptions[currentOption.type] = currentOption;
    final tempVal = value;
    if (tempVal is TargetBasedUpaModelLoaded) {
      value = tempVal.copyWith(menuOptions: _menuOptions.values.toList());
    }
  }

  Future<void> onItemTap(Item item) async {
    await stateManager.startNewTarget(CraftItemTarget(itemQuantity: ItemQuantity(code: item.code, quantity: 1)));
  }
}
