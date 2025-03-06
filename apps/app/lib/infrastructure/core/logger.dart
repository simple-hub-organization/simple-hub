import 'package:logger/logger.dart';

/// Instance of logger for all the app
final logger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(methodCount: 0),
);
