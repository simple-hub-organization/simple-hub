import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: IntroductionRouteRoute.page),
    AutoRoute(page: ConnectToHubRoute.page),
    AutoRoute(page: ConnectToHubMoreRoute.page),
    AutoRoute(page: ChooseDeviceVendorToAddRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: ChangeAreaForDevicesRoute.page),
    AutoRoute(page: AddNewAreaRoute.page),
    AutoRoute(page: PlusButtonRoute.page),
    AutoRoute(page: RemotePipesRoute.page),
    AutoRoute(page: SoftwareInfoRoute.page),
    AutoRoute(page: ScenesRoute.page),
    AutoRoute(page: AddSceneRoute.page),
    AutoRoute(page: AddRoutineRoute.page),
    AutoRoute(page: PickRepeatTimeRoute.page),
    AutoRoute(page: AddBindingRoute.page),
    AutoRoute(page: AddActionRoute.page),
    AutoRoute(page: ChooseAutomationTypeToAddRoute.page),
    AutoRoute(page: ChooseDeviceVendorToAddRoute.page),
    AutoRoute(page: ConnectToHomeWifiRoute.page),
    AutoRoute(page: OpenAccessPointRoute.page),
    AutoRoute(page: ScanForNewCBJCompsRoute.page),
    AutoRoute(page: ConfigureNewCbjCompRoute.page),
    AutoRoute(page: ComputerConnectionCheckRoute.page),
    AutoRoute(page: EntitiesInNetworkRoute.page),
    AutoRoute(page: EntitiesInAreaRoute.page),
    AutoRoute(page: LoginVendorRoute.page),
    AutoRoute(page: ComunicationMethodRoute.page),

    // Pages from packages
    AutoRoute(page: SmartCameraContainerRoute.page),
    AutoRoute(page: VideoStreamOutputContainerRoute.page),
  ];
}
