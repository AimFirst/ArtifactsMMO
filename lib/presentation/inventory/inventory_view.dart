import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_item_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_model.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryView extends BaseView<InventoryModel, InventoryViewModel> {
  const InventoryView._({required super.viewModel, super.key});

  factory InventoryView({required BuildContext context, Key? key}) {
    return InventoryView._(
      viewModel: Provider.of<InventoryViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(BuildContext context, InventoryModel value) {
    switch (value) {
      case InventoryModelLoading a:
        return _widgetLoading(a);
      case InventoryModelError a:
        return _widgetError(a);
      case InventoryModelLoaded a:
        return _widgetLoaded(a);
    }
  }

  Widget _widgetLoading(InventoryModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(InventoryModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(InventoryModelLoaded model) {
    return GridView.builder(
        itemCount: model.items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return InventoryItemView(item: model.items[index]);
        });
  }
}
