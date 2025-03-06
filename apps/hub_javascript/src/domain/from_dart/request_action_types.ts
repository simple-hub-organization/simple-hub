export enum EntityStateGRPC {
    Undefined = "undefined",
    LoadingFromDb = "loadingFromDb",
    CancelStateInProcess = "cancelStateInProcess",
    Ack = "ack",
    NewStateFailed = "newStateFailed",
    WaitingInCloud = "waitingInCloud",
    WaitingInComp = "waitingInComp",
    NoEntitiesToTransfer = "noEntitiesToTransfer",
    PingNow = "pingNow",
    AddingNewScene = "addingNewScene",
    AddingNewRoutine = "addingNewRoutine",
    AddingNewBinding = "addingNewBinding",
    UpdateHubEntityPropertiesFromRealEntity = "updateHubEntityPropertiesFromRealEntity",
    AddNewEntityFromJavascriptHub = "addNewEntityFromJavascriptHub",
}

export function entityStateGRPCFromString(typeAsString: string): EntityStateGRPC {
    return Object.values(EntityStateGRPC).includes(typeAsString as EntityStateGRPC) 
        ? typeAsString as EntityStateGRPC 
        : EntityStateGRPC.Undefined;
}

export enum VendorsAndServices {
    Undefined = "undefined",
    EspHome = "espHome",
    SwitcherSmartHome = "switcherSmartHome",
    Tasmota = "tasmota",
    Yeelight = "yeelight",
    Google = "google",
    MiHome = "miHome",
    Lifx = "lifx",
    Shelly = "shelly",
    SonoffDiy = "sonoffDiy",
    PhilipsHue = "philipsHue",
    Hp = "hp",
    Yeelink = "yeelink",
    Xiaomi = "xiaomi",
    SonoffEweLink = "sonoffEweLink",
    CbjDeviceSmartEntity = "cbjDeviceSmartEntity",
    Wiz = "wiz",
    Sensibo = "sensibo",
    XiaomiMi = "xiaomiMi",
    CyBearJinniAppSmartEntity = "cyBearJinniAppSmartEntity",
    SecurityBear = "securityBear",
    JinniAssistant = "jinniAssistant",
    Apple = "apple",
    Matter = "matter",
}

export function vendorsAndServicesFromString(typeAsString: string): VendorsAndServices {
    return Object.values(VendorsAndServices).includes(typeAsString as VendorsAndServices) 
        ? typeAsString as VendorsAndServices 
        : VendorsAndServices.Undefined;
}

export enum EntityTypes {
    Undefined = "undefined",
    Light = "light",
    Blinds = "blinds",
    Boiler = "boiler",
    Switch = "switch_",
    DimmableLight = "dimmableLight",
    RgbwLights = "rgbwLights",
    SmartTV = "smartTV",
    SecurityCamera = "securityCamera",
    SmartPlug = "smartPlug",
    Printer = "printer",
    SmartComputer = "smartComputer",
    EmptyEntity = "emptyEntity",
    PingEntity = "pingEntity",
    Ac = "ac",
}

export enum EntityActions {
    Undefined = "undefined",
    On = "on",
    Off = "off",
    MoveUp = "moveUp",
    Stop = "stop",
    MoveDown = "moveDown",
    Pressed = "pressed",
    LongPress = "longPress",
    DoubleTap = "doubleTap",
    Position = "position",
    Suspend = "suspend",
    Shutdown = "shutdown",
    ItIsFalse = "itIsFalse",
    ItIsTrue = "itIsTrue",
    PausePlay = "pausePlay",
    ChangeVolume = "changeVolume",
    Jump = "jump",
    Skip = "skip",
    Pause = "pause",
    Play = "play",
    VolumeUp = "volumeUp",
    VolumeDown = "volumeDown",
    SkipForward = "skipForeword",
    SkipBackward = "skipBackward",
    SkipNextVid = "skipNextVid",
    SkipPreviousVid = "skipPreviousVid",
    Open = "open",
    OpenUrl = "openUrl",
    Close = "close",
    ChangeTemperature = "changeTemperature",
    ChangeMod = "changeMod",
    Speak = "speak",
    HsvColor = "hsvColor",
    UseValue = "useValue",
    addEntity = "addEntity",
}

export function entityActionsFromString(typeAsString: string): EntityActions {
    return Object.values(EntityActions).includes(typeAsString as EntityActions) 
        ? typeAsString as EntityActions 
        : EntityActions.Undefined;
}

export enum WhenToExecute {
    Undefined = "undefined",
    OnOddNumberPress = "onOddNumberPress",
    EvenNumberPress = "evenNumberPress",
    BetweenSelectedTime = "betweenSelectedTime",
    DoNotBetweenSelectedTime = "doNotBetweenSelectedTime",
    AllTheTime = "allTheTime",
    Never = "never",
    OnceNow = "onceNow",
    OnceInSelectedTime = "onceInSelectedTime",
    OnlyIfEntityListAreInActionListState = "onlyIfEntityListAreInActionListState",
    AtHome = "atHome",
    OutOfHome = "outOfHome",
    AtASpecificTime = "atASpecificTime",
}

export enum ActionValues {
    Undefined = "undefined",
    Text = "text",
    Url = "url",
    Brightness = "brightness",
    Alpha = "alpha",
    Hue = "hue",
    Saturation = "saturation",
    ColorValue = "colorValue",
    ColorTemperature = "colorTemperature",
    Duration = "duration",
    TransitionDuration = "transitionDuration",
}

export function actionValuesFromString(typeAsString: string): ActionValues {
    return Object.values(ActionValues).includes(typeAsString as ActionValues) 
        ? typeAsString as ActionValues 
        : ActionValues.Undefined;
}

export enum VendorLoginTypes {
    NotNeeded = "notNeeded",
    AuthToken = "authToken",
    ApiKey = "apiKey",
    EmailAndPassword = "emailAndPassword",
}

export enum SendingType {
    Undefined = "undefined",
    StringType = "stringType",
    PartialEntityType = "partialEntityType",
    EntityType = "entityType",
    MqttMassageType = "mqttMassageType",
    SceneType = "sceneType",
    ScheduleType = "scheduleType",
    RoutineType = "routineType",
    BindingsType = "bindingsType",
    VendorLoginType = "vendorLoginType",
    FirstConnection = "firstConnection",
    RemotePipesInformation = "remotePipesInformation",
    GetHubEntityInfo = "getHubEntityInfo",
    ResponseHubEntityInfo = "responseHubEntityInfo",
    AreaType = "areaType",
    Location = "location",
    AllEntities = "allEntities",
    AllAreas = "allAreas",
    AllScenes = "allScenes",
    SetEntitiesAction = "setEntitiesAction",
}

export function sendingTypeFromString(typeAsString: string): SendingType {
    return Object.values(SendingType).includes(typeAsString as SendingType) 
        ? typeAsString as SendingType 
        : SendingType.Undefined;
}

export enum AreaPurposesTypes {
    Undefined = "undefined",
    Sleep = "sleep",
    Study = "study",
    Work = "work",
    WatchTv = "watchTv",
    VideoGames = "videoGames",
    Rest = "rest",
    Dining = "dining",
    DateNight = "dateNight",
    Romance = "romance",
    Movie = "movie",
    AttractMosquitoes = "attractMosquitoes",
    RepelMosquitoes = "repelMosquitoes",
}

export function areaPurposesTypesFromString(typeAsString: string): AreaPurposesTypes {
    return Object.values(AreaPurposesTypes).includes(typeAsString as AreaPurposesTypes) 
        ? typeAsString as AreaPurposesTypes 
        : AreaPurposesTypes.Undefined;
}

export enum ColorMode {
    Undefined = "undefined",
    Rgb = "rgb",
    White = "white",
}

export function colorModeFromString(typeAsString: string): ColorMode {
    return Object.values(ColorMode).includes(typeAsString as ColorMode) 
        ? typeAsString as ColorMode 
        : ColorMode.Undefined;
}
