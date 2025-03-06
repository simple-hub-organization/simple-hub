import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_printer_entity/generic_printer_validators.dart';
import 'package:dartz/dartz.dart';

class GenericPrinterSwitchState extends ValueObjectCore<String> {
  factory GenericPrinterSwitchState(String? input) {
    assert(input != null);
    return GenericPrinterSwitchState._(
      validateGenericPrinterStateNotEmpty(input!),
    );
  }

  const GenericPrinterSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> printerValidActions() {
    return printerAllValidActions();
  }
}
