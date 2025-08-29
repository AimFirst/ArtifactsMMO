// lib/services/logger_service.dart

import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:flutter/material.dart';

// A simple singleton service to provide global access to logging.
class LoggerService {
  // Make the constructor private
  LoggerService._privateConstructor();

  // The single, static instance of the class
  static final LoggerService instance = LoggerService._privateConstructor();

  LogProvider? _logProvider;

  // Method to initialize the service with the provider instance
  void init(LogProvider provider) {
    _logProvider = provider;
  }

  // The global log method
  void log(String message, {LogLevel level = LogLevel.info}) {
    // Replace the old print() statements
    debugPrint("[${level.name.toUpperCase()}] $message");

    _logProvider?.addLog(message, level: level);
  }
}
