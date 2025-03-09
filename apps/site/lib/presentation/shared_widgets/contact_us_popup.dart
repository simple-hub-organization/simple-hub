import 'package:flutter/material.dart';

Future<dynamic> contactUsPlaceHolder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return ContactUsPopup();
    },
  );
}

/// Top navigation menu for the site
class ContactUsPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactUsPopup();
  }
}

class _ContactUsPopup extends State<ContactUsPopup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.5,
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color!
                .withAlpha((0.9 * 255).toInt()),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AlertDialog(
                    title: const Text('Write To Us'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        // textColor: Theme.of(context).textTheme.bodyLarge.color,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
