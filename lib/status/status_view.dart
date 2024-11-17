import 'package:artifacts_mmo/status/status_model.dart';
import 'package:artifacts_mmo/status/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusView extends StatelessWidget {
  final StatusViewModel viewModel;

  const StatusView._({required this.viewModel, super.key});

  factory StatusView({required BuildContext context, Key? key}) {
    final view = StatusView._(
      viewModel: Provider.of<StatusViewModel>(context, listen: false),
      key: key,
    );
    view.init(context: context);
    return view;
  }

  void init({required BuildContext context}) {
    viewModel.viewInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StatusViewModel>(builder:
          (BuildContext context, StatusViewModel value, Widget? child) {
        return _widgetForState(value.model);
      }),
    );
  }

  Widget _widgetForState(StatusModel value) {
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
            Center(
              child: Text('Level: ${model.character.level}'),
            ),
            Center(
                child: Text(
                    'Location: ${model.character.location.x}, ${model.character.location.y}')),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: _directionPad(),
        ),
      ],
    );
  }

  Widget _directionPad() {
    return Column(children: [
      TextButton(onPressed: viewModel.moveLeft, child: const Text("Left")),
      TextButton(onPressed: viewModel.moveUp, child: const Text("Up")),
      TextButton(onPressed: viewModel.moveRight, child: const Text("Right")),
      TextButton(onPressed: viewModel.moveDown, child: const Text("Down")),
    ],);
  }
}
