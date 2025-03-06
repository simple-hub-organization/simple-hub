import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:cybearjinni/presentation/pages/add_new_devices_process/computer_connection_check/widgets/computer_connection_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ComputerConnectionCheckPage extends StatelessWidget {
  const ComputerConnectionCheckPage({
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
              pageName: 'Final setting up step',
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: leftIconFunction,
            ),
            Expanded(
              child:
                  ComputerConnectionCheckWidget(cbjCompEntity: cbjCompEntity),
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
