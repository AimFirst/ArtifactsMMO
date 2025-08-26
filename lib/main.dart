// lib/main.dart

import 'package:artifacts_mmo/home_page.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/api_client.dart';
import 'providers/team_provider.dart';

void main() {
  // --- CONFIGURATION ---
  const String YOUR_BEARER_TOKEN = String.fromEnvironment('ARTIFACTS_TOKEN');
  // -------------------

  // 1. Create the ApiClient instance
  final apiClient = ApiClient(YOUR_BEARER_TOKEN);

  runApp(
    // Use MultiProvider to provide both TeamProvider and MapProvider
    MultiProvider(
      providers: [
        // Add the LogProvider
        ChangeNotifierProvider(create: (_) => LogProvider()),
        ChangeNotifierProvider(
          create: (context) => MapProvider(apiClient),
        ),
        ChangeNotifierProxyProvider<MapProvider, TeamProvider>(
          // TeamProvider now depends on MapProvider
          create: (context){

            // --- Initialize the LoggerService ---
            // This is a great place to do it since TeamProvider is our main service
            LoggerService.instance.init(context.read<LogProvider>());

            return TeamProvider(
            apiClient,
            // Pass the initial (likely null) MapProvider
            context.read<MapProvider>(),
          );},
          update: (context, mapProvider, previousTeamProvider) {
            // This will rebuild TeamProvider when MapProvider gets the map data
            previousTeamProvider!.updateMapProvider(mapProvider);
            return previousTeamProvider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Defines the light theme
      darkTheme: ThemeData.dark(), // Defines the dark theme
      themeMode: ThemeMode.system, // Uses the system's theme preference
      title: 'Artifacts MMO Manager',
      home: HomePage(), // We'll build this next
    );
  }
}