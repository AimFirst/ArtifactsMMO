import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:flutter/material.dart';

abstract class BaseView<M extends BaseModel, V extends BaseViewModel<M>> extends StatelessWidget {
  final V viewModel;

  const BaseView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel,
        builder:
            (BuildContext context, M value, Widget? child) {
          return widgetForState(value);
        });
  }

  Widget widgetForState(M value);
}
