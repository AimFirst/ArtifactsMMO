import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/artifacts_impl.dart';
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
    ChangeNotifierProvider(
        create: (_) => TargetBasedUpaViewModel(
            artifactsClient: GetIt.I(), stateManager: GetIt.I()))
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
    final ThemeData theme = Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: SafeArea(
        child: Scaffold(
          body: TargetBasedUpaView(context: context),
        ),
      ),
    );
  }
}
