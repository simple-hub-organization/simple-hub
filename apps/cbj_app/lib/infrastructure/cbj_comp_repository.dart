part of 'package:cybearjinni/domain/cbj_comp/i_cbj_comp_repository.dart';

class _CbjCompRepository implements ICbjCompRepository {
  @override
  Future<Either<CbjCompFailure, Unit>> shutdownServer() async {
    await CreateTheCBJAppServer().shutdownServer();
    return right(unit);
  }

  @override
  Future<Either<CbjCompFailure, Unit>> firstSetup(
    CbjCompEntity cBJCompEntity,
  ) async {
    try {
      return left(const CbjCompFailure.unexpected());
    } catch (e) {
      return left(const CbjCompFailure.unexpected());
    }
  }

  @override
  Future<Either<CbjCompFailure, Unit>> create(CbjCompEntity deviceEntity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<CbjCompFailure, Unit>> devicesList(CbjCompEntity deviceEntity) {
    // TODO: implement devicesList
    throw UnimplementedError();
  }

  @override
  Future<Either<CbjCompFailure, Unit>> updateCompInfo(
    CbjCompEntity compEntity,
  ) async {
    try {
      return left(const CbjCompFailure.unexpected());
    } catch (e) {
      return left(const CbjCompFailure.unexpected());
    }
  }

  @override
  Stream<Either<CbjCompFailure, String>> getConnectedComputersIP() async* {
    try {
      final CreateTheCBJAppServer createTheCBJAppServer =
          CreateTheCBJAppServer();

      final StreamController<CompInfoSB> compInfoSBSteam =
          StreamController<CompInfoSB>();

      createTheCBJAppServer.createServer(compInfoSBSteam);

      yield* compInfoSBSteam.stream.map((CompInfoSB compInfoSB) {
        return right(compInfoSB.compIP);
      });
    } catch (e) {
      yield left(const CbjCompFailure.unexpected());
    }
    yield left(const CbjCompFailure.unexpected());
  }

  @override
  Future<Either<CbjCompFailure, CbjCompEntity>> getInformationFromDeviceByIp(
    String compIp,
  ) async {
    try {} catch (e) {
      return left(const CbjCompFailure.unexpected());
    }
    return left(const CbjCompFailure.unexpected());
  }
}
