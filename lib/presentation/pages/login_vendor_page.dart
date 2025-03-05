import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/snack_bar_service.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LoginVendorPage extends StatefulWidget {
  const LoginVendorPage(this.vendorInformation);

  final VendorEntityInformation vendorInformation;

  @override
  State<LoginVendorPage> createState() => _LoginVendorPageState();
}

class _LoginVendorPageState extends State<LoginVendorPage> {
  VendorLoginEntity? loginEntity;

  Future _signInWithApiKey() async {
    if (loginEntity == null) {
      return;
    }

    SnackBarService().show(
      context,
      'Sign in to ${widget.vendorInformation.displayName}, devices will appear in the shortly',
    );

    ConnectionsService.instance.loginVendor(loginEntity!);
    context.router.maybePop();
  }

  Widget authTypeWidget() {
    InsertloginMoleculeType type;
    switch (widget.vendorInformation.loginType) {
      case VendorLoginTypes.notNeeded:
        return const TextAtom('Not needed');
      case VendorLoginTypes.authToken:
        type = InsertloginMoleculeType.authToken;
      case VendorLoginTypes.apiKey:
        type = InsertloginMoleculeType.apiKey;

      case VendorLoginTypes.emailAndPassword:
        type = InsertloginMoleculeType.emailAndPassword;
    }
    return InsertLoginMolecule(
      type: type,
      vendorsAndServices: widget.vendorInformation.vendorsAndServices,
      onChange: (VendorLoginEntity value) {
        loginEntity = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextAtom('${widget.vendorInformation.displayName} Sign In'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Hero(
                    tag: 'Logo',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: screenSize.height * 0.1,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(widget.vendorInformation.imageUrl),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  authTypeWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: _signInWithApiKey,
                          child: const TextAtom('SIGN IN'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (widget.vendorInformation.urlToLoginCredantials != null)
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.pink),
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      widget.vendorInformation.urlToLoginCredantials!,
                    ),
                  );
                },
                child: TextAtom(
                  widget.vendorInformation.loginType.name,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
