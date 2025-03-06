import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/general_api.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

/// We are using the term entity to describe individual integrations on a single device
/// So for example switch with three buttons will have three entities
abstract class DeviceEntityBase {
  DeviceEntityBase({
    required this.uniqueId,
    required this.entityUniqueId,
    required this.cbjDeviceVendor,
    required this.entityTypes,
    required this.cbjEntityName,
    required this.stateMassage,
    required this.senderDeviceOs,
    required this.senderDeviceModel,
    required this.senderId,
    required this.compUuid,
    required this.entityStateGRPC,
    required this.entityOriginalName,
    required this.deviceOriginalName,
    required this.powerConsumption,
    required this.deviceUniqueId,
    required this.devicePort,
    required this.deviceLastKnownIp,
    required this.deviceHostName,
    required this.deviceMdns,
    required this.devicesMacAddress,
    required this.entityKey,
    required this.requestTimeStamp,
    required this.lastResponseFromDeviceTimeStamp,
    required this.entityCbjUniqueId,
    required this.srvResourceRecord,
    required this.srvTarget,
    required this.ptrResourceRecord,
    required this.mdnsServiceType,
    required this.deviceVendor,
    required this.deviceNetworkLastUpdate,
  });

  /// The unique id that CyBear Jinni Hub gave the device
  CoreUniqueId uniqueId;

  /// The unique id that each company gave their device
  EntityUniqueId entityUniqueId;

  /// The name to show in cbj app, can be changed by the use
  CbjEntityName cbjEntityName;

  /// The name of the entity from the vendor api, user should only view it
  EntityOriginalName entityOriginalName;

  /// The name of the device that the entity exist on from the api, user should only view it
  DeviceOriginalName deviceOriginalName;

  /// Did the massage arrived or was it just sent.
  /// Will be 'set' (need change) or 'ack' for acknowledge
  EntityState entityStateGRPC;

  /// If state didn't change the error description will be found here.
  DeviceStateMassage stateMassage;

  /// Sender GenericLight os type, example: android, iphone, browser
  DeviceSenderDeviceOs senderDeviceOs;

  /// The sender GenericLight model; example: onePlus 3T
  DeviceSenderDeviceModel senderDeviceModel;

  /// Last GenericLight sender id that activated the action
  DeviceSenderId senderId;

  /// The smart entity type
  EntityType entityTypes;

  /// The vendor assignd by cbj
  CbjDeviceVendor cbjDeviceVendor;

  /// Device vendor as discoverd by network search
  DeviceVendor deviceVendor;

  /// Last time the device was connected to network as discovered by netowrk serach
  DeviceNetworkLastUpdate deviceNetworkLastUpdate;

  /// Unique id of the computer
  DeviceCompUuid compUuid;

  /// Power consumption of the device
  DevicePowerConsumption powerConsumption;

  /// Unique id of the device that the entity exists on
  DeviceUniqueId deviceUniqueId;

  /// Port of the device
  DevicePort devicePort;

  /// Last known ip
  DeviceLastKnownIp deviceLastKnownIp;

  /// Device Host name
  DeviceHostName deviceHostName;

  /// Device Mdns
  DeviceMdns deviceMdns;

  DeviceSrvResourceRecord srvResourceRecord;
  DeviceSrvTarget srvTarget;
  DevicePtrResourceRecord ptrResourceRecord;

  DeviceMdnsServiceType mdnsServiceType;

  /// Mac address of the device
  DevicesMacAddress devicesMacAddress;

  /// Some entities will use key to transmit the states via the api
  EntityKey entityKey;

  /// Time that the action got sent from the app
  RequestTimeStamp requestTimeStamp;

  /// Time of the last response from the device
  LastResponseFromDeviceTimeStamp lastResponseFromDeviceTimeStamp;

  /// Unique id that cbj creates for the device that the entity is stored on
  CoreUniqueId entityCbjUniqueId;

  String get getCbjEntityId => entityCbjUniqueId.getOrCrash();

  /// Copy with device state to waiting or ack
  DeviceEntityBase copyWithDeviceState(EntityStateGRPC entityStateGRPC) => this;

  /// Copy with device action
  DeviceEntityBase copyWithDeviceAction(EntityActions deviceActions) => this;

  /// Copy with stateMassage
  DeviceEntityBase copyWithStateMassage(String stateMassage) => this;

  /// Copy with senderDeviceOs
  DeviceEntityBase copyWithSenderDeviceOs(String senderDeviceOs) => this;

  /// Copy with deviceSenderDeviceModel
  DeviceEntityBase copyWithDeviceSenderDeviceModel(
    String deviceSenderDeviceModel,
  ) =>
      this;

  /// Copy with currentUserId
  DeviceEntityBase copyWithSenderId(String userId) => this;

  /// Convert the device to the a dtos object in the infrastructure layer
  DeviceEntityDtoBase toInfrastructure() => DeviceEntityDtoBase();

  Future<Either<CoreFailure, Unit>> executeAction(
    EntitySingleRequest request,
  ) async {
    icLogger.e(
      'ExecuteAction is not implemented for device $_currentDeviceInfo '
      'property ${request.property.name} action ${request.action.name} value ${request.values}',
    );
    return const Left(CoreFailure.unexpected());
  }

  String get _currentDeviceInfo =>
      'cbjDeviceVendor ${cbjDeviceVendor.getOrCrash()}  entityTypes ${entityTypes.getOrCrash()}';

  Either<CoreFailure<String>, Unit> pleaseOverrideMessage() {
    icLogger.w(
      'Please override this method in the non generic implementation $_currentDeviceInfo',
    );
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action need to get overide',
      ),
    );
  }

  /// Return a list of all valid actions for this device
  List<String> getAllValidActions();

  /// Will replace action field with new action if it exists inside the object
  bool replaceActionIfExist(String action);

  /// List of all the properties that their value can be change when creating a
  /// scene for that device
  List<EntityProperties> getListOfPropertiesToChange();

  bool isPropertyAndActionCanBePreform({
    required EntityProperties property,
    required EntityActions action,
  }) {
    if (!getListOfPropertiesToChange().contains(property)) {
      icLogger.e(
        'Entity type ${entityTypes.getOrCrash()} does not contain property ${property.name}',
      );
      return false;
    }

    if (!property.containsAction(action)) {
      icLogger.e(
        'Entity type ${entityTypes.getOrCrash()} property ${property.name} does not containt actionType ${action.name}',
      );
      return false;
    }
    return true;
  }

  /// From 100-0 will be converted to 1.0-0.0
  double backToDecimalPointBrightness(int value) {
    const int oldMax = 100;
    const int oldMin = 0;
    const int oldRange = oldMax - oldMin;

    const double newMax = 1.0;
    const double newMin = 0;
    const double newRange = newMax - newMin;

    final double newValue = (((value - oldMin) * newRange) / oldRange) + newMin;

    return newValue;
  }

  Future wakeOnLan() => GeneralApiUtils.wakeOnLan(
        mac: devicesMacAddress.getOrCrash(),
        address: deviceLastKnownIp.getOrCrash(),
      );

  Duration minDurationBetweenRequsts = const Duration(milliseconds: 50);
  DateTime? lastRequest;

  int maxRequestsStack = 5;
  final Queue<EntitySingleRequest> _requestsQueue =
      Queue<EntitySingleRequest>();

  bool get isRequestsQueueEmpty => _requestsQueue.isEmpty;
  EntitySingleRequest get popFirstRequestsQueue => _requestsQueue.removeFirst();

  void addRequestInStack(EntitySingleRequest request) {
    if (_requestsQueue.length > maxRequestsStack) {
      _requestsQueue.removeLast();
      _requestsQueue.add(request);
      return;
    }

    _requestsQueue.add(request);

    if (_requestsQueue.length > 1) {
      return;
    }

    Timer.periodic(minDurationBetweenRequsts, (Timer timer) {
      if (_requestsQueue.isEmpty) {
        timer.cancel();
        return;
      }
      executeAction(_requestsQueue.removeFirst());
      if (_requestsQueue.isEmpty) {
        timer.cancel();
      }
    });
  }

  bool canActivateAction(EntitySingleRequest request) {
    final bool tempActiveAction = lastRequest == null ||
        DateTime.now().difference(lastRequest!) > minDurationBetweenRequsts;
    if (tempActiveAction) {
      lastRequest = DateTime.now();
    } else {
      addRequestInStack(request);
    }
    return tempActiveAction;
  }
}

int decimalToPercentage(double value) => (value * 100).toInt();

double percentageToDecimal(int value) => value / 100;

class DeviceEntityNotAbstract extends DeviceEntityBase {
  DeviceEntityNotAbstract()
      : super(
          uniqueId: CoreUniqueId(),
          entityUniqueId: EntityUniqueId('Entity unique id is empty'),
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.undefined),
          entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
          compUuid: DeviceCompUuid(const Uuid().v1()),
          cbjEntityName: CbjEntityName(value: 'Cbj entity Name is empty'),
          entityOriginalName:
              EntityOriginalName('Entity original name is empty'),
          deviceOriginalName: DeviceOriginalName(
            value: 'Entity original name that entity is exists on is empty',
          ),
          entityTypes: EntityType.type(EntityTypes.light),
          senderDeviceModel: DeviceSenderDeviceModel('a'),
          senderDeviceOs: DeviceSenderDeviceOs('b'),
          senderId: DeviceSenderId(),
          stateMassage: DeviceStateMassage(value: 'go'),
          powerConsumption: DevicePowerConsumption('0'),
          deviceUniqueId: DeviceUniqueId('Entity unique id is empty'),
          devicePort: DevicePort(value: '1'),
          deviceLastKnownIp: DeviceLastKnownIp(value: '1.1.1.1'),
          deviceHostName: DeviceHostName(value: 'deviceHostName is empty'),
          deviceMdns: DeviceMdns(value: 'deviceMdns is empty'),
          srvResourceRecord: DeviceSrvResourceRecord(),
          srvTarget: DeviceSrvTarget(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          mdnsServiceType: DeviceMdnsServiceType(),
          devicesMacAddress:
              DevicesMacAddress(value: 'devicesMacAddress is empty'),
          entityKey: EntityKey('entityKey is empty'),
          requestTimeStamp: RequestTimeStamp('requestTimeStamp is empty'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(
            'lastResponseFromDeviceTimeStamp is empty',
          ),
          entityCbjUniqueId: CoreUniqueId(),
          deviceVendor: DeviceVendor(),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        );

  @override
  DeviceEntityDtoBase toInfrastructure() => DeviceEntityDtoBase();

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() => [];

  @override
  bool replaceActionIfExist(String action) => false;

  @override
  List<EntityProperties> getListOfPropertiesToChange() => [];
}

class EntitySingleRequest {
  const EntitySingleRequest({
    required this.property,
    required this.action,
    required this.values,
  });

  final EntityProperties property;
  final EntityActions action;
  final HashMap<ActionValues, dynamic>? values;
}
