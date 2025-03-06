import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';

class CBJCompCard extends StatelessWidget {
  const CBJCompCard({
    required this.cbjCompEntity,
  });

  final CbjCompEntity cbjCompEntity;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orangeAccent,
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
            child: cbjCompEntity.cBJCompDevices!.getOrCrash().size < 1
                ? const TextAtom('')
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final GenericLightDE compEntity =
                          cbjCompEntity.cBJCompDevices!.getOrCrash()[index];
                      if (compEntity.entityTypes.getOrCrash() ==
                          EntityTypes.light.toString()) {
                        return Center(
                          child: TextAtom(
                            compEntity.cbjEntityName.getOrCrash()!,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                        );
                      } else {
                        return TextAtom(
                          'Type not supported '
                          '${compEntity.entityTypes.getOrCrash()} yet',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        );
                      }
                    },
                    itemCount: cbjCompEntity.cBJCompDevices!.getOrCrash().size,
                  ),
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
