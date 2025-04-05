import 'dart:collection';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

/// object
class SmartTvMolecule extends StatefulWidget {
  const SmartTvMolecule(this.entity);

  final GenericSmartTvDE entity;

  @override
  State<SmartTvMolecule> createState() => _SmartTvMoleculeState();
}

class _SmartTvMoleculeState extends State<SmartTvMolecule> {
  Future onVolumeUp() async {
    FlushbarHelper.createLoading(
      message: 'Volume Up',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityProperties.smartTvSwitchState, EntityActions.volumeUp);
  }

  Future onVolumeDown() async {
    FlushbarHelper.createLoading(
      message: 'Volume Down',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.smartTvSwitchState,
      EntityActions.volumeDown,
    );
  }

  Future onPlay() async {
    FlushbarHelper.createLoading(
      message: 'Play video',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityProperties.smartTvSwitchState, EntityActions.play);
  }

  Future onNetflix() async {
    FlushbarHelper.createLoading(
      message: 'Open Netflix',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.openUrl,
      EntityActions.open,
      value: HashMap.from({ActionValues.url: 'netflix'}),
    );
  }

  Future onTV() async {
    FlushbarHelper.createLoading(
      message: 'Turning on the TV',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.smartTvSwitchState,
      EntityActions.on,
    );
  }

  Future offTV() async {
    FlushbarHelper.createLoading(
      message: 'Turning off the TV',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.smartTvSwitchState,
      EntityActions.off,
    );
  }

  void onPause() {
    FlushbarHelper.createLoading(
      message: 'Close open app',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityProperties.smartTvSwitchState, EntityActions.pause);
  }

  void setEntityState(
    EntityProperties property,
    EntityActions action, {
    HashMap<ActionValues, dynamic>? value,
  }) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([widget.entity.entityCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: uniqueIdByVendor,
        property: property,
        actionType: action,
        value: value,
      ),
    );
  }

  void openUrl(String? url) {
    if (url == null) {
      return;
    }

    FlushbarHelper.createLoading(
      message: 'Open the url',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.openUrl,
      EntityActions.openUrl,
      value: HashMap.from({ActionValues.url: url}),
    );
  }

  void sendTtl(String? text) {
    if (text == null) {
      return;
    }

    FlushbarHelper.createLoading(
      message: 'Send tts text',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(
      EntityProperties.speakers,
      EntityActions.speak,
      value: HashMap.from({ActionValues.text: text}),
    );
  }

  void openUrlPopUp() {
    String? url;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const TextAtom(
            'Open URL',
            style: TextStyle(fontSize: 24.0),
          ),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (textInUrl) {
                        url = textInUrl;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter URL here',
                        labelText: 'URL',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        openUrl(url);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        // fixedSize: Size(250, 50),
                      ),
                      child: const TextAtom(
                        "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void ttsPopUp() {
    String? text = 'Welcome Home';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const TextAtom(
            'Text To Speech',
            style: TextStyle(fontSize: 24.0),
          ),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: 'Welcome Home',
                      onChanged: (textInUrl) {
                        text = textInUrl;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter TTS here',
                        labelText: 'Text',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        sendTtl(text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        // fixedSize: Size(250, 50),
                      ),
                      child: const TextAtom(
                        "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceNameRowMolecule(
          widget.entity.cbjEntityName.getOrCrash()!,
          const SizedBox(),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onVolumeDown,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.volumeLow,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'Down',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(variant: SeparatorVariant.closeWidgets),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onVolumeUp,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.volumeHigh,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'Up',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: offTV,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.toggleOff,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'Off',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onTV,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.toggleOn,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'On',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onNetflix,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.video,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'Netflix',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: openUrlPopUp,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.globe,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'Open URL',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: ttsPopUp,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.globe,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'TTS',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onPause,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.pause,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'YouTube Pause',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(variant: SeparatorVariant.closeWidgets),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey,
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(color: Colors.white60),
                          const BorderSide(color: Colors.white60),
                          22,
                        ),
                      ),
                    ),
                    onPressed: onPlay,
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.play,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: TextAtom(
                        'YouTube Play',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeparatorAtom(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
