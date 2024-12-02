import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TargetBasedUpaView
    extends BaseView<TargetBasedUpaModel, TargetBasedUpaViewModel> {
  const TargetBasedUpaView._({required super.viewModel, super.key});

  factory TargetBasedUpaView({required BuildContext context, Key? key}) {
    return TargetBasedUpaView._(
      viewModel: Provider.of<TargetBasedUpaViewModel>(context, listen: false),
      key: key,
    );
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
    return Stack(
      children: [
        _mapWidget(model),
        Positioned(left: 5, top: 5, child: _statusWidget(context, model)),
        Positioned(left: 5, bottom: 5, child: _characterStatusPanel(context, model)),
      ],
    );
  }

  Widget _mapWidget(TargetBasedUpaModelLoaded model) {
    const rows = 5;
    const columns = 5;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: columns, // 5 columns
      ),
      itemCount: rows * columns,
      itemBuilder: (BuildContext context, int index) {
        final row = index ~/ rows;
        final column = index % columns;

        final x = model.state.character.location.x + (column - columns ~/ 2);
        final y = model.state.character.location.y + (row - rows ~/ 2);

        final mapLocation = model.state.boardState.map[Location(x: x, y: y)];

        // Replace with your image URLs
        final mapTileImageUrl =
            'https://artifactsmmo.com/images/maps/${mapLocation?.skin}.png';
        final mapImage = CachedNetworkImage(
          imageUrl: mapTileImageUrl,
          fit: BoxFit.cover, // Adjust the fit as needed
        );

        if (row == rows ~/ 2 && column == columns ~/ 2) {
          final characterUrl =
              'https://artifactsmmo.com/images/characters/${model.state.character.skin}.png';
          return Stack(
            children: [
              mapImage,
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.25,
                  child: CachedNetworkImage(
                    imageUrl: characterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        }

        return mapImage;
      },
    );
  }

  Widget _statusWidget(BuildContext context, TargetBasedUpaModelLoaded model) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .25,
          maxWidth: MediaQuery.of(context).size.width * .50),
      child: Card(
        color: const Color.fromARGB(230, 255, 255, 255),
        child: ListTile(
          leading: model.state.processResult.imageUrl != null ? SizedBox(width: 20, height: 20, child: CachedNetworkImage(imageUrl: model.state.processResult.imageUrl!)) : null,
          title: Text(model.state.target.name),
          subtitle: Text(model.state.processResult.description),
        ),
      ),
    );
  }

  Widget _characterStatusPanel(BuildContext context, TargetBasedUpaModelLoaded model) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .25,
          maxWidth: MediaQuery.of(context).size.width * .50),
      child: Card(
        color: const Color.fromARGB(230, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Row(children: [
                Text(model.state.character.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                const Spacer(),
                Text('Level ${model.state.character.overall.level}'),
              ],),
              _progressBarWithText(0, model.state.character.maxHp, model.state.character.hp, 'HP', Colors.red),
              const SizedBox(height: 2, width: 1,),
              _progressBarWithText(0, model.state.character.overall.nextLevelTargetXp, model.state.character.overall.xp, 'XP', Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressBarWithText(int min, int max, int current, String label, Color color) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: 30,
        child: Stack(
          children: [SizedBox.expand(
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
}
