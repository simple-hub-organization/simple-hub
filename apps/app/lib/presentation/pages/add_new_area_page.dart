import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';

@RoutePage()
class AddNewAreaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const TextAtom('Add New Area'),
      ),
      body: AddNewAreaForm(),
    );
  }
}

class AddNewAreaForm extends StatefulWidget {
  @override
  State<AddNewAreaForm> createState() => _AddNewAreaFormState();
}

class _AddNewAreaFormState extends State<AddNewAreaForm> {
  // final Set<DeviceEntityBase?> _allDevices = {};
  AreaUniqueId areaUniqueId = AreaUniqueId();
  AreaDefaultName cbjEntityName = AreaDefaultName('');
  AreaBackground background = AreaBackground(
    'https://live.staticflickr.com/5220/5486044345_f67abff3e9_h.jpg',
  );
  AreaPurposes areaTypes = AreaPurposes(const {});
  AreaEntitiesId areaDevicesId = AreaEntitiesId(const {});
  AreaScenesId areaScenesId = AreaScenesId(const {});
  AreaRoutinesId areaRoutinesId = AreaRoutinesId(const {});
  AreaBindingsId areaBindingsId = AreaBindingsId(const {});
  AreaMostUsedBy areaMostUsedBy = AreaMostUsedBy(const {});
  AreaPermissions areaPermissions = AreaPermissions(const {});
  bool showErrorMessages = false;
  bool isSubmitting = false;

  // Future _initialized() async {
  //   IAreaRepository.instance.getAllAreas().fold((l) => null, (r) {
  //     _allAreas = Set<AreaEntity>.from(r.iter);
  //   });

  //   (await IDeviceRepository.instance.getAllEntites()).fold((l) => null, (r) {
  //     _allDevices = Set<DeviceEntityBase>.from(r.iter);
  //   });
  //   _allAreas.removeWhere((element) => element == null);
  //   _allDevices.removeWhere((element) => element == null);
  //   setState(() {
  //     _allAreas = _allAreas as Set<AreaEntity>;
  //     _allDevices = _allDevices as Set<DeviceEntityBase>;
  //   });
  // }

  Future _createArea() async {
    final AreaEntity areaEntity = AreaEntity(
      uniqueId: AreaUniqueId.fromUniqueString(areaUniqueId.getOrCrash()),
      cbjEntityName: cbjEntityName,
      background: background,
      purposes: areaTypes,
      entitiesId: areaDevicesId,
      scenesId: areaScenesId,
      routinesId: areaRoutinesId,
      bindingsId: areaBindingsId,
      areaMostUsedBy: areaMostUsedBy,
      areaPermissions: areaPermissions,
    );

    ConnectionsService.instance.setNewArea(areaEntity);
  }

  Future _defaultNameChanged(String value) async {
    setState(() {
      cbjEntityName = AreaDefaultName(value);
    });
  }

  Future _areaTypesChanged(Set<AreaPurposesTypes> value) async {
    setState(() {
      areaTypes = AreaPurposes(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final List<AreaPurposesTypes> purposesList =
        List.from(AreaPurposesTypes.values);

    purposesList
        .removeWhere((element) => element == AreaPurposesTypes.undefined);

    return MarginedExpandedAtom(
      child: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              constraints: BoxConstraints(maxHeight: screenSize.height * 0.83),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: FaIcon(FontAwesomeIcons.rightToBracket),
                        labelText: 'Area Name',
                      ),
                      autocorrect: false,
                      onChanged: (value) => _defaultNameChanged(
                        value,
                      ),
                      validator: (_) => cbjEntityName.value.fold(
                        (AreaFailure f) => 'Validation error',
                        (r) => null,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // MultiSelectDialogField(
                    //   buttonText: const Text(
                    //     'Select_Purposes_Of_The_Area',
                    //   ).tr(),
                    MultiSelectDialogField(
                      buttonText: const Text(
                        'Select_Purposes_Of_The_Area',
                      ),
                      // cancelText: const Text('CANCEL').tr(),
                      cancelText: const Text('CANCEL'),
                      // confirmText: const Text('OK').tr(),
                      confirmText: const Text('OK'),
                      title: const TextAtom('Select'),
                      items:
                          purposesList.map((AreaPurposesTypes areaPurposeType) {
                        final String tempAreaName = areaPurposeType.name
                            .substring(1, areaPurposeType.name.length);
                        String areaNameEdited =
                            areaPurposeType.name.substring(0, 1).toUpperCase();
                        for (final String a in tempAreaName.characters) {
                          if (a[0] == a[0].toUpperCase()) {
                            areaNameEdited += ' ';
                          }
                          // ignore: use_string_buffers a
                          areaNameEdited += a;
                        }

                        return MultiSelectItem(
                          areaPurposeType,
                          areaNameEdited,
                        );
                      }).toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (List<AreaPurposesTypes> values) {
                        _areaTypesChanged(values.toSet());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      SnackBarService().show(
                        context,
                        'Adding area',
                      );
                      await _createArea();
                      if (!mounted) {
                        return;
                      }

                      context.router.maybePop();
                    },
                    child: const TextAtom('ADD'),
                  ),
                ),
              ],
            ),
          ),
          if (isSubmitting) ...[
            const SizedBox(
              height: 8,
            ),
            const LinearProgressIndicator(),
          ],
        ],
      ),
    );
  }
}
