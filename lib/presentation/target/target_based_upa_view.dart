import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_item_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TargetBasedUpaView extends BaseView<TargetBasedUpaModel, TargetBasedUpaViewModel> {
  const TargetBasedUpaView._({required super.viewModel, super.key});

  factory TargetBasedUpaView({required BuildContext context, Key? key}) {
    return TargetBasedUpaView._(
      viewModel: Provider.of<TargetBasedUpaViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(TargetBasedUpaModel value) {
    switch (value) {
      case TargetBasedUpaModelLoading a:
        return _widgetLoading(a);
      case TargetBasedUpaModelError a:
        return _widgetError(a);
      case TargetBasedUpaModelLoaded a:
        return _widgetLoaded(a);
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

  Widget _widgetLoaded(TargetBasedUpaModelLoaded model) {
    return Text('Processing: ${model.state.processResult.description}');

  }
}
