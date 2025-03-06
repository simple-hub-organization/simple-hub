import 'package:logger/logger.dart';

/// Instance of logger for all the app
final icLogger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(methodCount: 0),
);
