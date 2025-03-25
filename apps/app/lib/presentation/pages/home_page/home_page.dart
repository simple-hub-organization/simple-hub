import 'dart:async';
import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/home_page/tabs/scenes_in_folders_tab.dart';
import 'package:simple_hub/presentation/pages/home_page/tabs/smart_devices_tab/entities_by_area_tab.dart';

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
    _watchScenes();

    ConnectionsService.instance.requestAreaEntitiesScenes();
  }

  @override
  void dispose() {
    entitiesStream?.cancel();
    areasStream?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  HashMap<String, SceneEntity>? scenes;

  StreamSubscription<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamSubscription<MapEntry<String, AreaEntity>>? areasStream;
  StreamSubscription<MapEntry<String, SceneEntity>>? scenesStream;

  HashMap<String, AreaEntity>? areas;
  HashMap<String, DeviceEntityBase>? entities;

  /// Tab num, value will be the default tab to show
  int? _currentTabNum;

  PageController? _pageController;

  Future initializedScenes() async {
    final HashMap<String, SceneEntity> scenesTemp =
        await ConnectionsService.instance.getScenes;

    setState(() {
      if (scenesTemp.isNotEmpty) {
        _currentTabNum = 0;
      } else {
        _currentTabNum = 1;
      }

      scenes = scenesTemp;
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
  }

  Future _watchScenes() async {
    await scenesStream?.cancel();

    scenesStream = ConnectionsService.instance.watchScenes().listen((scene) {
      if (!mounted) {
        return;
      }
      if (_currentTabNum == null) {
        if (scene.value.uniqueId.getOrCrash() ==
            UniqueId.empty().getOrCrash()) {
          _currentTabNum = 1;
        } else {
          _currentTabNum = 0;
        }
        _pageController = PageController(initialPage: _currentTabNum!);
      }

      setState(() {
        scenes ??= HashMap();
        scenes!.addEntries([scene]);
      });
    });
  }

  Future _initializeAreas() async {
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
      if (!mounted) {
        return;
      }

      setState(() {
        entities ??= HashMap();
        entities!.addEntries([entityEntery]);
      });
    });
  }

  Future _initializeEntities() async {
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
                        _initializeAreas();
                        _initializeEntities();

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
