import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class ReturnSmartDeviceObject extends UseCase {
  @override
  Future<Either<Failure, SmartDeviceBaseAbstract>> call(dynamic params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
