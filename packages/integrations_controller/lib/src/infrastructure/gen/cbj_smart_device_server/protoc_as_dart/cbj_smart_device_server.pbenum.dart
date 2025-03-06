//
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CbjDeviceTypes extends $pb.ProtobufEnum {
  static const CbjDeviceTypes typeNotSupported = CbjDeviceTypes._(0, _omitEnumNames ? '' : 'typeNotSupported');
  static const CbjDeviceTypes light = CbjDeviceTypes._(1, _omitEnumNames ? '' : 'light');
  static const CbjDeviceTypes blinds = CbjDeviceTypes._(2, _omitEnumNames ? '' : 'blinds');
  static const CbjDeviceTypes boiler = CbjDeviceTypes._(3, _omitEnumNames ? '' : 'boiler');
  static const CbjDeviceTypes button = CbjDeviceTypes._(4, _omitEnumNames ? '' : 'button');
  static const CbjDeviceTypes buttonWithLight = CbjDeviceTypes._(5, _omitEnumNames ? '' : 'buttonWithLight');
  static const CbjDeviceTypes hub = CbjDeviceTypes._(7, _omitEnumNames ? '' : 'hub');
  static const CbjDeviceTypes phoneApp = CbjDeviceTypes._(8, _omitEnumNames ? '' : 'phoneApp');
  static const CbjDeviceTypes computerApp = CbjDeviceTypes._(9, _omitEnumNames ? '' : 'computerApp');
  static const CbjDeviceTypes browserApp = CbjDeviceTypes._(10, _omitEnumNames ? '' : 'browserApp');
  static const CbjDeviceTypes smartComputer = CbjDeviceTypes._(11, _omitEnumNames ? '' : 'smartComputer');
  static const CbjDeviceTypes smart_camera = CbjDeviceTypes._(12, _omitEnumNames ? '' : 'smart_camera');

  static const $core.List<CbjDeviceTypes> values = <CbjDeviceTypes> [
    typeNotSupported,
    light,
    blinds,
    boiler,
    button,
    buttonWithLight,
    hub,
    phoneApp,
    computerApp,
    browserApp,
    smartComputer,
    smart_camera,
  ];

  static final $core.Map<$core.int, CbjDeviceTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceTypes? valueOf($core.int value) => _byValue[value];

  const CbjDeviceTypes._($core.int v, $core.String n) : super(v, n);
}

class CbjDeviceActions extends $pb.ProtobufEnum {
  static const CbjDeviceActions actionNotSupported = CbjDeviceActions._(0, _omitEnumNames ? '' : 'actionNotSupported');
  static const CbjDeviceActions on = CbjDeviceActions._(1, _omitEnumNames ? '' : 'on');
  static const CbjDeviceActions off = CbjDeviceActions._(2, _omitEnumNames ? '' : 'off');
  static const CbjDeviceActions moveUp = CbjDeviceActions._(3, _omitEnumNames ? '' : 'moveUp');
  static const CbjDeviceActions stop = CbjDeviceActions._(4, _omitEnumNames ? '' : 'stop');
  static const CbjDeviceActions moveDown = CbjDeviceActions._(5, _omitEnumNames ? '' : 'moveDown');
  static const CbjDeviceActions pressed = CbjDeviceActions._(6, _omitEnumNames ? '' : 'pressed');
  static const CbjDeviceActions longPress = CbjDeviceActions._(7, _omitEnumNames ? '' : 'longPress');
  static const CbjDeviceActions doubleTap = CbjDeviceActions._(8, _omitEnumNames ? '' : 'doubleTap');
  static const CbjDeviceActions position = CbjDeviceActions._(9, _omitEnumNames ? '' : 'position');
  static const CbjDeviceActions suspend = CbjDeviceActions._(10, _omitEnumNames ? '' : 'suspend');
  static const CbjDeviceActions shutdown = CbjDeviceActions._(11, _omitEnumNames ? '' : 'shutdown');
  static const CbjDeviceActions itIsFalse = CbjDeviceActions._(12, _omitEnumNames ? '' : 'itIsFalse');
  static const CbjDeviceActions itIsTrue = CbjDeviceActions._(13, _omitEnumNames ? '' : 'itIsTrue');
  static const CbjDeviceActions startVideoStream = CbjDeviceActions._(14, _omitEnumNames ? '' : 'startVideoStream');
  static const CbjDeviceActions motionDetected = CbjDeviceActions._(15, _omitEnumNames ? '' : 'motionDetected');

  static const $core.List<CbjDeviceActions> values = <CbjDeviceActions> [
    actionNotSupported,
    on,
    off,
    moveUp,
    stop,
    moveDown,
    pressed,
    longPress,
    doubleTap,
    position,
    suspend,
    shutdown,
    itIsFalse,
    itIsTrue,
    startVideoStream,
    motionDetected,
  ];

  static final $core.Map<$core.int, CbjDeviceActions> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceActions? valueOf($core.int value) => _byValue[value];

  const CbjDeviceActions._($core.int v, $core.String n) : super(v, n);
}

class CbjWhenToExecute extends $pb.ProtobufEnum {
  static const CbjWhenToExecute undefined = CbjWhenToExecute._(0, _omitEnumNames ? '' : 'undefined');
  static const CbjWhenToExecute onOddNumberPress = CbjWhenToExecute._(1, _omitEnumNames ? '' : 'onOddNumberPress');
  static const CbjWhenToExecute evenNumberPress = CbjWhenToExecute._(2, _omitEnumNames ? '' : 'evenNumberPress');
  static const CbjWhenToExecute betweenSelectedTime = CbjWhenToExecute._(3, _omitEnumNames ? '' : 'betweenSelectedTime');
  static const CbjWhenToExecute doNotBetweenSelectedTime = CbjWhenToExecute._(4, _omitEnumNames ? '' : 'doNotBetweenSelectedTime');
  static const CbjWhenToExecute allTheTime = CbjWhenToExecute._(5, _omitEnumNames ? '' : 'allTheTime');
  static const CbjWhenToExecute never = CbjWhenToExecute._(6, _omitEnumNames ? '' : 'never');
  static const CbjWhenToExecute onceNow = CbjWhenToExecute._(7, _omitEnumNames ? '' : 'onceNow');
  static const CbjWhenToExecute onceInSelectedTime = CbjWhenToExecute._(8, _omitEnumNames ? '' : 'onceInSelectedTime');
  static const CbjWhenToExecute onlyIfDeviceListIsAreInActionListState = CbjWhenToExecute._(9, _omitEnumNames ? '' : 'onlyIfDeviceListIsAreInActionListState');
  static const CbjWhenToExecute atHome = CbjWhenToExecute._(10, _omitEnumNames ? '' : 'atHome');
  static const CbjWhenToExecute outOfHome = CbjWhenToExecute._(11, _omitEnumNames ? '' : 'outOfHome');

  static const $core.List<CbjWhenToExecute> values = <CbjWhenToExecute> [
    undefined,
    onOddNumberPress,
    evenNumberPress,
    betweenSelectedTime,
    doNotBetweenSelectedTime,
    allTheTime,
    never,
    onceNow,
    onceInSelectedTime,
    onlyIfDeviceListIsAreInActionListState,
    atHome,
    outOfHome,
  ];

  static final $core.Map<$core.int, CbjWhenToExecute> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjWhenToExecute? valueOf($core.int value) => _byValue[value];

  const CbjWhenToExecute._($core.int v, $core.String n) : super(v, n);
}

class CbjDeviceStateGRPC extends $pb.ProtobufEnum {
  static const CbjDeviceStateGRPC stateNotSupported = CbjDeviceStateGRPC._(0, _omitEnumNames ? '' : 'stateNotSupported');
  static const CbjDeviceStateGRPC cancelStateInProcess = CbjDeviceStateGRPC._(1, _omitEnumNames ? '' : 'cancelStateInProcess');
  static const CbjDeviceStateGRPC ack = CbjDeviceStateGRPC._(2, _omitEnumNames ? '' : 'ack');
  static const CbjDeviceStateGRPC newStateFailed = CbjDeviceStateGRPC._(3, _omitEnumNames ? '' : 'newStateFailed');
  static const CbjDeviceStateGRPC waitingInComp = CbjDeviceStateGRPC._(4, _omitEnumNames ? '' : 'waitingInComp');

  static const $core.List<CbjDeviceStateGRPC> values = <CbjDeviceStateGRPC> [
    stateNotSupported,
    cancelStateInProcess,
    ack,
    newStateFailed,
    waitingInComp,
  ];

  static final $core.Map<$core.int, CbjDeviceStateGRPC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CbjDeviceStateGRPC? valueOf($core.int value) => _byValue[value];

  const CbjDeviceStateGRPC._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
