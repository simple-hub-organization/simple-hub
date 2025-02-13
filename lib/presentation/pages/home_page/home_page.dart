import 'dart:async';
import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:cybearjinni/presentation/pages/home_page/tabs/scenes_in_folders_tab.dart';
import 'package:cybearjinni/presentation/pages/home_page/tabs/smart_devices_tab/entities_by_area_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Home page to show all the tabs
@RoutePage()
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _watchEntities();
    _watchAreas();
    initializedScenes();
  }

  @override
  void dispose() {
    entitiesStream?.cancel();
    areasStream?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  HashMap<String, SceneCbjEntity>? scenes;

  StreamSubscription<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamSubscription<MapEntry<String, AreaEntity>>? areasStream;

  HashMap<String, AreaEntity>? areas;
  HashMap<String, DeviceEntityBase>? entities;

  /// Tab num, value will be the default tab to show
  int? _currentTabNum;

  PageController? _pageController;

  Future initializedScenes() async {
    final HashMap<String, SceneCbjEntity> scenecsTemp =
        await ConnectionsService.instance.getScenes;

    setState(() {
      if (scenecsTemp.isNotEmpty) {
        _currentTabNum = 0;
      } else {
        _currentTabNum = 1;
      }
      _pageController = PageController(initialPage: _currentTabNum!);

      scenes = scenecsTemp;
    });
  }

  Future _watchAreas() async {
    await areasStream?.cancel();

    areasStream = ConnectionsService.instance.watchAreas().listen((areaEntery) {
      if (!mounted) {
        return;
      }

      setState(() {
        areas ??= HashMap();
        areas!.addEntries([areaEntery]);
      });
    });
    _initialzeAreas();
  }

  Future _initialzeAreas() async {
    final HashMap<String, AreaEntity> areasTemp =
        await ConnectionsService.instance.getAreas;
    setState(() {
      areas ??= HashMap();

      areas!.addAll(areasTemp);
    });
  }

  Future _watchEntities() async {
    await entitiesStream?.cancel();

    entitiesStream = ConnectionsService.instance
        .watchEntities()
        .listen((MapEntry<String, DeviceEntityBase> entityEntery) {
      if (!mounted ||
          unSupportedEntityType(entityEntery.value.entityTypes.type)) {
        return;
      }

      setState(() {
        entities ??= HashMap();
        entities!.addEntries([entityEntery]);
      });
    });
    _initialzeEntities();
  }

  Future _initialzeEntities() async {
    final HashMap<String, DeviceEntityBase> entitiesTemp =
        await ConnectionsService.instance.getEntities;
    entitiesTemp.removeWhere(
      (key, value) =>
          value.entityTypes.type == EntityTypes.undefined ||
          value.entityTypes.type == EntityTypes.emptyEntity,
    );
    setState(() {
      entities ??= HashMap();
      entities!.addAll(entitiesTemp);
    });
  }

  HashMap<String, DeviceEntityBase> getSupportedEnities(
    HashMap<String, DeviceEntityBase> entities,
  ) {
    entities.removeWhere(
      (key, value) => unSupportedEntityType(value.entityTypes.type),
    );
    return entities;
  }

  bool unSupportedEntityType(EntityTypes type) {
    return type == EntityTypes.undefined || type == EntityTypes.emptyEntity;
  }

  static List<BottomNavigationBarItemAtom> getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItemAtom(
        activeIcon: Icon(MdiIcons.sitemap),
        icon: Icon(MdiIcons.sitemapOutline),
        label: 'Automations',
      ),
      BottomNavigationBarItemAtom(
        activeIcon: Icon(MdiIcons.lightbulbOn),
        icon: Icon(MdiIcons.lightbulbOutline),
        label: 'Entities',
      ),
      // BottomNavigationBarItemAtom(
      //   icon: const FaIcon(FontAwesomeIcons.history),
      //   label: 'Routines'.
      // ),
      // BottomNavigationBarItemAtom(
      //   icon: const FaIcon(FontAwesomeIcons.link),
      //   label: 'Bindings'.
      // ),
    ];
  }

  void changeByTabNumber(int index) {
    setState(() {
      _currentTabNum = index;
      _pageController!.animateToPage(
        _currentTabNum!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentTabNum == null ||
        _pageController == null ||
        entities == null ||
        areas == null ||
        scenes == null) {
      return const Scaffold(
        body: CircularProgressIndicatorAtom(),
      );
    }

    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentTabNum = index;
                });
              },
              controller: _pageController,
              children: [
                ScenesInFoldersTab(areas: areas, scenes: scenes),
                EntitiesByAreaTab(areas: areas!, entities: entities!),
                // BindingsPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBarMolecule(
              bottomNaviList: getBottomNavigationBarItems(),
              onTap: changeByTabNumber,
              pageIndex: _currentTabNum!,
            ),
          ),
          Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await context.router.push(const PlusButtonRoute());
                        areas = null;
                        entities = null;
                        _initialzeAreas();
                        _initialzeEntities();

                        initializedScenes();
                      },
                      child: CircleAvatar(
                        backgroundColor: colorScheme.tertiaryContainer,
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
