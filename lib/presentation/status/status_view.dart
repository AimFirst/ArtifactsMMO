import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/skill/skill_view.dart';
import 'package:artifacts_mmo/presentation/status/status_model.dart';
import 'package:artifacts_mmo/presentation/status/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusView extends BaseView<StatusModel, StatusViewModel> {
  const StatusView._({required super.viewModel, super.key});

  factory StatusView({required BuildContext context, Key? key}) {
    return StatusView._(
      viewModel: Provider.of<StatusViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(StatusModel value) {
    switch (value) {
      case StatusModelLoading a:
        return _widgetLoading(a);
      case StatusModelError a:
        return _widgetError(a);
      case StatusModelLoaded a:
        return _widgetLoaded(a);
    }
  }

  Widget _widgetLoading(StatusModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(StatusModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(StatusModelLoaded model) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Center(
              child: Text(model.character.name),
            ),
            SkillView(skill: model.character.overall),
            Center(
                child: Text(
                    'Location: ${model.character.location.x}, ${model.character.location.y}')),
            Center(
              child: Text(
                  'Inventory: ${model.character.inventoryItems.fold(0, (prev, newEl) => newEl.itemQuantity.quantity + prev)} / ${model.character.inventoryMaxItems}'),
            ),
            Center(
              child: OutlinedButton(onPressed: viewModel.gather, child: const Text('Gather')),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: _directionPad(),
        ),
        const Row(children: [],),
      ],
    );
  }

  Widget _directionPad() {
    return Column(
      children: [
        TextButton(onPressed: viewModel.moveLeft, child: const Text("Left")),
        TextButton(onPressed: viewModel.moveUp, child: const Text("Up")),
        TextButton(onPressed: viewModel.moveRight, child: const Text("Right")),
        TextButton(onPressed: viewModel.moveDown, child: const Text("Down")),
      ],
    );
  }
}
