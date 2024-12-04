import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/artifacts_impl.dart';
import 'package:artifacts_mmo/presentation/map/map_view_model.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_view_model.dart';
import 'package:artifacts_mmo/presentation/map/map_view.dart';
import 'package:artifacts_mmo/presentation/resources/resources_view.dart';
import 'package:artifacts_mmo/presentation/resources/resources_view_model.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_view.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_view_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_view.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'infrastructure/api/artifacts_api.dart';

Future<void> main() async {
  _registerDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) =>
      SkillsOverviewViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
        ResourcesViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
        InventoryViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
        MapViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) => TargetBasedUpaViewModel(artifactsClient: GetIt.I(), stateManager: GetIt.I()))
  ], child: const MyApp()));
}

void _registerDependencies() {
  GetIt.I.registerLazySingleton<ArtifactsClient>(() => ArtifactsImpl());
  GetIt.I.registerLazySingleton(() => StateManager(artifactsClient: GetIt.I()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.purpleAccent,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[

            NavigationDestination(
              icon: Icon(Icons.smart_toy_outlined),
              label: 'UPA',
              selectedIcon: Icon(Icons.smart_toy),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Skills',
              selectedIcon: Icon(Icons.person),
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory_outlined),
              label: 'Inventory',
              selectedIcon: Icon(Icons.inventory),
            ),
            NavigationDestination(
              icon: Icon(Icons.account_tree_outlined),
              label: 'Resources',
              selectedIcon: Icon(Icons.account_tree),
            ),
            NavigationDestination(
              icon: Icon(Icons.maps_home_work_outlined),
              label: 'Maps',
              selectedIcon: Icon(Icons.maps_home_work),
            ),
          ],
        ),
        body: _widgetForIndex(currentPageIndex),
      ),
    );
  }

  Widget _widgetForIndex(int index) {
    switch (index) {
      case 0:
        return TargetBasedUpaView(context: context);
      case 1:
        return SkillsOverviewView(context: context);
      case 2:
        return InventoryView(context: context);
      case 3:
        return ResourcesView(context: context);
      case 4:
        return MapView(context: context);
      default:
        return Text('tab $index');
    }
  }
}
