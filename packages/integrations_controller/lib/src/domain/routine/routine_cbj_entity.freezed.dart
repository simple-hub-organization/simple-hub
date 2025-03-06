// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_cbj_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoutineCbjEntity {
  /// The unique id of the routine, will alsow be used as the flow/tab id.
  UniqueId get uniqueId => throw _privateConstructorUsedError;

  /// Name of the automation, will be shown to the user.
  RoutineCbjName get name => throw _privateConstructorUsedError;
  RoutineCbjBackgroundColor get backgroundColor =>
      throw _privateConstructorUsedError;

  /// All the automation as string.
  RoutineCbjAutomationString get automationString =>
      throw _privateConstructorUsedError;

  /// Node-Red flow id of the scene
  RoutineCbjNodeRedFlowId get nodeRedFlowId =>
      throw _privateConstructorUsedError;

  /// The actual id of the first node, most of the time will be the same as
  /// uniqueId variable.
  RoutineCbjFirstNodeId get firstNodeId => throw _privateConstructorUsedError;

  /// The Unicode code point at which this icon is stored in the icon font.
  RoutineCbjIconCodePoint get iconCodePoint =>
      throw _privateConstructorUsedError;
  RoutineCbjBackgroundImage get image => throw _privateConstructorUsedError;
  RoutineCbjLastDateOfExecute get lastDateOfExecute =>
      throw _privateConstructorUsedError;
  RoutineCbjStateMassage get stateMassage => throw _privateConstructorUsedError;
  RoutineCbjSenderDeviceOs get senderDeviceOs =>
      throw _privateConstructorUsedError;
  RoutineCbjSenderDeviceModel get senderDeviceModel =>
      throw _privateConstructorUsedError;
  RoutineCbjSenderId get senderId => throw _privateConstructorUsedError;
  RoutineCbjCompUuid get compUuid => throw _privateConstructorUsedError;
  RoutineCbjDeviceStateGRPC get entityStateGRPC =>
      throw _privateConstructorUsedError;

  /// Repeat type, at a specific time/ interval/ iterval between times
  RoutineCbjRepeatType get repeateType => throw _privateConstructorUsedError;

  /// In what days to repeat in
  RoutineCbjRepeatDateDays get repeateDateDays =>
      throw _privateConstructorUsedError;

  /// In what hour to repeat in
  RoutineCbjRepeatDateHour get repeateDateHour =>
      throw _privateConstructorUsedError;

  /// In what minute to repeat in
  RoutineCbjRepeatDateMinute get repeateDateMinute =>
      throw _privateConstructorUsedError;

  /// Create a copy of RoutineCbjEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutineCbjEntityCopyWith<RoutineCbjEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineCbjEntityCopyWith<$Res> {
  factory $RoutineCbjEntityCopyWith(
          RoutineCbjEntity value, $Res Function(RoutineCbjEntity) then) =
      _$RoutineCbjEntityCopyWithImpl<$Res, RoutineCbjEntity>;
  @useResult
  $Res call(
      {UniqueId uniqueId,
      RoutineCbjName name,
      RoutineCbjBackgroundColor backgroundColor,
      RoutineCbjAutomationString automationString,
      RoutineCbjNodeRedFlowId nodeRedFlowId,
      RoutineCbjFirstNodeId firstNodeId,
      RoutineCbjIconCodePoint iconCodePoint,
      RoutineCbjBackgroundImage image,
      RoutineCbjLastDateOfExecute lastDateOfExecute,
      RoutineCbjStateMassage stateMassage,
      RoutineCbjSenderDeviceOs senderDeviceOs,
      RoutineCbjSenderDeviceModel senderDeviceModel,
      RoutineCbjSenderId senderId,
      RoutineCbjCompUuid compUuid,
      RoutineCbjDeviceStateGRPC entityStateGRPC,
      RoutineCbjRepeatType repeateType,
      RoutineCbjRepeatDateDays repeateDateDays,
      RoutineCbjRepeatDateHour repeateDateHour,
      RoutineCbjRepeatDateMinute repeateDateMinute});
}

/// @nodoc
class _$RoutineCbjEntityCopyWithImpl<$Res, $Val extends RoutineCbjEntity>
    implements $RoutineCbjEntityCopyWith<$Res> {
  _$RoutineCbjEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutineCbjEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? name = null,
    Object? backgroundColor = null,
    Object? automationString = null,
    Object? nodeRedFlowId = null,
    Object? firstNodeId = null,
    Object? iconCodePoint = null,
    Object? image = null,
    Object? lastDateOfExecute = null,
    Object? stateMassage = null,
    Object? senderDeviceOs = null,
    Object? senderDeviceModel = null,
    Object? senderId = null,
    Object? compUuid = null,
    Object? entityStateGRPC = null,
    Object? repeateType = null,
    Object? repeateDateDays = null,
    Object? repeateDateHour = null,
    Object? repeateDateMinute = null,
  }) {
    return _then(_value.copyWith(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as RoutineCbjName,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as RoutineCbjBackgroundColor,
      automationString: null == automationString
          ? _value.automationString
          : automationString // ignore: cast_nullable_to_non_nullable
              as RoutineCbjAutomationString,
      nodeRedFlowId: null == nodeRedFlowId
          ? _value.nodeRedFlowId
          : nodeRedFlowId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjNodeRedFlowId,
      firstNodeId: null == firstNodeId
          ? _value.firstNodeId
          : firstNodeId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjFirstNodeId,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as RoutineCbjIconCodePoint,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as RoutineCbjBackgroundImage,
      lastDateOfExecute: null == lastDateOfExecute
          ? _value.lastDateOfExecute
          : lastDateOfExecute // ignore: cast_nullable_to_non_nullable
              as RoutineCbjLastDateOfExecute,
      stateMassage: null == stateMassage
          ? _value.stateMassage
          : stateMassage // ignore: cast_nullable_to_non_nullable
              as RoutineCbjStateMassage,
      senderDeviceOs: null == senderDeviceOs
          ? _value.senderDeviceOs
          : senderDeviceOs // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderDeviceOs,
      senderDeviceModel: null == senderDeviceModel
          ? _value.senderDeviceModel
          : senderDeviceModel // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderDeviceModel,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderId,
      compUuid: null == compUuid
          ? _value.compUuid
          : compUuid // ignore: cast_nullable_to_non_nullable
              as RoutineCbjCompUuid,
      entityStateGRPC: null == entityStateGRPC
          ? _value.entityStateGRPC
          : entityStateGRPC // ignore: cast_nullable_to_non_nullable
              as RoutineCbjDeviceStateGRPC,
      repeateType: null == repeateType
          ? _value.repeateType
          : repeateType // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatType,
      repeateDateDays: null == repeateDateDays
          ? _value.repeateDateDays
          : repeateDateDays // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateDays,
      repeateDateHour: null == repeateDateHour
          ? _value.repeateDateHour
          : repeateDateHour // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateHour,
      repeateDateMinute: null == repeateDateMinute
          ? _value.repeateDateMinute
          : repeateDateMinute // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateMinute,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutineCbjEntityImplCopyWith<$Res>
    implements $RoutineCbjEntityCopyWith<$Res> {
  factory _$$RoutineCbjEntityImplCopyWith(_$RoutineCbjEntityImpl value,
          $Res Function(_$RoutineCbjEntityImpl) then) =
      __$$RoutineCbjEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId uniqueId,
      RoutineCbjName name,
      RoutineCbjBackgroundColor backgroundColor,
      RoutineCbjAutomationString automationString,
      RoutineCbjNodeRedFlowId nodeRedFlowId,
      RoutineCbjFirstNodeId firstNodeId,
      RoutineCbjIconCodePoint iconCodePoint,
      RoutineCbjBackgroundImage image,
      RoutineCbjLastDateOfExecute lastDateOfExecute,
      RoutineCbjStateMassage stateMassage,
      RoutineCbjSenderDeviceOs senderDeviceOs,
      RoutineCbjSenderDeviceModel senderDeviceModel,
      RoutineCbjSenderId senderId,
      RoutineCbjCompUuid compUuid,
      RoutineCbjDeviceStateGRPC entityStateGRPC,
      RoutineCbjRepeatType repeateType,
      RoutineCbjRepeatDateDays repeateDateDays,
      RoutineCbjRepeatDateHour repeateDateHour,
      RoutineCbjRepeatDateMinute repeateDateMinute});
}

/// @nodoc
class __$$RoutineCbjEntityImplCopyWithImpl<$Res>
    extends _$RoutineCbjEntityCopyWithImpl<$Res, _$RoutineCbjEntityImpl>
    implements _$$RoutineCbjEntityImplCopyWith<$Res> {
  __$$RoutineCbjEntityImplCopyWithImpl(_$RoutineCbjEntityImpl _value,
      $Res Function(_$RoutineCbjEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineCbjEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? name = null,
    Object? backgroundColor = null,
    Object? automationString = null,
    Object? nodeRedFlowId = null,
    Object? firstNodeId = null,
    Object? iconCodePoint = null,
    Object? image = null,
    Object? lastDateOfExecute = null,
    Object? stateMassage = null,
    Object? senderDeviceOs = null,
    Object? senderDeviceModel = null,
    Object? senderId = null,
    Object? compUuid = null,
    Object? entityStateGRPC = null,
    Object? repeateType = null,
    Object? repeateDateDays = null,
    Object? repeateDateHour = null,
    Object? repeateDateMinute = null,
  }) {
    return _then(_$RoutineCbjEntityImpl(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as RoutineCbjName,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as RoutineCbjBackgroundColor,
      automationString: null == automationString
          ? _value.automationString
          : automationString // ignore: cast_nullable_to_non_nullable
              as RoutineCbjAutomationString,
      nodeRedFlowId: null == nodeRedFlowId
          ? _value.nodeRedFlowId
          : nodeRedFlowId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjNodeRedFlowId,
      firstNodeId: null == firstNodeId
          ? _value.firstNodeId
          : firstNodeId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjFirstNodeId,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as RoutineCbjIconCodePoint,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as RoutineCbjBackgroundImage,
      lastDateOfExecute: null == lastDateOfExecute
          ? _value.lastDateOfExecute
          : lastDateOfExecute // ignore: cast_nullable_to_non_nullable
              as RoutineCbjLastDateOfExecute,
      stateMassage: null == stateMassage
          ? _value.stateMassage
          : stateMassage // ignore: cast_nullable_to_non_nullable
              as RoutineCbjStateMassage,
      senderDeviceOs: null == senderDeviceOs
          ? _value.senderDeviceOs
          : senderDeviceOs // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderDeviceOs,
      senderDeviceModel: null == senderDeviceModel
          ? _value.senderDeviceModel
          : senderDeviceModel // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderDeviceModel,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as RoutineCbjSenderId,
      compUuid: null == compUuid
          ? _value.compUuid
          : compUuid // ignore: cast_nullable_to_non_nullable
              as RoutineCbjCompUuid,
      entityStateGRPC: null == entityStateGRPC
          ? _value.entityStateGRPC
          : entityStateGRPC // ignore: cast_nullable_to_non_nullable
              as RoutineCbjDeviceStateGRPC,
      repeateType: null == repeateType
          ? _value.repeateType
          : repeateType // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatType,
      repeateDateDays: null == repeateDateDays
          ? _value.repeateDateDays
          : repeateDateDays // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateDays,
      repeateDateHour: null == repeateDateHour
          ? _value.repeateDateHour
          : repeateDateHour // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateHour,
      repeateDateMinute: null == repeateDateMinute
          ? _value.repeateDateMinute
          : repeateDateMinute // ignore: cast_nullable_to_non_nullable
              as RoutineCbjRepeatDateMinute,
    ));
  }
}

/// @nodoc

class _$RoutineCbjEntityImpl extends _RoutineCbjEntity {
  const _$RoutineCbjEntityImpl(
      {required this.uniqueId,
      required this.name,
      required this.backgroundColor,
      required this.automationString,
      required this.nodeRedFlowId,
      required this.firstNodeId,
      required this.iconCodePoint,
      required this.image,
      required this.lastDateOfExecute,
      required this.stateMassage,
      required this.senderDeviceOs,
      required this.senderDeviceModel,
      required this.senderId,
      required this.compUuid,
      required this.entityStateGRPC,
      required this.repeateType,
      required this.repeateDateDays,
      required this.repeateDateHour,
      required this.repeateDateMinute})
      : super._();

  /// The unique id of the routine, will alsow be used as the flow/tab id.
  @override
  final UniqueId uniqueId;

  /// Name of the automation, will be shown to the user.
  @override
  final RoutineCbjName name;
  @override
  final RoutineCbjBackgroundColor backgroundColor;

  /// All the automation as string.
  @override
  final RoutineCbjAutomationString automationString;

  /// Node-Red flow id of the scene
  @override
  final RoutineCbjNodeRedFlowId nodeRedFlowId;

  /// The actual id of the first node, most of the time will be the same as
  /// uniqueId variable.
  @override
  final RoutineCbjFirstNodeId firstNodeId;

  /// The Unicode code point at which this icon is stored in the icon font.
  @override
  final RoutineCbjIconCodePoint iconCodePoint;
  @override
  final RoutineCbjBackgroundImage image;
  @override
  final RoutineCbjLastDateOfExecute lastDateOfExecute;
  @override
  final RoutineCbjStateMassage stateMassage;
  @override
  final RoutineCbjSenderDeviceOs senderDeviceOs;
  @override
  final RoutineCbjSenderDeviceModel senderDeviceModel;
  @override
  final RoutineCbjSenderId senderId;
  @override
  final RoutineCbjCompUuid compUuid;
  @override
  final RoutineCbjDeviceStateGRPC entityStateGRPC;

  /// Repeat type, at a specific time/ interval/ iterval between times
  @override
  final RoutineCbjRepeatType repeateType;

  /// In what days to repeat in
  @override
  final RoutineCbjRepeatDateDays repeateDateDays;

  /// In what hour to repeat in
  @override
  final RoutineCbjRepeatDateHour repeateDateHour;

  /// In what minute to repeat in
  @override
  final RoutineCbjRepeatDateMinute repeateDateMinute;

  @override
  String toString() {
    return 'RoutineCbjEntity(uniqueId: $uniqueId, name: $name, backgroundColor: $backgroundColor, automationString: $automationString, nodeRedFlowId: $nodeRedFlowId, firstNodeId: $firstNodeId, iconCodePoint: $iconCodePoint, image: $image, lastDateOfExecute: $lastDateOfExecute, stateMassage: $stateMassage, senderDeviceOs: $senderDeviceOs, senderDeviceModel: $senderDeviceModel, senderId: $senderId, compUuid: $compUuid, entityStateGRPC: $entityStateGRPC, repeateType: $repeateType, repeateDateDays: $repeateDateDays, repeateDateHour: $repeateDateHour, repeateDateMinute: $repeateDateMinute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineCbjEntityImpl &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.automationString, automationString) ||
                other.automationString == automationString) &&
            (identical(other.nodeRedFlowId, nodeRedFlowId) ||
                other.nodeRedFlowId == nodeRedFlowId) &&
            (identical(other.firstNodeId, firstNodeId) ||
                other.firstNodeId == firstNodeId) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lastDateOfExecute, lastDateOfExecute) ||
                other.lastDateOfExecute == lastDateOfExecute) &&
            (identical(other.stateMassage, stateMassage) ||
                other.stateMassage == stateMassage) &&
            (identical(other.senderDeviceOs, senderDeviceOs) ||
                other.senderDeviceOs == senderDeviceOs) &&
            (identical(other.senderDeviceModel, senderDeviceModel) ||
                other.senderDeviceModel == senderDeviceModel) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.compUuid, compUuid) ||
                other.compUuid == compUuid) &&
            (identical(other.entityStateGRPC, entityStateGRPC) ||
                other.entityStateGRPC == entityStateGRPC) &&
            (identical(other.repeateType, repeateType) ||
                other.repeateType == repeateType) &&
            (identical(other.repeateDateDays, repeateDateDays) ||
                other.repeateDateDays == repeateDateDays) &&
            (identical(other.repeateDateHour, repeateDateHour) ||
                other.repeateDateHour == repeateDateHour) &&
            (identical(other.repeateDateMinute, repeateDateMinute) ||
                other.repeateDateMinute == repeateDateMinute));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uniqueId,
        name,
        backgroundColor,
        automationString,
        nodeRedFlowId,
        firstNodeId,
        iconCodePoint,
        image,
        lastDateOfExecute,
        stateMassage,
        senderDeviceOs,
        senderDeviceModel,
        senderId,
        compUuid,
        entityStateGRPC,
        repeateType,
        repeateDateDays,
        repeateDateHour,
        repeateDateMinute
      ]);

  /// Create a copy of RoutineCbjEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineCbjEntityImplCopyWith<_$RoutineCbjEntityImpl> get copyWith =>
      __$$RoutineCbjEntityImplCopyWithImpl<_$RoutineCbjEntityImpl>(
          this, _$identity);
}

abstract class _RoutineCbjEntity extends RoutineCbjEntity {
  const factory _RoutineCbjEntity(
          {required final UniqueId uniqueId,
          required final RoutineCbjName name,
          required final RoutineCbjBackgroundColor backgroundColor,
          required final RoutineCbjAutomationString automationString,
          required final RoutineCbjNodeRedFlowId nodeRedFlowId,
          required final RoutineCbjFirstNodeId firstNodeId,
          required final RoutineCbjIconCodePoint iconCodePoint,
          required final RoutineCbjBackgroundImage image,
          required final RoutineCbjLastDateOfExecute lastDateOfExecute,
          required final RoutineCbjStateMassage stateMassage,
          required final RoutineCbjSenderDeviceOs senderDeviceOs,
          required final RoutineCbjSenderDeviceModel senderDeviceModel,
          required final RoutineCbjSenderId senderId,
          required final RoutineCbjCompUuid compUuid,
          required final RoutineCbjDeviceStateGRPC entityStateGRPC,
          required final RoutineCbjRepeatType repeateType,
          required final RoutineCbjRepeatDateDays repeateDateDays,
          required final RoutineCbjRepeatDateHour repeateDateHour,
          required final RoutineCbjRepeatDateMinute repeateDateMinute}) =
      _$RoutineCbjEntityImpl;
  const _RoutineCbjEntity._() : super._();

  /// The unique id of the routine, will alsow be used as the flow/tab id.
  @override
  UniqueId get uniqueId;

  /// Name of the automation, will be shown to the user.
  @override
  RoutineCbjName get name;
  @override
  RoutineCbjBackgroundColor get backgroundColor;

  /// All the automation as string.
  @override
  RoutineCbjAutomationString get automationString;

  /// Node-Red flow id of the scene
  @override
  RoutineCbjNodeRedFlowId get nodeRedFlowId;

  /// The actual id of the first node, most of the time will be the same as
  /// uniqueId variable.
  @override
  RoutineCbjFirstNodeId get firstNodeId;

  /// The Unicode code point at which this icon is stored in the icon font.
  @override
  RoutineCbjIconCodePoint get iconCodePoint;
  @override
  RoutineCbjBackgroundImage get image;
  @override
  RoutineCbjLastDateOfExecute get lastDateOfExecute;
  @override
  RoutineCbjStateMassage get stateMassage;
  @override
  RoutineCbjSenderDeviceOs get senderDeviceOs;
  @override
  RoutineCbjSenderDeviceModel get senderDeviceModel;
  @override
  RoutineCbjSenderId get senderId;
  @override
  RoutineCbjCompUuid get compUuid;
  @override
  RoutineCbjDeviceStateGRPC get entityStateGRPC;

  /// Repeat type, at a specific time/ interval/ iterval between times
  @override
  RoutineCbjRepeatType get repeateType;

  /// In what days to repeat in
  @override
  RoutineCbjRepeatDateDays get repeateDateDays;

  /// In what hour to repeat in
  @override
  RoutineCbjRepeatDateHour get repeateDateHour;

  /// In what minute to repeat in
  @override
  RoutineCbjRepeatDateMinute get repeateDateMinute;

  /// Create a copy of RoutineCbjEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineCbjEntityImplCopyWith<_$RoutineCbjEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
