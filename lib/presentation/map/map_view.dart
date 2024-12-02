import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/map/map_item_view.dart';
import 'package:artifacts_mmo/presentation/map/map_model.dart';
import 'package:artifacts_mmo/presentation/map/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapView extends BaseView<MapModel, MapViewModel> {
  const MapView._({required super.viewModel, super.key});

  factory MapView({required BuildContext context, Key? key}) {
    return MapView._(
      viewModel: Provider.of<MapViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(BuildContext context, MapModel value) {
    switch (value) {
      case MapModelLoading a:
        return _widgetLoading(a);
      case MapModelError a:
        return _widgetError(a);
      case MapModelLoaded a:
        return _widgetLoaded(a);
    }
  }

  Widget _widgetLoading(MapModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(MapModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(MapModelLoaded model) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Content'),
                controller: viewModel.textEditingController,
              ),
            ),
            Wrap(children: [
              OutlinedButton(
                  onPressed: viewModel.searchMap, child: const Text('Search')),
            ]),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: model.locations.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async => viewModel.moveTo(model.locations[index]),
                child: MapItemView(
                  mapLocation: model.locations[index],
                  characterLocation: model.characterLocation,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Container(
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}
