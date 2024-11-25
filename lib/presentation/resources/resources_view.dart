import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/resources/resource_view.dart';
import 'package:artifacts_mmo/presentation/resources/resources_model.dart';
import 'package:artifacts_mmo/presentation/resources/resources_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourcesView extends BaseView<ResourcesModel, ResourcesViewModel> {

  const ResourcesView._({required super.viewModel, super.key});

  factory ResourcesView({required BuildContext context, Key? key}) {
    return ResourcesView._(
      viewModel: Provider.of<ResourcesViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(ResourcesModel value) {
    switch (value) {
      case ResourcesModelLoading a:
        return _widgetLoading(a);
      case ResourcesModelError a:
        return _widgetError(a);
      case ResourcesModelLoaded a:
        return _widgetLoaded(a);
    }
  }

  Widget _widgetLoading(ResourcesModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(ResourcesModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(ResourcesModelLoaded model) {
    return ListView.builder(
        itemCount: model.resources.length,
        itemBuilder: (BuildContext context, int index) {
          return ResourceView(resource: model.resources[index]);
        });
  }
}
