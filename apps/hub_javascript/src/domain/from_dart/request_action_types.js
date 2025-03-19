export const EntityStateGRPC = {
    Undefined: "undefined",
    LoadingFromDb: "loadingFromDb",
    CancelStateInProcess: "cancelStateInProcess",
    Ack: "ack",
    NewStateFailed: "newStateFailed",
    WaitingInCloud: "waitingInCloud",
    WaitingInComp: "waitingInComp",
    NoEntitiesToTransfer: "noEntitiesToTransfer",
    PingNow: "pingNow",
    AddingNewScene: "addingNewScene",
    AddingNewRoutine: "addingNewRoutine",
    AddingNewBinding: "addingNewBinding",
    UpdateHubEntityPropertiesFromRealEntity: "updateHubEntityPropertiesFromRealEntity",
    AddNewEntityFromJavascriptHub: "addNewEntityFromJavascriptHub",
};

export function entityStateGRPCFromString(typeAsString) {
    return Object.values(EntityStateGRPC).includes(typeAsString) 
        ? typeAsString 
        : EntityStateGRPC.Undefined;
}

export const VendorsAndServices = {
    Undefined: "undefined",
    EspHome: "espHome",
    SwitcherSmartHome: "switcherSmartHome",
    Tasmota: "tasmota",
    Yeelight: "yeelight",
    Google: "google",
    MiHome: "miHome",
    Lifx: "lifx",
    Shelly: "shelly",
    SonoffDiy: "sonoffDiy",
    PhilipsHue: "philipsHue",
    Hp: "hp",
    Yeelink: "yeelink",
    Xiaomi: "xiaomi",
    SonoffEweLink: "sonoffEweLink",
    CbjDeviceSmartEntity: "cbjDeviceSmartEntity",
    Wiz: "wiz",
    Sensibo: "sensibo",
    XiaomiMi: "xiaomiMi",
    CyBearJinniAppSmartEntity: "cyBearJinniAppSmartEntity",
    SecurityBear: "securityBear",
    JinniAssistant: "jinniAssistant",
    Apple: "apple",
    Matter: "matter",
};

export function vendorsAndServicesFromString(typeAsString) {
    return Object.values(VendorsAndServices).includes(typeAsString) 
        ? typeAsString 
        : VendorsAndServices.Undefined;
}

export const EntityTypes = {
    Undefined: "undefined",
    Light: "light",
    Blinds: "blinds",
    Boiler: "boiler",
    Switch: "switch_",
    DimmableLight: "dimmableLight",
    RgbwLights: "rgbwLights",
    SmartTV: "smartTV",
    SecurityCamera: "securityCamera",
    SmartPlug: "smartPlug",
    Printer: "printer",
    SmartComputer: "smartComputer",
    EmptyEntity: "emptyEntity",
    PingEntity: "pingEntity",
    Ac: "ac",
};

export const EntityActions = {
    Undefined: "undefined",
    On: "on",
    Off: "off",
    MoveUp: "moveUp",
    Stop: "stop",
    MoveDown: "moveDown",
    Pressed: "pressed",
    LongPress: "longPress",
    DoubleTap: "doubleTap",
    Position: "position",
    Suspend: "suspend",
    Shutdown: "shutdown",
    ItIsFalse: "itIsFalse",
    ItIsTrue: "itIsTrue",
    PausePlay: "pausePlay",
    ChangeVolume: "changeVolume",
    Jump: "jump",
    Skip: "skip",
    Pause: "pause",
    Play: "play",
    VolumeUp: "volumeUp",
    VolumeDown: "volumeDown",
    SkipForward: "skipForeword",
    SkipBackward: "skipBackward",
    SkipNextVid: "skipNextVid",
    SkipPreviousVid: "skipPreviousVid",
    Open: "open",
    OpenUrl: "openUrl",
    Close: "close",
    ChangeTemperature: "changeTemperature",
    ChangeMod: "changeMod",
    Speak: "speak",
    HsvColor: "hsvColor",
    UseValue: "useValue",
    addEntity: "addEntity",
};

export function entityActionsFromString(typeAsString) {
    return Object.values(EntityActions).includes(typeAsString) 
        ? typeAsString 
        : EntityActions.Undefined;
}

export const WhenToExecute = {
    Undefined: "undefined",
    OnOddNumberPress: "onOddNumberPress",
    EvenNumberPress: "evenNumberPress",
    BetweenSelectedTime: "betweenSelectedTime",
    DoNotBetweenSelectedTime: "doNotBetweenSelectedTime",
    AllTheTime: "allTheTime",
    Never: "never",
    OnceNow: "onceNow",
    OnceInSelectedTime: "onceInSelectedTime",
    OnlyIfEntityListAreInActionListState: "onlyIfEntityListAreInActionListState",
    AtHome: "atHome",
    OutOfHome: "outOfHome",
    AtASpecificTime: "atASpecificTime",
};

export const ActionValues = {
    Undefined: "undefined",
    Text: "text",
    Url: "url",
    Brightness: "brightness",
    Alpha: "alpha",
    Hue: "hue",
    Saturation: "saturation",
    ColorValue: "colorValue",
    ColorTemperature: "colorTemperature",
    Duration: "duration",
    TransitionDuration: "transitionDuration",
};

export function actionValuesFromString(typeAsString) {
    return Object.values(ActionValues).includes(typeAsString) 
        ? typeAsString 
        : ActionValues.Undefined;
}

export const VendorLoginTypes = {
    NotNeeded: "notNeeded",
    AuthToken: "authToken",
    ApiKey: "apiKey",
    EmailAndPassword: "emailAndPassword",
};

export const SendingType = {
    Undefined: "undefined",
    StringType: "stringType",
    PartialEntityType: "partialEntityType",
    EntityType: "entityType",
    MqttMassageType: "mqttMassageType",
    SceneType: "sceneType",
    ScheduleType: "scheduleType",
    RoutineType: "routineType",
    BindingsType: "bindingsType",
    VendorLoginType: "vendorLoginType",
    FirstConnection: "firstConnection",
    RemotePipesInformation: "remotePipesInformation",
    GetHubEntityInfo: "getHubEntityInfo",
    ResponseHubEntityInfo: "responseHubEntityInfo",
    AreaType: "areaType",
    Location: "location",
    AllEntities: "allEntities",
    AllAreas: "allAreas",
    AllScenes: "allScenes",
    SetEntitiesAction: "setEntitiesAction",
};

export function sendingTypeFromString(typeAsString) {
    return Object.values(SendingType).includes(typeAsString) 
        ? typeAsString 
        : SendingType.Undefined;
}

export const AreaPurposesTypes = {
    Undefined: "undefined",
    Sleep: "sleep",
    Study: "study",
    Work: "work",
    WatchTv: "watchTv",
    VideoGames: "videoGames",
    Rest: "rest",
    Dining: "dining",
    DateNight: "dateNight",
    Romance: "romance",
    Movie: "movie",
    AttractMosquitoes: "attractMosquitoes",
    RepelMosquitoes: "repelMosquitoes",
};

export function areaPurposesTypesFromString(typeAsString) {
    return Object.values(AreaPurposesTypes).includes(typeAsString) 
        ? typeAsString 
        : AreaPurposesTypes.Undefined;
}

export const ColorMode = {
    Undefined: "undefined",
    Rgb: "rgb",
    White: "white",
};

export function colorModeFromString(typeAsString) {
    return Object.values(ColorMode).includes(typeAsString) 
        ? typeAsString 
        : ColorMode.Undefined;
} 