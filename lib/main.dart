import 'package:artifacts_mmo/infrastructure/api/impl/artifacts_impl.dart';
import 'package:artifacts_mmo/status/status_view.dart';
import 'package:artifacts_mmo/status/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'infrastructure/api/artifacts_api.dart';

void main() {
  _registerDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) =>
            StatusViewModel(artifactsClient: GetIt.I<ArtifactsClient>())),
  ], child: const MyApp()));
}

void _registerDependencies() {
  GetIt.I.registerFactory<ArtifactsClient>(() => ArtifactsImpl());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
          child: StatusView(
            context: context,
          )),
    );
  }
}
