import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AppLogger {
  AppLogger({
    this.filePrefix = 'ai-app',
  });

  IOSink? _sink;
  Timer? _flushTimer;
  final String filePrefix;

  Future<void> initialize() async {
    try {
      final directory = await getApplicationSupportDirectory();
      final logDirectory = Directory(p.join(directory.path, 'logs'));
      if (!await logDirectory.exists()) {
        await logDirectory.create(recursive: true);
      }

      final fileName = '$filePrefix-${DateTime.now().toIso8601String().split('T').first}.log';
      _sink = File(p.join(logDirectory.path, fileName)).openWrite(mode: FileMode.append);
    } catch (_) {
      _sink = null;
    }
  }

  Future<void> info(String category, String message) => _write('INFO', category, message);

  Future<void> warning(String category, String message) => _write('WARN', category, message);

  Future<void> error(String category, String message, [Object? error, StackTrace? stackTrace]) {
    final buffer = StringBuffer(message);
    if (error != null) {
      buffer.writeln();
      buffer.write(error);
    }
    if (stackTrace != null) {
      buffer.writeln();
      buffer.write(stackTrace);
    }
    return _write('ERROR', category, buffer.toString());
  }

  Future<void> _write(String level, String category, String message) async {
    final now = DateTime.now();
    final line = '${now.toIso8601String()} [$level] $category - $message';
    developer.log(
      message,
      name: category,
      level: _toDeveloperLevel(level),
      time: now,
    );
    debugPrint(line);

    final sink = _sink;
    if (sink == null) {
      return;
    }

    try {
      sink.writeln(line);
      _scheduleFlush(immediate: level == 'ERROR');
    } catch (_) {
      _flushTimer?.cancel();
      _flushTimer = null;
      _sink = null;
    }
  }

  void _scheduleFlush({required bool immediate}) {
    if (_sink == null) {
      return;
    }

    if (immediate) {
      _flushTimer?.cancel();
      _flushTimer = null;
      unawaited(_flushSafely());
      return;
    }

    if (_flushTimer != null) {
      return;
    }

    _flushTimer = Timer(const Duration(seconds: 1), () {
      _flushTimer = null;
      unawaited(_flushSafely());
    });
  }

  Future<void> _flushSafely() async {
    final sink = _sink;
    if (sink == null) {
      return;
    }

    try {
      await sink.flush();
    } catch (_) {
      _flushTimer?.cancel();
      _flushTimer = null;
      _sink = null;
    }
  }

  int _toDeveloperLevel(String level) {
    switch (level) {
      case 'WARN':
        return 900;
      case 'ERROR':
        return 1000;
      default:
        return 800;
    }
  }
}
