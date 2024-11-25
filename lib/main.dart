import 'package:artifacts_mmo/infrastructure/api/impl/artifacts_impl.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_view.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_view_model.dart';
import 'package:artifacts_mmo/presentation/resources/resources_view.dart';
import 'package:artifacts_mmo/presentation/resources/resources_view_model.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_view.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_view_model.dart';
import 'package:artifacts_mmo/presentation/status/status_view.dart';
import 'package:artifacts_mmo/presentation/status/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'infrastructure/api/artifacts_api.dart';

Future<void> main() async {
  _registerDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) =>
          StatusViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
      SkillsOverviewViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
        ResourcesViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
    ChangeNotifierProvider(create: (_) =>
        InventoryViewModel(artifactsClient: GetIt.I<ArtifactsClient>()),
    ),
  ], child: const MyApp()));
}

void _registerDependencies() {
  GetIt.I.registerFactory<ArtifactsClient>(() => ArtifactsImpl());
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
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
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
          ],
        ),
        body: _widgetForIndex(currentPageIndex),
      ),
    );
  }

  Widget _widgetForIndex(int index) {
    switch (index) {
      case 0:
        return StatusView(context: context);
      case 1:
        return SkillsOverviewView(context: context);
      case 2:
        return InventoryView(context: context);
      case 3:
        return ResourcesView(context: context);
      default:
        return Text('tab $index');
    }
  }
}
