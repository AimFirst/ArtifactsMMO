import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_progress.dart';
import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/target/map_view.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TargetBasedUpaView
    extends BaseView<TargetBasedUpaModel, TargetBasedUpaViewModel> {
  const TargetBasedUpaView._({required super.viewModel, super.key});

  factory TargetBasedUpaView({required BuildContext context, Key? key}) {
    return TargetBasedUpaView._(
      viewModel: Provider.of<TargetBasedUpaViewModel>(context, listen: false),
      key: key,
    );
  }

  CharacterState _characterState(TargetBasedUpaModelLoaded model) {
    return model.state.characterStates[model.selectedChar] ??
        CharacterState.empty();
  }

  @override
  Widget widgetForState(BuildContext context, TargetBasedUpaModel value) {
    switch (value) {
      case TargetBasedUpaModelLoading a:
        return _widgetLoading(a);
      case TargetBasedUpaModelError a:
        return _widgetError(a);
      case TargetBasedUpaModelLoaded a:
        return _widgetLoaded(context, a);
    }
  }

  Widget _widgetLoading(TargetBasedUpaModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(TargetBasedUpaModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(BuildContext context, TargetBasedUpaModelLoaded model) {
    final selectedMenuItem =
        model.menuOptions.where((m) => m.selected).firstOrNull;
    return Stack(
      children: [
        Positioned(left: 0, top: 0, right: 0, bottom: 0, child: _mapWidget(model)),
        Positioned(left: 5, top: 5, child: _statusWidget(context, model)),
        Positioned(
          right: 5,
          bottom: 5,
          child: _menuOptions(model, viewModel),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: _characterList(context, model, viewModel),
        ),
        if (selectedMenuItem != null)
          Positioned(
            left: 30,
            right: 30,
            bottom: 150,
            top: 150,
            child: _selectedMenu(model, selectedMenuItem),
          ),
      ],
    );
  }

  Widget _mapWidget(TargetBasedUpaModelLoaded model) {
    return MapView(model: model,);
    // const rows = 5;
    // const columns = 5;
    //
    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     childAspectRatio: 1,
    //     crossAxisCount: columns, // 5 columns
    //   ),
    //   itemCount: rows * columns,
    //   itemBuilder: (BuildContext context, int index) {
    //     final row = index ~/ rows;
    //     final column = index % columns;
    //
    //     final x = _characterState(model).character.location.x +
    //         (column - columns ~/ 2);
    //     final y =
    //         _characterState(model).character.location.y + (row - rows ~/ 2);
    //
    //     final mapLocation = model.state.boardState.map[Location(x: x, y: y)];
    //
    //     // Replace with your image URLs
    //     final mapTileImageUrl = mapLocation?.url ?? '';
    //     final mapImage = CachedNetworkImage(
    //       imageUrl: mapTileImageUrl,
    //       fit: BoxFit.cover, // Adjust the fit as needed
    //     );
    //
    //     if (row == rows ~/ 2 && column == columns ~/ 2) {
    //       final characterUrl = _characterState(model).character.imageUrl;
    //       return Stack(
    //         children: [
    //           mapImage,
    //           Center(
    //             child: FractionallySizedBox(
    //               widthFactor: 0.25,
    //               child: CachedNetworkImage(
    //                 imageUrl: characterUrl,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     }
    //
    //     return mapImage;
    //   },
    // );
  }

  Widget _statusWidget(BuildContext context, TargetBasedUpaModelLoaded model) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * .25,
        maxWidth: MediaQuery.of(context).size.width * .50,
      ),
      child: Card(
        color: const Color.fromARGB(230, 255, 255, 255),
        child: InkWell(
          onTap: viewModel.onCancelTarget,
          child: ListTile(
            leading: _characterState(model).processResult.imageUrl != null
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CachedNetworkImage(
                      imageUrl: _characterState(model).processResult.imageUrl!,
                    ))
                : null,
            title: Text(_characterState(model).target.name),
            subtitle: Text(_characterState(model).processResult.description),
          ),
        ),
      ),
    );
  }

  Widget _characterStatusPanel(BuildContext context,
      TargetBasedUpaModelLoaded model, CharacterState characterState) {
    final secondsCooldown = characterState.character.cooldownLeftSeconds;
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .25,
          maxWidth: MediaQuery.of(context).size.width * .25),
      child: Card(
        color: characterState.character.name == model.selectedChar
            ? const Color.fromARGB(230, 200, 200, 255)
            : const Color.fromARGB(230, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    characterState.character.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text('Level ${characterState.character.overall.level}'),
                ],
              ),
              _progressBarWithText(0, characterState.character.maxHp,
                  characterState.character.hp, 'HP', Colors.red),
              const SizedBox(
                height: 2,
                width: 1,
              ),
              _progressBarWithText(
                  0,
                  characterState.character.overall.nextLevelTargetXp,
                  characterState.character.overall.xp,
                  'XP',
                  Colors.green),
              const SizedBox(
                height: 2,
                width: 1,
              ),
              Countdown(
                key: Key(
                    'countdown:${characterState.character.cooldownEnd.toString()}'),
                seconds: secondsCooldown,
                interval: const Duration(milliseconds: 10),
                build: (BuildContext context, double timeLeft) {
                  return LinearProgressIndicator(
                    value: timeLeft <= 0 ? 0 : timeLeft / secondsCooldown,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _characterList(BuildContext context, TargetBasedUpaModelLoaded model,
      TargetBasedUpaViewModel viewModel) {
    return Column(
      children: model.state.characterStates.values
          .map((c) => InkWell(
              onTap: () => viewModel.onCharacterSelected(c.character),
              child: _characterStatusPanel(context, model, c)))
          .toList(),
    );
  }

  Widget _progressBarWithText(
      int min, int max, int current, String label, Color color) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: 30,
        child: Stack(
          children: [
            SizedBox.expand(
              child: LinearProgressIndicator(
                value: current / max,
                color: color,
              ),
            ),
            Center(
              child: Text('$current/$max $label'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuOptions(
      TargetBasedUpaModelLoaded model, TargetBasedUpaViewModel viewModel) {
    return Row(
      children: model.menuOptions
          .map((o) => _menuOption(
                imageUrl: o.url,
                name: o.name,
                selected: o.selected,
                onSelect: () => viewModel.updateSelectedMenuItem(o),
              ))
          .toList(),
    );
  }

  Widget _selectedMenu(TargetBasedUpaModelLoaded model, MenuOption option) {
    return Card(
      color: const Color.fromARGB(230, 255, 255, 255),
      child: Column(
        children: [
          Text(_titleForOption(model, option)),
          Expanded(child: _menuForOption(model, option)),
        ],
      ),
    );
  }

  String _titleForOption(TargetBasedUpaModelLoaded model, MenuOption option) {
    switch (option.type) {
      case MenuItemType.logs:
        return 'Logs';
      case MenuItemType.items:
        return 'Items';
      case MenuItemType.tasks:
        return 'Tasks';
      case MenuItemType.inventory:
        return 'Inventory (${_characterState(model).character.inventory.items.count()}/${_characterState(model).character.inventory.maxCount})';
      case MenuItemType.skills:
        return 'Skills';
      case MenuItemType.bank:
        return 'Bank (${model.state.boardState.bank.items.length}/${model.state.boardState.bank.bankDetails.slots})';
      case MenuItemType.team:
        return 'Team';
    }
  }

  Widget _menuForOption(TargetBasedUpaModelLoaded model, MenuOption option) {
    switch (option.type) {
      case MenuItemType.logs:
        return _menuForLogs(model, viewModel);
      case MenuItemType.items:
        return _menuForItems(model, viewModel);
      case MenuItemType.inventory:
        return _menuForInventory(model, viewModel);
      case MenuItemType.skills:
        return _menuForSkills(model, viewModel);
      case MenuItemType.tasks:
        return _menuForTasks(model, viewModel);
      case MenuItemType.bank:
        return _menuForBank(model, viewModel);
      case MenuItemType.team:
        return _menuForTeam(model, viewModel);
    }
  }

  Widget _menuForInventory(
    TargetBasedUpaModelLoaded model,
    TargetBasedUpaViewModel viewModel,
  ) {
    return GridView.builder(
        itemCount: _characterState(model).character.inventory.items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final inventoryItem =
              _characterState(model).character.inventory.items[index];
          final item =
              model.state.boardState.items.itemByCode(inventoryItem.code);
          final controller =
              TextEditingController(text: '${inventoryItem.quantity}');
          return InkWell(
            onTap: null,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(230, 255, 255, 255)),
              child: Column(
                children: [
                  Text(item.name),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: item.imageUrl,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                  FilledButton(
                    onPressed: () => viewModel.onItemDestroy(
                        item, int.parse(controller.text)),
                    child: const Text('Maintain'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _menuForItems(
    TargetBasedUpaModelLoaded model,
    TargetBasedUpaViewModel viewModel,
  ) {
    return GridView.builder(
        itemCount: model.state.boardState.items.allItems.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = model.state.boardState.items.allItems[index];
          final controller = TextEditingController();
          return InkWell(
            onTap: null,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(230, 255, 255, 255)),
              child: Column(
                children: [
                  Text(item.name),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: item.imageUrl,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                  FilledButton(
                    onPressed: () => viewModel.onItemCraft(
                        item,
                        _characterState(model).character,
                        int.parse(controller.text)),
                    child: const Text('Craft'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _menuForSkills(
    TargetBasedUpaModelLoaded model,
    TargetBasedUpaViewModel viewModel,
  ) {
    final skills = [
      ..._characterState(model).character.allSkills,
      _characterState(model).character.overall
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: skills.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          width: 1,
          height: 15,
        ),
        itemBuilder: (context, index) {
          final skill = skills[index];
          return _skillWidget(skill);
        },
      ),
    );
  }

  Widget _skillWidget(Skill skill) {
    return InkWell(
      onTap: () => viewModel.onSkillSelected(skill),
      child: Card(
        color: const Color.fromARGB(230, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CachedNetworkImage(imageUrl: skill.skillType.image),
              const SizedBox(
                width: 20,
                height: 1,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${skill.skillType.name} (Level ${skill.level})'),
                    const SizedBox(
                      width: 1,
                      height: 4,
                    ),
                    _progressBarWithText(0, skill.nextLevelTargetXp, skill.xp,
                        'XP', Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuForTasks(
    TargetBasedUpaModelLoaded model,
    TargetBasedUpaViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (_characterState(model).character.taskProgress != null)
            _inProgressTask(
              _characterState(model).character.taskProgress!,
              model.state.boardState,
            ),
          Expanded(
            child: ListView.separated(
              itemCount: model.state.boardState.tasks.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                width: 1,
                height: 15,
              ),
              itemBuilder: (context, index) {
                final task = model.state.boardState.tasks[index];
                return _taskWidget(task);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _inProgressTask(
    TaskProgress taskProgress,
    BoardState boardState,
  ) {
    final task =
        boardState.tasks.where((t) => t.code == taskProgress.taskCode).first;
    return InkWell(
      onTap: () => viewModel.onCurrentTaskTap(taskProgress),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${task.type}: ${task.code}'),
            _progressBarWithText(
                0, taskProgress.total, taskProgress.progress, '', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _taskWidget(Task task) {
    return InkWell(
        onTap: () => viewModel.onTaskTap(task),
        child: Card(child: Text('$task')));
  }

  Widget _menuForBank(
    TargetBasedUpaModelLoaded model,
    TargetBasedUpaViewModel viewModel,
  ) {
    return GridView.builder(
        itemCount: model.state.boardState.bank.items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final inventoryItem = model.state.boardState.bank.items[index];
          final item =
              model.state.boardState.items.itemByCode(inventoryItem.code);
          final controller =
              TextEditingController(text: '${inventoryItem.quantity}');
          return InkWell(
            onTap: null,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(230, 255, 255, 255)),
              child: Column(
                children: [
                  Text(item.name),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: item.imageUrl,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                  FilledButton(
                    onPressed: () => viewModel.onItemDestroy(
                        item, int.parse(controller.text)),
                    child: const Text('Maintain'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _menuForLogs(
      TargetBasedUpaModelLoaded model,
      TargetBasedUpaViewModel viewModel,
      ) {
    final logs = model.state.characterStates[model.selectedChar]?.characterLog ?? [];
    return ListView.separated(itemBuilder: (context, index) => Text(logs[index]), separatorBuilder: (context, index) => const SizedBox(
      width: 1,
      height: 15,
    ), itemCount: logs.length);
  }

  Widget _menuForTeam(
      TargetBasedUpaModelLoaded model,
      TargetBasedUpaViewModel viewModel,
      ) {
    return Column(
      children: [
        Text((model.teamState.playerSkillRolesMap[model.selectedChar] ?? []).fold('a', (o, n) => '$o,$n')),
        Expanded(
          child: ListView.separated(itemBuilder: (context, index) =>
              _teamItemWidget(model.teamState.neededItems.list[index]), separatorBuilder: (context, index) => const SizedBox(
            width: 1,
            height: 15,
          ), itemCount: model.teamState.neededItems.list.length),
        ),
      ],
    );
  }

  Widget _teamItemWidget(PrioritizedElement<UniqueItemQuantityRequest> requestedItem) {
    return Row(children: [
      Text(requestedItem.element.requestingCharacter),
      Text(requestedItem.element.key),
      Text('${requestedItem.element.item.name} x${requestedItem.element.quantityRemaining}'),
    ],);
  }

  Widget _menuOption({
    required String imageUrl,
    required String name,
    required bool selected,
    required void Function() onSelect,
  }) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        color: selected ? const Color.fromARGB(230, 255, 255, 255) : null,
        child: Column(children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CachedNetworkImage(imageUrl: imageUrl),
          ),
          Center(child: Text(name)),
        ]),
      ),
    );
  }
}
