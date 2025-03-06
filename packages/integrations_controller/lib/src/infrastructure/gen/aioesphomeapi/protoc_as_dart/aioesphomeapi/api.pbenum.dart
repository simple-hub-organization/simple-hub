//
//  Generated code. Do not modify.
//  source: aioesphomeapi/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LegacyCoverState extends $pb.ProtobufEnum {
  static const LegacyCoverState LEGACY_COVER_STATE_OPEN = LegacyCoverState._(0, _omitEnumNames ? '' : 'LEGACY_COVER_STATE_OPEN');
  static const LegacyCoverState LEGACY_COVER_STATE_CLOSED = LegacyCoverState._(1, _omitEnumNames ? '' : 'LEGACY_COVER_STATE_CLOSED');

  static const $core.List<LegacyCoverState> values = <LegacyCoverState> [
    LEGACY_COVER_STATE_OPEN,
    LEGACY_COVER_STATE_CLOSED,
  ];

  static final $core.Map<$core.int, LegacyCoverState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LegacyCoverState? valueOf($core.int value) => _byValue[value];

  const LegacyCoverState._($core.int v, $core.String n) : super(v, n);
}

class CoverOperation extends $pb.ProtobufEnum {
  static const CoverOperation COVER_OPERATION_IDLE = CoverOperation._(0, _omitEnumNames ? '' : 'COVER_OPERATION_IDLE');
  static const CoverOperation COVER_OPERATION_IS_OPENING = CoverOperation._(1, _omitEnumNames ? '' : 'COVER_OPERATION_IS_OPENING');
  static const CoverOperation COVER_OPERATION_IS_CLOSING = CoverOperation._(2, _omitEnumNames ? '' : 'COVER_OPERATION_IS_CLOSING');

  static const $core.List<CoverOperation> values = <CoverOperation> [
    COVER_OPERATION_IDLE,
    COVER_OPERATION_IS_OPENING,
    COVER_OPERATION_IS_CLOSING,
  ];

  static final $core.Map<$core.int, CoverOperation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CoverOperation? valueOf($core.int value) => _byValue[value];

  const CoverOperation._($core.int v, $core.String n) : super(v, n);
}

class LegacyCoverCommand extends $pb.ProtobufEnum {
  static const LegacyCoverCommand LEGACY_COVER_COMMAND_OPEN = LegacyCoverCommand._(0, _omitEnumNames ? '' : 'LEGACY_COVER_COMMAND_OPEN');
  static const LegacyCoverCommand LEGACY_COVER_COMMAND_CLOSE = LegacyCoverCommand._(1, _omitEnumNames ? '' : 'LEGACY_COVER_COMMAND_CLOSE');
  static const LegacyCoverCommand LEGACY_COVER_COMMAND_STOP = LegacyCoverCommand._(2, _omitEnumNames ? '' : 'LEGACY_COVER_COMMAND_STOP');

  static const $core.List<LegacyCoverCommand> values = <LegacyCoverCommand> [
    LEGACY_COVER_COMMAND_OPEN,
    LEGACY_COVER_COMMAND_CLOSE,
    LEGACY_COVER_COMMAND_STOP,
  ];

  static final $core.Map<$core.int, LegacyCoverCommand> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LegacyCoverCommand? valueOf($core.int value) => _byValue[value];

  const LegacyCoverCommand._($core.int v, $core.String n) : super(v, n);
}

class FanSpeed extends $pb.ProtobufEnum {
  static const FanSpeed FAN_SPEED_LOW = FanSpeed._(0, _omitEnumNames ? '' : 'FAN_SPEED_LOW');
  static const FanSpeed FAN_SPEED_MEDIUM = FanSpeed._(1, _omitEnumNames ? '' : 'FAN_SPEED_MEDIUM');
  static const FanSpeed FAN_SPEED_HIGH = FanSpeed._(2, _omitEnumNames ? '' : 'FAN_SPEED_HIGH');

  static const $core.List<FanSpeed> values = <FanSpeed> [
    FAN_SPEED_LOW,
    FAN_SPEED_MEDIUM,
    FAN_SPEED_HIGH,
  ];

  static final $core.Map<$core.int, FanSpeed> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FanSpeed? valueOf($core.int value) => _byValue[value];

  const FanSpeed._($core.int v, $core.String n) : super(v, n);
}

class FanDirection extends $pb.ProtobufEnum {
  static const FanDirection FAN_DIRECTION_FORWARD = FanDirection._(0, _omitEnumNames ? '' : 'FAN_DIRECTION_FORWARD');
  static const FanDirection FAN_DIRECTION_REVERSE = FanDirection._(1, _omitEnumNames ? '' : 'FAN_DIRECTION_REVERSE');

  static const $core.List<FanDirection> values = <FanDirection> [
    FAN_DIRECTION_FORWARD,
    FAN_DIRECTION_REVERSE,
  ];

  static final $core.Map<$core.int, FanDirection> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FanDirection? valueOf($core.int value) => _byValue[value];

  const FanDirection._($core.int v, $core.String n) : super(v, n);
}

/// ==================== SENSOR ====================
class SensorStateClass extends $pb.ProtobufEnum {
  static const SensorStateClass STATE_CLASS_NONE = SensorStateClass._(0, _omitEnumNames ? '' : 'STATE_CLASS_NONE');
  static const SensorStateClass STATE_CLASS_MEASUREMENT = SensorStateClass._(1, _omitEnumNames ? '' : 'STATE_CLASS_MEASUREMENT');

  static const $core.List<SensorStateClass> values = <SensorStateClass> [
    STATE_CLASS_NONE,
    STATE_CLASS_MEASUREMENT,
  ];

  static final $core.Map<$core.int, SensorStateClass> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SensorStateClass? valueOf($core.int value) => _byValue[value];

  const SensorStateClass._($core.int v, $core.String n) : super(v, n);
}

/// ==================== SUBSCRIBE LOGS ====================
class LogLevel extends $pb.ProtobufEnum {
  static const LogLevel LOG_LEVEL_NONE = LogLevel._(0, _omitEnumNames ? '' : 'LOG_LEVEL_NONE');
  static const LogLevel LOG_LEVEL_ERROR = LogLevel._(1, _omitEnumNames ? '' : 'LOG_LEVEL_ERROR');
  static const LogLevel LOG_LEVEL_WARN = LogLevel._(2, _omitEnumNames ? '' : 'LOG_LEVEL_WARN');
  static const LogLevel LOG_LEVEL_INFO = LogLevel._(3, _omitEnumNames ? '' : 'LOG_LEVEL_INFO');
  static const LogLevel LOG_LEVEL_DEBUG = LogLevel._(4, _omitEnumNames ? '' : 'LOG_LEVEL_DEBUG');
  static const LogLevel LOG_LEVEL_VERBOSE = LogLevel._(5, _omitEnumNames ? '' : 'LOG_LEVEL_VERBOSE');
  static const LogLevel LOG_LEVEL_VERY_VERBOSE = LogLevel._(6, _omitEnumNames ? '' : 'LOG_LEVEL_VERY_VERBOSE');

  static const $core.List<LogLevel> values = <LogLevel> [
    LOG_LEVEL_NONE,
    LOG_LEVEL_ERROR,
    LOG_LEVEL_WARN,
    LOG_LEVEL_INFO,
    LOG_LEVEL_DEBUG,
    LOG_LEVEL_VERBOSE,
    LOG_LEVEL_VERY_VERBOSE,
  ];

  static final $core.Map<$core.int, LogLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LogLevel? valueOf($core.int value) => _byValue[value];

  const LogLevel._($core.int v, $core.String n) : super(v, n);
}

/// ==================== USER-DEFINES SERVICES ====================
class ServiceArgType extends $pb.ProtobufEnum {
  static const ServiceArgType SERVICE_ARG_TYPE_BOOL = ServiceArgType._(0, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_BOOL');
  static const ServiceArgType SERVICE_ARG_TYPE_INT = ServiceArgType._(1, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_INT');
  static const ServiceArgType SERVICE_ARG_TYPE_FLOAT = ServiceArgType._(2, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_FLOAT');
  static const ServiceArgType SERVICE_ARG_TYPE_STRING = ServiceArgType._(3, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_STRING');
  static const ServiceArgType SERVICE_ARG_TYPE_BOOL_ARRAY = ServiceArgType._(4, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_BOOL_ARRAY');
  static const ServiceArgType SERVICE_ARG_TYPE_INT_ARRAY = ServiceArgType._(5, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_INT_ARRAY');
  static const ServiceArgType SERVICE_ARG_TYPE_FLOAT_ARRAY = ServiceArgType._(6, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_FLOAT_ARRAY');
  static const ServiceArgType SERVICE_ARG_TYPE_STRING_ARRAY = ServiceArgType._(7, _omitEnumNames ? '' : 'SERVICE_ARG_TYPE_STRING_ARRAY');

  static const $core.List<ServiceArgType> values = <ServiceArgType> [
    SERVICE_ARG_TYPE_BOOL,
    SERVICE_ARG_TYPE_INT,
    SERVICE_ARG_TYPE_FLOAT,
    SERVICE_ARG_TYPE_STRING,
    SERVICE_ARG_TYPE_BOOL_ARRAY,
    SERVICE_ARG_TYPE_INT_ARRAY,
    SERVICE_ARG_TYPE_FLOAT_ARRAY,
    SERVICE_ARG_TYPE_STRING_ARRAY,
  ];

  static final $core.Map<$core.int, ServiceArgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceArgType? valueOf($core.int value) => _byValue[value];

  const ServiceArgType._($core.int v, $core.String n) : super(v, n);
}

/// ==================== CLIMATE ====================
class ClimateMode extends $pb.ProtobufEnum {
  static const ClimateMode CLIMATE_MODE_OFF = ClimateMode._(0, _omitEnumNames ? '' : 'CLIMATE_MODE_OFF');
  static const ClimateMode CLIMATE_MODE_HEAT_COOL = ClimateMode._(1, _omitEnumNames ? '' : 'CLIMATE_MODE_HEAT_COOL');
  static const ClimateMode CLIMATE_MODE_COOL = ClimateMode._(2, _omitEnumNames ? '' : 'CLIMATE_MODE_COOL');
  static const ClimateMode CLIMATE_MODE_HEAT = ClimateMode._(3, _omitEnumNames ? '' : 'CLIMATE_MODE_HEAT');
  static const ClimateMode CLIMATE_MODE_FAN_ONLY = ClimateMode._(4, _omitEnumNames ? '' : 'CLIMATE_MODE_FAN_ONLY');
  static const ClimateMode CLIMATE_MODE_DRY = ClimateMode._(5, _omitEnumNames ? '' : 'CLIMATE_MODE_DRY');
  static const ClimateMode CLIMATE_MODE_AUTO = ClimateMode._(6, _omitEnumNames ? '' : 'CLIMATE_MODE_AUTO');

  static const $core.List<ClimateMode> values = <ClimateMode> [
    CLIMATE_MODE_OFF,
    CLIMATE_MODE_HEAT_COOL,
    CLIMATE_MODE_COOL,
    CLIMATE_MODE_HEAT,
    CLIMATE_MODE_FAN_ONLY,
    CLIMATE_MODE_DRY,
    CLIMATE_MODE_AUTO,
  ];

  static final $core.Map<$core.int, ClimateMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClimateMode? valueOf($core.int value) => _byValue[value];

  const ClimateMode._($core.int v, $core.String n) : super(v, n);
}

class ClimateFanMode extends $pb.ProtobufEnum {
  static const ClimateFanMode CLIMATE_FAN_ON = ClimateFanMode._(0, _omitEnumNames ? '' : 'CLIMATE_FAN_ON');
  static const ClimateFanMode CLIMATE_FAN_OFF = ClimateFanMode._(1, _omitEnumNames ? '' : 'CLIMATE_FAN_OFF');
  static const ClimateFanMode CLIMATE_FAN_AUTO = ClimateFanMode._(2, _omitEnumNames ? '' : 'CLIMATE_FAN_AUTO');
  static const ClimateFanMode CLIMATE_FAN_LOW = ClimateFanMode._(3, _omitEnumNames ? '' : 'CLIMATE_FAN_LOW');
  static const ClimateFanMode CLIMATE_FAN_MEDIUM = ClimateFanMode._(4, _omitEnumNames ? '' : 'CLIMATE_FAN_MEDIUM');
  static const ClimateFanMode CLIMATE_FAN_HIGH = ClimateFanMode._(5, _omitEnumNames ? '' : 'CLIMATE_FAN_HIGH');
  static const ClimateFanMode CLIMATE_FAN_MIDDLE = ClimateFanMode._(6, _omitEnumNames ? '' : 'CLIMATE_FAN_MIDDLE');
  static const ClimateFanMode CLIMATE_FAN_FOCUS = ClimateFanMode._(7, _omitEnumNames ? '' : 'CLIMATE_FAN_FOCUS');
  static const ClimateFanMode CLIMATE_FAN_DIFFUSE = ClimateFanMode._(8, _omitEnumNames ? '' : 'CLIMATE_FAN_DIFFUSE');

  static const $core.List<ClimateFanMode> values = <ClimateFanMode> [
    CLIMATE_FAN_ON,
    CLIMATE_FAN_OFF,
    CLIMATE_FAN_AUTO,
    CLIMATE_FAN_LOW,
    CLIMATE_FAN_MEDIUM,
    CLIMATE_FAN_HIGH,
    CLIMATE_FAN_MIDDLE,
    CLIMATE_FAN_FOCUS,
    CLIMATE_FAN_DIFFUSE,
  ];

  static final $core.Map<$core.int, ClimateFanMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClimateFanMode? valueOf($core.int value) => _byValue[value];

  const ClimateFanMode._($core.int v, $core.String n) : super(v, n);
}

class ClimateSwingMode extends $pb.ProtobufEnum {
  static const ClimateSwingMode CLIMATE_SWING_OFF = ClimateSwingMode._(0, _omitEnumNames ? '' : 'CLIMATE_SWING_OFF');
  static const ClimateSwingMode CLIMATE_SWING_BOTH = ClimateSwingMode._(1, _omitEnumNames ? '' : 'CLIMATE_SWING_BOTH');
  static const ClimateSwingMode CLIMATE_SWING_VERTICAL = ClimateSwingMode._(2, _omitEnumNames ? '' : 'CLIMATE_SWING_VERTICAL');
  static const ClimateSwingMode CLIMATE_SWING_HORIZONTAL = ClimateSwingMode._(3, _omitEnumNames ? '' : 'CLIMATE_SWING_HORIZONTAL');

  static const $core.List<ClimateSwingMode> values = <ClimateSwingMode> [
    CLIMATE_SWING_OFF,
    CLIMATE_SWING_BOTH,
    CLIMATE_SWING_VERTICAL,
    CLIMATE_SWING_HORIZONTAL,
  ];

  static final $core.Map<$core.int, ClimateSwingMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClimateSwingMode? valueOf($core.int value) => _byValue[value];

  const ClimateSwingMode._($core.int v, $core.String n) : super(v, n);
}

class ClimateAction extends $pb.ProtobufEnum {
  static const ClimateAction CLIMATE_ACTION_OFF = ClimateAction._(0, _omitEnumNames ? '' : 'CLIMATE_ACTION_OFF');
  static const ClimateAction CLIMATE_ACTION_COOLING = ClimateAction._(2, _omitEnumNames ? '' : 'CLIMATE_ACTION_COOLING');
  static const ClimateAction CLIMATE_ACTION_HEATING = ClimateAction._(3, _omitEnumNames ? '' : 'CLIMATE_ACTION_HEATING');
  static const ClimateAction CLIMATE_ACTION_IDLE = ClimateAction._(4, _omitEnumNames ? '' : 'CLIMATE_ACTION_IDLE');
  static const ClimateAction CLIMATE_ACTION_DRYING = ClimateAction._(5, _omitEnumNames ? '' : 'CLIMATE_ACTION_DRYING');
  static const ClimateAction CLIMATE_ACTION_FAN = ClimateAction._(6, _omitEnumNames ? '' : 'CLIMATE_ACTION_FAN');

  static const $core.List<ClimateAction> values = <ClimateAction> [
    CLIMATE_ACTION_OFF,
    CLIMATE_ACTION_COOLING,
    CLIMATE_ACTION_HEATING,
    CLIMATE_ACTION_IDLE,
    CLIMATE_ACTION_DRYING,
    CLIMATE_ACTION_FAN,
  ];

  static final $core.Map<$core.int, ClimateAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClimateAction? valueOf($core.int value) => _byValue[value];

  const ClimateAction._($core.int v, $core.String n) : super(v, n);
}

class ClimatePreset extends $pb.ProtobufEnum {
  static const ClimatePreset CLIMATE_PRESET_NONE = ClimatePreset._(0, _omitEnumNames ? '' : 'CLIMATE_PRESET_NONE');
  static const ClimatePreset CLIMATE_PRESET_HOME = ClimatePreset._(1, _omitEnumNames ? '' : 'CLIMATE_PRESET_HOME');
  static const ClimatePreset CLIMATE_PRESET_AWAY = ClimatePreset._(2, _omitEnumNames ? '' : 'CLIMATE_PRESET_AWAY');
  static const ClimatePreset CLIMATE_PRESET_BOOST = ClimatePreset._(3, _omitEnumNames ? '' : 'CLIMATE_PRESET_BOOST');
  static const ClimatePreset CLIMATE_PRESET_COMFORT = ClimatePreset._(4, _omitEnumNames ? '' : 'CLIMATE_PRESET_COMFORT');
  static const ClimatePreset CLIMATE_PRESET_ECO = ClimatePreset._(5, _omitEnumNames ? '' : 'CLIMATE_PRESET_ECO');
  static const ClimatePreset CLIMATE_PRESET_SLEEP = ClimatePreset._(6, _omitEnumNames ? '' : 'CLIMATE_PRESET_SLEEP');
  static const ClimatePreset CLIMATE_PRESET_ACTIVITY = ClimatePreset._(7, _omitEnumNames ? '' : 'CLIMATE_PRESET_ACTIVITY');

  static const $core.List<ClimatePreset> values = <ClimatePreset> [
    CLIMATE_PRESET_NONE,
    CLIMATE_PRESET_HOME,
    CLIMATE_PRESET_AWAY,
    CLIMATE_PRESET_BOOST,
    CLIMATE_PRESET_COMFORT,
    CLIMATE_PRESET_ECO,
    CLIMATE_PRESET_SLEEP,
    CLIMATE_PRESET_ACTIVITY,
  ];

  static final $core.Map<$core.int, ClimatePreset> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClimatePreset? valueOf($core.int value) => _byValue[value];

  const ClimatePreset._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
