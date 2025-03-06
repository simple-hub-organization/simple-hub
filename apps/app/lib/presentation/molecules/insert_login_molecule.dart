import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

class InsertLoginMolecule extends StatefulWidget {
  const InsertLoginMolecule({
    required this.type,
    required this.vendorsAndServices,
    required this.onChange,
  });

  final InsertLoginMoleculeType type;
  final VendorsAndServices vendorsAndServices;
  final Function(VendorLoginEntity) onChange;

  @override
  State<InsertLoginMolecule> createState() => _InsertLoginMoleculeState();
}

class _InsertLoginMoleculeState extends State<InsertLoginMolecule> {
  late VendorLoginEntity loginEntity;

  @override
  void initState() {
    super.initState();
    loginEntity = VendorLoginEntity(widget.vendorsAndServices);
  }

  void onEmailChange(String value) {
    loginEntity = loginEntityCopyWith(loginEntity: loginEntity, email: value);

    widget.onChange(loginEntity);
  }

  void onPasswordChange(String value) {
    loginEntity =
        loginEntityCopyWith(loginEntity: loginEntity, password: value);

    widget.onChange(loginEntity);
  }

  void onApiKeyChange(String value) {
    loginEntity = loginEntityCopyWith(loginEntity: loginEntity, apiKey: value);

    widget.onChange(loginEntity);
  }

  void onPairingCodeChange(String value) {
    loginEntity =
        loginEntityCopyWith(loginEntity: loginEntity, pairingCode: value);

    widget.onChange(loginEntity);
  }

  void onAuthTokenChange(String value) {
    loginEntity =
        loginEntityCopyWith(loginEntity: loginEntity, authToken: value);

    widget.onChange(loginEntity);
  }

  VendorLoginEntity loginEntityCopyWith({
    required VendorLoginEntity loginEntity,
    String? apiKey,
    String? authToken,
    String? email,
    String? password,
    String? pairingCode,
  }) =>
      VendorLoginEntity(
        loginEntity.vendor,
        apiKey: apiKey ?? loginEntity.apiKey,
        authToken: authToken ?? loginEntity.authToken,
        email: email ?? loginEntity.email,
        password: password ?? loginEntity.password,
        pairingCode: pairingCode ?? loginEntity.pairingCode,
      );

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case InsertLoginMoleculeType.authToken:
        return TextFormFieldAtom(
          onChanged: onAuthTokenChange,
          labelText: 'Auth Token',
        );
      case InsertLoginMoleculeType.apiKey:
        return TextFormFieldAtom(
          onChanged: onApiKeyChange,
          labelText: 'Api Key',
        );
      case InsertLoginMoleculeType.emailAndPassword:
        return Column(
          children: [
            TextFormFieldAtom(
              onChanged: onEmailChange,
              labelText: 'Email',
            ),
            TextFormFieldAtom(
              onChanged: onPasswordChange,
              labelText: 'Password',
            ),
          ],
        );
      case InsertLoginMoleculeType.addDeviceByPairingCode:
        return TextFormFieldAtom(
          onChanged: onPairingCodeChange,
          labelText: 'Pairing Code',
        );
    }
  }
}

enum InsertLoginMoleculeType {
  authToken,
  apiKey,
  emailAndPassword,
  addDeviceByPairingCode,
}
