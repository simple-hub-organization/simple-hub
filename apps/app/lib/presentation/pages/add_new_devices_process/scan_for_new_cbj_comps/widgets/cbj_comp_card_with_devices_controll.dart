import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:kt_dart/collection.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';

class CBJCompCardWithDevicesControll extends StatelessWidget {
  const CBJCompCardWithDevicesControll({
    required this.cbjCompEntity,
  });

  final CbjCompEntity cbjCompEntity;

  Widget devicesTypes(BuildContext context) {
    final List<Widget> typesList = [];
    final KtList<GenericLightDE> deviceEntityList =
        cbjCompEntity.cBJCompDevices!.getOrCrash();

    for (final GenericLightDE deviceEntity in deviceEntityList.asList()) {
      //
      if (deviceEntity.entityTypes.getOrCrash() !=
          EntityTypes.undefined.toString()) {
        typesList.add(
          ColoredBox(
            color: Colors.yellowAccent.withAlpha((0.3 * 255).toInt()),
            child: TextAtom(
              'Type: ${deviceEntity.entityTypes.getOrCrash()}',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        );
      } else {
        typesList.add(
          ColoredBox(
            color: Colors.orange.withAlpha((0.3 * 255).toInt()),
            child: TextAtom(
              'Type ${deviceEntity.entityTypes.getOrCrash()} is not supported',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        );
      }
    }
    if (typesList.isEmpty) {
      typesList.add(const TextAtom('Computer does not contain any devices'));
    }

    final Column deviceColumn = Column(
      children: typesList.toList(),
    );

    return deviceColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        color: Colors.purpleAccent.withAlpha((0.2 * 255).toInt()),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
                bottom: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
            ),
            child: devicesTypes(context),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.greenAccent,
              ),
            ),
            onPressed: () {
              context.router.replace(
                ConfigureNewCbjCompRoute(cbjCompEntity: cbjCompEntity),
              );
            },
            child: TextAtom(
              'Set up computer',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// CBJCompBloc
