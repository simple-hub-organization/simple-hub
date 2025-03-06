
var ctrl_node = undefined
var device = undefined
var cluser = undefined

export const  simpleClusters = [
    "3", // Identify
    "6", // OnOff
    "8", // LevelControl
    "28", // PulseWidthModulation
    "31", // AccessControl
    "37", // Actions
    "43", // LocalizationConfiguration
    "46", // PowerSourceConfiguration
    "47", // PowerSource
    "56", // TimeSynchronization
    "59", // Switch
    "69", // BooleanState
    "72", // OvenCavityOperationalState
    "73", // OvenMode
    "74", // LaundryDryerControls
    "80", // ModeSelect
    "81", // LaundryWasherMode
    "82", // RefrigeratorAndTemperatureControlledCabinetMode
    "83", // LaundryWasherControls
    "84", // RvcRunMode
    "85", // RvcCleanMode
    "86", // TemperatureControl
    "87", // RefrigeratorAlarm
    "89", // DishwasherMode
    "91", // AirQuality
    "92", // SmokeCoAlarm
    "93", // DishwasherAlarm
    "94", // MicrowaveOvenMode
    "95", // MicrowaveOvenControl
    "97", // RvcOperationalState
    "113", // HepaFilterMonitoring
    "114", // ActivatedCarbonFilterMonitoring
    "129", // ValveConfigurationAndControl
    "144", // ElectricalPowerMeasurement
    "145", // ElectricalEnergyMeasurement
    "151", // Messages
    "152", // DeviceEnergyManagement
    "153", // EnergyEvse
    "155", // EnergyPreference
    "156", // PowerTopology
    "157", // EnergyEvseMode
    "159", // DeviceEnergyManagementMode
    "257", // DoorLock
    "258", // WindowCovering
    "512", // PumpConfigurationAndControl
    "513", // Thermostat
    "514", // FanControl
    "768", // ColorControl
    "1024", // IlluminanceMeasurement
    "1026", // TemperatureMeasurement
    "1027", // PressureMeasurement
    "1028", // FlowMeasurement
    "1029", // RelativeHumidityMeasurement
    "1030", // OccupancySensing
    "1036", // CarbonMonoxideConcentrationMeasurement
    "1037", // CarbonDioxideConcentrationMeasurement
    "1043", // NitrogenDioxideConcentrationMeasurement
    "1045", // OzoneConcentrationMeasurement
    "1066", // Pm25ConcentrationMeasurement
    "1067", // FormaldehydeConcentrationMeasurement
    "1068", // Pm1ConcentrationMeasurement
    "1069", // Pm10ConcentrationMeasurement
    "1070", // TotalVolatileOrganicCompoundsConcentrationMeasurement
    "1071", // RadonConcentrationMeasurement
    "1283", // WakeOnLan
    "1289", // KeypadInput
]



const simpleCommands ={
    '3': [ 'identify' ],
    '6': [
      'off',
      'on',
      'toggle'

    ],
    '8': [
      'moveToLevel',
      'moveToLevelWithOnOff',
    ],
    '37': [
      'instantAction',
      'startAction',
      'stopAction',
      'pauseAction',
    ],
    '56': [
      'setUtcTime',
      'setTimeZone',
      'setDstOffset'
    ],
    '80': [ 'changeToMode' ],
    '86': [ 'setTemperature' ],
    '87': [ 'modifyEnabledAlarms' ],
    '92': [ 'selfTestRequest' ],
    '94': [ 'changeToMode', 'changeToModeResponse' ],
    '95': [ 'setCookingParameters', 'addMoreTime' ],
    '97': [
      'pause',
      'stop',
      'start',
      'resume',
      'operationalCommandResponse',
      'goHome'
    ],
    '129': [ 'open', 'close' ],
    '151': [ 'presentMessagesRequest', 'cancelMessagesRequest' ],
    '152': [
      'powerAdjustRequest',
      'cancelPowerAdjustRequest',
      'startTimeAdjustRequest',
      'pauseRequest',
      'resumeRequest',
      'modifyForecastRequest',
      'requestConstraintBasedForecast',
      'cancelRequest'
    ],
    '153': [
      'disable',
      'enableCharging',
      'enableDischarging',
      'startDiagnostics',
      'setTargets',
      'getTargets',
      'clearTargets',
      'getTargetsResponse'
    ],
    '257': [
      'lockDoor',
      'unlockDoor',
      'toggle',
      'unlockWithTimeout',
      'unboltDoor'
    ],
    '258': [
      'upOrOpen',
      'downOrClose',
      'stopMotion',
      'goToLiftValue',
      'goToLiftPercentage',
      'goToTiltValue',
      'goToTiltPercentage'
    ],
    '513': [
      'setpointRaiseLower'
    ],
    '514': [ 'step' ],
    '768': [
      'moveToHue',
      'moveToSaturation',
      'moveToHueAndSaturation',
      'moveToColor',
      'moveToColorTemperature',
      'enhancedMoveToHue',

    ],
    '1289': [ 'sendKey', 'sendKeyResponse' ],
}
  
const simpleAttributes = {
    '3': [  
        'identifyTime'
    ],
    '6': [
      'onOff',
      'onTime'
    ],
    '8': [
      'currentLevel',        
      'minLevel',
      'maxLevel',           
    ],
    '37': [  'actionList', 'endpointLists', 'setupUrl' ],
    '43': [  'activeLocale', 'supportedLocales' ],
    '46': [  'sources' ],
    '47': [
      'batVoltage',
      'batPercentRemaining',
      'batChargeLevel',
      'batReplacementNeeded',
      'batReplaceability',
    ],
    '56': [
      'utcTime',
      'granularity',
      'timeSource',
      'trustedTimeSource',
      'defaultNtp',
      'timeZone',
      'dstOffset',
      'localTime',
      'timeZoneDatabase',
      'ntpServerAvailable',
      'timeZoneListMaxSize',
      'dstOffsetListMaxSize',
      'supportsDnsResolve'
    ],
    '59': [
      'numberOfPositions',
      'currentPosition',
      'multiPressMax'
    ],
    '69': [  'stateValue' ],
    '74': [
      'supportedDrynessLevels',
      'selectedDrynessLevel'
    ],
    '80': [
      'description',
      'standardNamespace',
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '81': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '82': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '83': [
      'spinSpeeds',
      'spinSpeedCurrent',
      'numberOfRinses',
      'supportedRinses'
    ],
    '84': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '85': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '86': [
      'temperatureSetpoint',
      'minTemperature',
      'maxTemperature',
      'step',
      'selectedTemperatureLevel',
      'supportedTemperatureLevels'
    ],
    '89': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '91': [   'airQuality' ],
    '92': [
      'expressedState',
      'smokeState',
      'coState',
      'batteryAlert',
      'deviceMuted',
      'testInProgress',
      'hardwareFaultAlert',
      'endOfServiceAlert',
      'interconnectSmokeAlarm',
      'interconnectCoAlarm',
      'contaminationState',
      'smokeSensitivityLevel',
      'expiryDate'
    ],
    '94': [
      'supportedModes',
      'currentMode',
      'startUpMode',
      'onMode'
    ],
    '95': [
      'cookTime',
      'maxCookTime',
      'powerSetting',
      'minPower',
      'maxPower',
      'powerStep',
      'supportedWatts',
      'selectedWattIndex',
      'wattRating'
    ],
    '129': [
      'openDuration',
      'defaultOpenDuration',
      'autoCloseTime',
      'remainingDuration',
      'currentState',
      'targetState',
      'currentLevel',
      'targetLevel',
      'defaultOpenLevel',
      'valveFault',
      'levelStep'
    ],
    '144': [
      'powerMode',
      'numberOfMeasurementTypes',
      'accuracy',
      'ranges',
      'voltage',
      'activeCurrent',
      'reactiveCurrent',
      'apparentCurrent',
      'activePower',
      'reactivePower',
      'apparentPower',
      'rmsVoltage',
      'rmsCurrent',
      'rmsPower',
      'frequency',
      'harmonicCurrents',
      'harmonicPhases',
      'powerFactor',
      'neutralCurrent'
    ],
    '145': [
      'accuracy',
      'cumulativeEnergyImported',
      'cumulativeEnergyExported',
      'periodicEnergyImported',
      'periodicEnergyExported',
      'cumulativeEnergyReset'
    ],
    '151': [   'messages', 'activeMessageIDs' ],
    '152': [
      'esaType',
      'esaCanGenerate',
      'esaState',
      'absMinPower',
      'absMaxPower',
      'powerAdjustmentCapability',
      'forecast',
      'optOutState'
    ],
    '153': [
      'state',
      'supplyState',
      'faultState',
      'chargingEnabledUntil',
      'dischargingEnabledUntil',
      'circuitCapacity',
      'minimumChargeCurrent',
      'maximumChargeCurrent',
      'maximumDischargeCurrent',
      'userMaximumChargeCurrent',
      'randomizationDelayWindow',
      'nextChargeStartTime',
      'nextChargeTargetTime',
      'nextChargeRequiredEnergy',
      'nextChargeTargetSoC',
      'approximateEvEfficiency',
      'stateOfCharge',
      'batteryCapacity',
      'vehicleId',
      'sessionId',
      'sessionDuration',
      'sessionEnergyCharged',
      'sessionEnergyDischarged'
    ],
    '155': [
      'energyBalances',
      'currentEnergyBalance',
      'energyPriorities',
      'lowPowerModeSensitivities',
      'currentLowPowerModeSensitivity'
    ],
    '156': [
      'availableEndpoints',
      'activeEndpoints'
    ],
    '257': [
      'lockState',
      'lockType',
      'actuatorEnabled',
      'doorState',
      'doorOpenEvents',
      'doorClosedEvents',
    ],
    '258': [
      'type',
      'currentPositionLift',
      'currentPositionTilt',
      'numberOfActuationsLift',
      'numberOfActuationsTilt',
      'currentPositionLiftPercentage',
      'currentPositionTiltPercentage',
      'operationalStatus',
      'targetPositionLiftPercent100ths',
      'targetPositionTiltPercent100ths',
      'endProductType',
      'currentPositionLiftPercent100ths',
      'currentPositionTiltPercent100ths',
      'mode',
    ],
    '512': [
      'maxPressure',
      'maxSpeed',
      'maxFlow',
      'minConstPressure',
      'maxConstPressure',
      'minCompPressure',
      'maxCompPressure',
      'minConstSpeed',
      'maxConstSpeed',
      'minConstFlow',
      'maxConstFlow',
      'minConstTemp',
      'maxConstTemp',
      'pumpStatus',
      'effectiveOperationMode',
      'effectiveControlMode',
      'capacity',
      'speed',
      'lifetimeRunningHours',
      'power',
      'lifetimeEnergyConsumed',
      'operationMode',
      'controlMode',
      'alarmMask'
    ],
    '513': [
      'localTemperature',
      'occupancy',
      'absMinHeatSetpointLimit',
      'absMaxHeatSetpointLimit',
      'absMinCoolSetpointLimit',
      'absMaxCoolSetpointLimit',
      'occupiedCoolingSetpoint',
      'occupiedHeatingSetpoint',
      'unoccupiedCoolingSetpoint',
      'unoccupiedHeatingSetpoint',
      'minHeatSetpointLimit',
      'maxHeatSetpointLimit',
      'minCoolSetpointLimit',
      'maxCoolSetpointLimit',
      'minSetpointDeadBand'
    ],
    '514': [
       
      'fanMode',         
      'fanModeSequence',
      'percentSetting',  
      'percentCurrent',
      'speedMax',        
      'speedSetting',
      'speedCurrent',    
      'rockSupport',
      'rockSetting',     
      'windSupport',
      'windSetting',     
      'airflowDirection'
    ],
    '768': [
      'currentHue',
      'currentSaturation',
      'colorTemperatureMireds',
      'colorMode'
    ],
    '1024': [
      'measuredValue',
      'minMeasuredValue',
      'maxMeasuredValue',
      'tolerance',
      'lightSensorType'
    ],
    '1026': [
      'measuredValue',
      'minMeasuredValue',
      'maxMeasuredValue',
      'tolerance'
    ],
    '1027': [
      'measuredValue',
      'minMeasuredValue',
      'maxMeasuredValue',
      'tolerance',
      'scaledValue',
      'minScaledValue',
      'maxScaledValue',
      'scaledTolerance',
      'scale'
    ],
    '1028': [
      'measuredValue',
      'minMeasuredValue',
      'maxMeasuredValue',
      'tolerance'
    ],
    '1029': [
      'measuredValue',
      'minMeasuredValue',
      'maxMeasuredValue',
      'tolerance'
    ],
    '1030': [
      'occupancy',
      'occupancySensorType'
    ],
    '1283': [ 'macAddress', 'linkLocalAddress' ],
  }
  