import 'dart:collection';

import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/core/snack_bar_service.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

@RoutePage()
class ChangeAreaForDevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarMolecule(
            pageName: 'Change Area For Devices',
            leftIcon: FontAwesomeIcons.arrowLeft,
            leftIconFunction: context.router.maybePop,
          ),
          ChangeAreaForDevicesWidget(),
        ],
      ),
    );
  }
}

class ChangeAreaForDevicesWidget extends StatefulWidget {
  @override
  State<ChangeAreaForDevicesWidget> createState() =>
      _ChangeAreaForDevicesWidgetState();
}

class _ChangeAreaForDevicesWidgetState
    extends State<ChangeAreaForDevicesWidget> {
  HashMap<String, AreaEntity>? areas;
  HashMap<String, DeviceEntityBase>? entities;
  AreaEntity? selectedArea;
  HashSet<String> selectedEntities = HashSet();
  AreaBackground background = AreaBackground(
    'https://live.staticflickr.com/5220/5486044345_f67abff3e9_h.jpg',
  );

  @override
  void initState() {
    super.initState();
    _initialized();
  }

  Future _initialized() async {
    getAreas();
    getEntities();
  }

  Future getAreas() async {
    final HashMap<String, AreaEntity> areasTemp =
        await ConnectionsService.instance.getAreas;
    setState(() {
      areas = areasTemp;
    });
  }

  Future getEntities() async {
    final HashMap<String, DeviceEntityBase> entitiesTemp =
        await ConnectionsService.instance.getEntities;
    setState(() {
      entities = entitiesTemp;
    });
  }

  Future _addEtitiesToArea() async {
    final String? id = selectedArea?.uniqueId.getOrCrash();
    if (id == null) {
      return;
    }
    ConnectionsService.instance.setEtitiesToArea(id, selectedEntities);
  }

  void onAreaSelected(String? value) {
    setState(() {
      selectedArea = areas?[value];
    });
  }

  void onEntitiesSelected(List<String?> values) =>
      selectedEntities = HashSet.from(values);

  @override
  Widget build(BuildContext context) {
    if (areas == null || entities == null) {
      return const CircularProgressIndicatorAtom();
    }

    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextAtom(
                'Choose Area',
                style: TextStyle(fontSize: 27),
              ),
              TextButton(
                onPressed: () async {
                  await context.router.push(const AddNewAreaRoute());
                  getAreas();
                },
                child: const TextAtom(
                  'Add New Area',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            dropdownColor: Colors.black,
            icon: const Icon(Icons.arrow_drop_down),
            hint: TextAtom(
              selectedArea?.cbjEntityName.getOrCrash() ?? 'Choose Area',
            ),
            elevation: 16,
            underline: Container(
              height: 2,
            ),
            onChanged: onAreaSelected,
            items: areas!.values.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(
                value: e.uniqueId.getOrCrash(),
                child: TextAtom(e.cbjEntityName.getOrCrash()),
              );
            }).toList(),
          ),
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          const Row(
            children: [
              TextAtom(
                'Choose Entity',
                style: TextStyle(fontSize: 27),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: screenSize.height * 0.5),
            child: SingleChildScrollView(
              child: MultiSelectDialogField(
                initialValue: selectedArea?.entitiesId.getOrCrash().toList() ??
                    List<String>.empty(),
                items: List<MultiSelectItem<String?>>.of(
                  entities!.values.map(
                    (e) => MultiSelectItem(
                      e.getCbjEntityId,
                      e.cbjEntityName.getOrCrash()!,
                    ),
                  ),
                ),
                listType: MultiSelectListType.CHIP,
                onConfirm: onEntitiesSelected,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  SnackBarService().show(
                    context,
                    'Changing devices for area',
                  );
                  _addEtitiesToArea();
                },
                child: const TextAtom(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
