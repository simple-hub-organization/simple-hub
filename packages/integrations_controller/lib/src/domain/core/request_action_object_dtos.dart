import 'dart:collection';
import 'dart:convert';

import 'package:integrations_controller/integrations_controller.dart';

class RequestActionObjectDtos {
  RequestActionObjectDtos({
    required this.entitiesId,
    required this.property,
    required this.actionType,
    required this.value,
    this.vendors = const [],
  });

  factory RequestActionObjectDtos.fromDomain(RequestActionObject routineCbj) {
    return RequestActionObjectDtos(
      entitiesId: routineCbj.entityIds.toList(),
      property: routineCbj.property.name,
      vendors: routineCbj.vendors?.map((e) => e.name).toList() ?? [],
      actionType: routineCbj.actionType.name,
      value: HashMap<String, dynamic>.from(
        routineCbj.value.map(
          (key, value) => MapEntry(key.name, value),
        ),
      ),
    );
  }

  factory RequestActionObjectDtos.fromJsonString(String value) =>
      RequestActionObjectDtos.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
      );

  factory RequestActionObjectDtos.fromJson(Map<String, dynamic> json) =>
      RequestActionObjectDtos(
        entitiesId:
            List<String>.from(jsonDecode(json['entitiesId'] as String) as List),
        property: json['property'] as String,
        vendors: List<String>.from(json['vendors'] as List),
        actionType: json['actionType'] as String,
        value: HashMap<String, dynamic>.from(
          jsonDecode(json['value'] as String) as Map<String, dynamic>,
        ),
      );

  List<String> entitiesId;
  String property;
  List<String> vendors;
  String actionType;
  HashMap<String, dynamic> value;

  Map<String, dynamic> toJson() {
    return {
      'uniqueIdByVendor': jsonEncode(entitiesId),
      'entitiesId': jsonEncode(entitiesId),
      'property': property,
      'vendors': vendors,
      'actionType': actionType,
      'value': jsonEncode(value),
    };
  }

  String toJsonString() => jsonEncode(toJson());

  final String deviceDtoClassInstance = (RequestActionObjectDtos).toString();

  RequestActionObject toDomain() => RequestActionObject(
        entityIds: HashSet.from(entitiesId),
        property: EntityPropertiesExtension.fromString(property),
        vendors: HashSet.from(
          vendors.map((v) => VendorsAndServicesExtension.fromString(v)),
        ),
        actionType: EntityActionsExtension.fromString(actionType),
        value: HashMap<ActionValues, dynamic>.from(
          value.map(
            (key, value) =>
                MapEntry(ActionValuesExtension.fromString(key), value),
          ),
        ),
      );
}
