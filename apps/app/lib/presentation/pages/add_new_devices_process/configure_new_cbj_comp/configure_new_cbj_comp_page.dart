import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/add_new_devices_process/configure_new_cbj_comp/widgets/configure_new_cbj_comp_widget.dart';

@RoutePage()
class ConfigureNewCbjCompPage extends StatelessWidget {
  const ConfigureNewCbjCompPage({
    required this.cbjCompEntity,
  });

  final CbjCompEntity cbjCompEntity;

  void leftIconFunction(BuildContext context) {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.black87,
        child: Column(
          children: [
            TopBarMolecule(
              pageName: 'Add CBJ Computer',
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: leftIconFunction,
            ),
            Expanded(
              child: ConfigureNewCbjCompWidgets(cbjCompEntity: cbjCompEntity),
            ),
          ],
        ),
      ),
    );
    //   BlocProvider(
    //   create: (context) =>
    //       getIt<CBJCompBloc>()..add(const CBJCompEvent.initialized()),
    //   child:
    // );
  }
}
